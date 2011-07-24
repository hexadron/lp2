package app.util;

import java.io.Serializable;
import java.lang.reflect.*;
import java.sql.*;
import java.util.*;
import static app.util.Utilities.*;

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
        String sql = "SELECT * FROM " + getTable() + " WHERE " + getColumnaBase() + " = ?";
        try {
            db = Database.getConnection();
            PreparedStatement ps = db.prepareStatement(sql);
            ps.setLong(1, id);
            
            ResultSet rs = ps.executeQuery();
            ResultSetMetaData rsmd = rs.getMetaData();
            
            if (rs.next()) {
				String name;
				T o = (T) getClass().newInstance();
				for (int i = 1; i <= rsmd.getColumnCount(); i++) {
					name = rsmd.getColumnName(i);
					Field f = getClass().getDeclaredField(name);
					Object val = rs.getObject(name);
					if (f != null && val != null)
						getSetter(f.getName()).invoke(o, val);
				}
				return ObjectToUTF(o);
			}
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Database.close(db);
        }
        return null;
    }
    
	public static <T> List<T> all(Class<? extends ORZ> c) {
		try {
			return c.newInstance().where("1 = 1");
		} catch (Exception e) {
			e.printStackTrace();
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
				String name;
				T o = (T) getClass().newInstance();
				for (int i = 1; i <= rsmd.getColumnCount(); i++) {
					name = rsmd.getColumnName(i);
					Field f = getClass().getDeclaredField(name);
					Object val = rs.getObject(name);
					getSetter(f.getName()).invoke(o, val);
				}
				all.add(ObjectToUTF(o));
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
		ObjectToISO(this);
		if (getGetter(getColumnaBase()) != null) {
			try {
				Object id = getGetter(getColumnaBase()).invoke(this);
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
				Field f = getClass().getDeclaredField(fields[i]);
				ps.setObject(i + 1, getGetter(f.getName()).invoke(this));
			}
			
			ps.executeUpdate();
			ResultSet rs = ps.getGeneratedKeys();
			if (rs.next())
				getSetter(getColumnaBase()).invoke(this, rs.getLong(1));
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
        sql.append(" WHERE " + getColumnaBase() + " = ?");
        try {
        	db = Database.getConnection();
			PreparedStatement ps = db.prepareStatement(sql.toString());
			int i = 1;
			for (; i <= fields.length; i++) {
				Field f = getClass().getDeclaredField(fields[i - 1]);
				ps.setObject(i, getGetter(f.getName()).invoke(this));
			}
			ps.setLong(i, (Long) getGetter(getColumnaBase()).invoke(this));
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
    public <T> T delete() {
        Connection db = null;
        String sql = "DELETE FROM " + getTable() + " WHERE " + getColumnaBase() + " = ?";
        try {
            db = Database.getConnection();
            PreparedStatement ps = db.prepareStatement(sql);
            ps.setLong(1, (Long) getGetter(getColumnaBase()).invoke(this));
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
            String sql = "DELETE FROM " + c.newInstance().getTable() + " WHERE " + 
            		c.newInstance().getColumnaBase() + " = ?";
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
	Connection db = null;
        try {
            db = Database.getConnection();

            StringBuilder fields = new StringBuilder();
            PreparedStatement ps = cn.prepareStatement("describe " + getTable());
            ResultSet rs = ps.executeQuery();
            
            while (rs.next())
            	if (!(rs.getString(1).equals(getColumnaBase())))
            		fields.append(rs.getString(1)).append(", ");
            
            fields.delete(fields.lastIndexOf(","), fields.length());

            return fields.toString();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Database.close(db);
        }
        return null;
    }
    
    private Method getGetter(String field) {
        return getGetter(field, getClass());
    }
    
    private Method getGetter(String field, Class<?> c) {
        for (Method m : c.getDeclaredMethods())
            if (m.getName().startsWith("get"))
                if (m.getName().toLowerCase().endsWith(field.toLowerCase()))
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
    
    protected String getColumnaBase() {
    		return "id";
    }

}