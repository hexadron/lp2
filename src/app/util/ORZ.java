package app.util;

import java.io.Serializable;
import java.lang.reflect.*;
import java.sql.*;
import java.util.*;

public abstract class ORZ implements Serializable {
    
	private static final long serialVersionUID = 1L;

	public static <T> T find(Class<? extends ORZ> c, long id) {
        try {
            return c.newInstance().find(id);
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    @SuppressWarnings("unchecked")
    public <T> T find(long id) {
        Connection db = null;
        String sql = "SELECT * FROM " + getTable() + " WHERE id = ?";
        try {
            db = Database.getConnection();
            PreparedStatement ps = db.prepareStatement(sql);
            ps.setLong(1, id);
            
            ResultSet rs = ps.executeQuery();
            ResultSetMetaData rsmd = rs.getMetaData();
            
            if (rs.next()) {
                String colname, name;
                T o = (T) getClass().newInstance();
                for (int i = 1; i <= rsmd.getColumnCount(); i++) {
                    colname = rsmd.getColumnName(i);
                    name = colname.endsWith("_id") ? colname.replace("_id", "") : colname;
                    Object val = rs.getObject(colname);
                    if (val != null) {
                    		Method m = getSetter(name);
                    		Class<?> type = m.getParameterTypes()[0];
                    		if (type.getSuperclass() != null &&
                    				type.getSuperclass().equals(this.getClass().getSuperclass()))
                    			m.invoke(o, find((Class<? extends ORZ>) type, (Integer)val));
                    		else
                    			m.invoke(o, val);
                    }
                }
                return o;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Database.close(db);
        }
        return null;
    }
    
    public static <T> List<T> where(Class<? extends ORZ> c, String query, Object... values) {
        try {
            return c.newInstance().where(query, values);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    @SuppressWarnings("unchecked")
    public <T> List<T> where(String query, Object... values) {
        List<T> all = new ArrayList<T>();
        Connection db = null;
        String sql = "SELECT * FROM " + getTable() + " WHERE ";
        
        if (query.split(" ").length > 1) // si contiene una condicion
            sql += query; 
        else
            sql += query + " = ?";
        
        try {
            db = Database.getConnection();
            PreparedStatement ps = db.prepareStatement(sql);
            
            for (int i = 0; i < values.length; i++)
                ps.setObject(i + 1, values[i]);
            
            ResultSet rs = ps.executeQuery();
            ResultSetMetaData rsmd = rs.getMetaData();
            
            while (rs.next()) {
                String name, colname;
                T o = (T) getClass().newInstance();
                for (int i = 1; i <= rsmd.getColumnCount(); i++) {
                		colname = rsmd.getColumnName(i); 
                    name = colname.endsWith("_id") ? colname.replace("_id", "") : colname;
                    Object val = rs.getObject(colname);
                    if (val != null) {
                    		Method m = getSetter(name);
                    		Class<?> type = m.getParameterTypes()[0];
                    		if (type.getSuperclass() != null &&
                        		type.getSuperclass().equals(this.getClass().getSuperclass()))
                        			m.invoke(o, find((Class<? extends ORZ>) type, (Integer) val));
                    		else
                        		m.invoke(o, val);
                    }
                }
                all.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Database.close(db);
        }
        return all;
    }
    
    @SuppressWarnings("unchecked")
    public <T> T save() {
        if (getGetter("id") != null) {
            try {
                Object id = getGetter("id").invoke(this);
                if (id.toString().equals("0"))
                    create();
                else
                    update();
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else
        		create();
        return (T) this;
    }
    
    public static <T> T save(Class<? extends ORZ> c, Object... params) {
        try {
            return c.newInstance().save(params);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    @SuppressWarnings("unchecked")
    public <T> T save(Object... params) {
        if (getGetter("id") != null) {
            try {
                Object id = getGetter("id").invoke(this);
                if (id.toString().equals("0"))
                    create(params);
                else
                    update(params);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
        		create(params);
        }
        return (T) this;
    }
    
    @SuppressWarnings("unchecked")
    public <T> T create() {
        Connection db = null;
        StringBuilder sql = new StringBuilder();
        sql.append("INSERT INTO " + getTable() + " (");
        String[] fields = getTableFields().split(", ");
        
        for (int i = 0; i < fields.length; i++)
            sql.append(fields[i]).append(", ");
        
        sql.delete(sql.length() - 2, sql.length());
        sql.append(") VALUES (");
        
        for (int i = 0; i < fields.length; i++)
            sql.append("?, ");
        
        sql.delete(sql.length() - 2, sql.length());
        sql.append(")");
        try {
            db = Database.getConnection();
            PreparedStatement ps = db.prepareStatement(sql.toString(), 
                        Statement.RETURN_GENERATED_KEYS);
            for (int i = 0; i <= fields.length - 1; i++) {
            		Field f = null;
            		if (fields[i].endsWith("_id"))
            			f = getClass().getDeclaredField(fields[i].
            					substring(0, fields[i].length() - 3));
            		else
            			f = getClass().getDeclaredField(fields[i]);
            		if (f.getType().getSuperclass().equals(this.getClass().getSuperclass())) {
            			Method idGetter = null;
            			Object obj = getGetter(f.getName()).invoke(this);
            			if (obj.getClass().getMethod("getId") != null)
            				idGetter = obj.getClass().getMethod("getId");
            			ps.setObject(i + 1, idGetter.invoke(obj));
            		} else
            			ps.setObject(i + 1, getGetter(f.getName()).invoke(this));
            }
            
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            
            if (rs.next())
                getSetter("id").invoke(this, rs.getLong(1));
            return (T) this;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Database.close(db);
        }
        return null;
    }
    
    @SuppressWarnings("unchecked")
    public <T> T create(Object... params) {
        Connection db = null;
        StringBuilder sql = new StringBuilder();
        sql.append("INSERT INTO " + getTable() + " (");
        String[] fields = getTableFields().split(", ");
        
        for (int i = 0; i < fields.length; i++)
            sql.append(fields[i]).append(", ");
        
        sql.delete(sql.length() - 2, sql.length());
        sql.append(") VALUES (");
        
        for (int i = 0; i < fields.length; i++)
            sql.append("?, ");
        
        sql.delete(sql.length() - 2, sql.length());
        sql.append(")");
        try {
            db = Database.getConnection();
            PreparedStatement ps = db.prepareStatement(sql.toString(), 
                        Statement.RETURN_GENERATED_KEYS);
            
            for (int i = 1; i <= params.length; i++)
                ps.setObject(i, params[i - 1]);
            
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            
            if (rs.next())
                updateAttributes(rs.getLong(1));
            return (T) this;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Database.close(db);
        }
        return null;
    }
    
    @SuppressWarnings("unchecked")
    public <T> T update() {
        Connection db = null;
        
        StringBuilder sql = new StringBuilder();
        sql.append("UPDATE " + getTable() + " SET ");
        String[] fields = getTableFields().split(", ");
        
        for (int i = 0; i < fields.length; i++)
            sql.append(fields[i]).append(" = ?, ");
        
        sql.delete(sql.length() - 2, sql.length());
        sql.append(" WHERE id = ?");
        try {
            db = Database.getConnection();
            PreparedStatement ps = db.prepareStatement(sql.toString());
            
            int i = 1;
            for (; i <= fields.length; i++) {
                Field f = getClass().getDeclaredField(fields[i - 1]);
                ps.setObject(i, getGetter(f.getName()).invoke(this));
            }
            
            ps.setLong(i, (Long) getGetter("id").invoke(this));
            ps.executeUpdate();
            return (T) this;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Database.close(db);
        }
        return null;
    }
    
    @SuppressWarnings("unchecked")
    public <T> T update(Object... params) {
        Connection db = null;
        
        StringBuilder sql = new StringBuilder();
        sql.append("UPDATE " + getTable() + " SET ");
        String[] fields = getTableFields().split(", ");
        
        for (int i = 0; i < fields.length; i++)
            sql.append(fields[i]).append(" = ?, ");
        
        sql.delete(sql.length() - 2, sql.length());
        sql.append(" WHERE id = ?");
        
        try {
            db = Database.getConnection();
            PreparedStatement ps = db.prepareStatement(sql.toString());
            
            int i = 1;
            for (; i <= params.length; i++)
                ps.setObject(i, params[i - 1]);
            
            ps.setLong(i, (Long) getGetter("id").invoke(this));
            ps.executeUpdate();
            updateAttributes((Long) getGetter("id").invoke(this));
            return (T) this;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Database.close(db);
        }
        return null;
    }

    @SuppressWarnings("unchecked")
    public <T> T delete() {
        Connection db = null;
        String sql = "DELETE FROM " + getTable() + " WHERE id = ?";
        try {
            db = Database.getConnection();
            PreparedStatement ps = db.prepareStatement(sql);
            ps.setLong(1, (Long) getGetter("id").invoke(this));
            ps.executeUpdate();
            return (T) this;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Database.close(db);
        }
        return null;
    }
    
    public static <T> T delete(Class<? extends ORZ> c, long id) {
        Connection db = null;
        try {
            String sql = "DELETE FROM " + c.newInstance().getTable() + " WHERE id = ?";
            T o = c.newInstance().find(id);
            db = Database.getConnection();
            PreparedStatement ps = db.prepareStatement(sql);
            ps.setLong(1, id);
            ps.executeUpdate();
            return o;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Database.close(db);
        }
        return null;
    }
    
    public String getTableFields() {
        try {
            Connection cn = Database.getConnection();

            StringBuilder fields = new StringBuilder();
            PreparedStatement ps = cn.prepareStatement("describe " + getTable());
            ResultSet rs = ps.executeQuery();
            
            while (rs.next())
            	if (!(rs.getString(1).equals("id")))
            		fields.append(rs.getString(1)).append(", ");
            
            fields.delete(fields.lastIndexOf(","), fields.length());

            return fields.toString();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    private String getTableFields(Class<?> c, String prefix) {
        try {
        	Connection cn = Database.getConnection();

            StringBuilder fields = new StringBuilder();
            PreparedStatement ps = cn.prepareStatement("describe " + getTable(c.getName()));
            ResultSet rs = ps.executeQuery();
            
            while (rs.next())
            	if (!(rs.getString(1).equals("id")))
            		fields.append(prefix).append(rs.getString(1)).append(", ");
            
            fields.delete(fields.lastIndexOf(","), fields.length());

            return fields.toString();
        } catch (SQLException e) {
            e.printStackTrace();
        } 
        return null;
    }
    
    @SuppressWarnings("unchecked")
    private <T> T updateAttributes(long id) {
        T o = find(id);
        for (Method m : o.getClass().getDeclaredMethods()) {
            if (m.getName().startsWith("set")) {
                StringBuilder setter = new StringBuilder(m.getName());
                String field = setter.delete(0, 3).toString().toLowerCase();
                try {
                    Object val = getGetter(field).invoke(o);
                    getSetter(field).invoke(this, val);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return (T) this;
    }
    
    private Method getGetter(String field) {
        return getGetter(field, getClass());
    }
    
    private Method getGetter(String field, Class<?> c) {
        for (Method m : c.getDeclaredMethods())
            if (m.getName().startsWith("get"))
                if (m.getName().toLowerCase().endsWith(field))
                    return m;
        return null;
    }
    
    private Method getSetter(String field) {
        return getSetter(field, getClass());
    }
    
    private Method getSetter(String field, Class<?> c) {
        for (Method m : c.getDeclaredMethods())
            if (m.getName().startsWith("set"))
                if (m.getName().toLowerCase().endsWith(field.toLowerCase()))
                    return m;
        return null;
    }

    public String getTable() {
        return getTable(getClass().getSimpleName());
    }
    
    private String getTable(String name) {
        return name.toLowerCase().toString();
    }
    
    /* ActiveRelation? No U_U */
    
    public <T> List<T> parent(Class<T> c) {
        List<T> all = new ArrayList<T>();
        Connection db = null;
        
        String sql = "SELECT " + getTableFields(c, "parent.") +
        " FROM " + getTable(c.getName()) + " AS parent INNER JOIN " + 
        getTable(getClass().getName()) + " AS child ON child." +
        getTable(c.getName()) + "_id = parent.id WHERE child.id = ?";
        
        try {
            db = Database.getConnection();
            PreparedStatement ps = db.prepareStatement(sql);
            ps.setLong(1, (Long) getGetter("id").invoke(this));
            ResultSet rs = ps.executeQuery();
            ResultSetMetaData rsmd = rs.getMetaData();
            
            while (rs.next()) {
                String name;
                T o = c.newInstance();
                for (int i = 1; i <= rsmd.getColumnCount(); i++) {
                    name = rsmd.getColumnName(i);
                    Field f = c.getDeclaredField(name);
                    Object val = rs.getObject(name);
                    getSetter(f.getName(), c).invoke(o, val);
                }
                all.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Database.close(db);
        }
        return all;
    }
    
    public <T> List<T> children(Class<T> c) {
        List<T> all = new ArrayList<T>();
        Connection db = null;
        
        String sql = "SELECT " + getTableFields(c, "child.") +
        " FROM " + getTable(c.getName()) + " AS child INNER JOIN " + 
        getTable(getClass().getName()) + " AS parent ON child." +
        getTable(getClass().getName()) + "_id = parent.id WHERE parent.id = ?";
        
        try {
            db = Database.getConnection();
            PreparedStatement ps = db.prepareStatement(sql);
            ps.setLong(1, (Long) getGetter("id").invoke(this));
            ResultSet rs = ps.executeQuery();
            ResultSetMetaData rsmd = rs.getMetaData();
            
            while (rs.next()) {
                String name;
                T o = c.newInstance();
                for (int i = 1; i <= rsmd.getColumnCount(); i++) {
                    name = rsmd.getColumnName(i);
                    Field f = c.getDeclaredField(name);
                    Object val = rs.getObject(name);
                    getSetter(f.getName(), c).invoke(o, val);
                }
                all.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Database.close(db);
        }
        return all;
    }
    
    public boolean equals(Object o) {
        try {
            for (Field f : this.getClass().getDeclaredFields())
                if (o.getClass().getDeclaredField(f.getName()) != null)
                    if (getGetter(f.getName()).invoke(o) != getGetter(f.getName()).invoke(this))
                    	return false;
        } catch (Exception e) {
            return false;
        }
        return true;
    }
    
    public int hashCode() {
        //por terminar
        return 1;
    }

}