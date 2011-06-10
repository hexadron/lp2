package app.util;

import java.lang.reflect.*;
import java.sql.*;
import java.util.*;

public abstract class ORZ {

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
				String name;
				T o = (T) getClass().newInstance();
				for (int i = 1; i <= rsmd.getColumnCount(); i++) {
					name = rsmd.getColumnName(i);
					Field f = getField(name);
					f.set(this, rs.getObject(name));
				}
				return o;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		} finally {
			Database.close(db);
		}
		return null;
	}

	public static <T> List<T> where(Class<? extends ORZ> c, String query, Object... values) {
		try {
			return c.newInstance().where(query, values);
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
		return null;
	}

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
					Field f = getField(name);
					Object val = rs.getObject(name);
					f.set(this, val);
				}
				all.add(o);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		} finally {
			Database.close(db);
		}
		return all;
	}

	public <T> T save() {
		Field id = getField("id");
		try {
			if (id.get(this) != null) {
				if (id.toString().equals("0"))
					create();
				else
					update();
			}
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
		return (T) this;
	}

	public static <T> T save(Class<? extends ORZ> c, Object... params) {
		try {
			return c.newInstance().save(params);
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
		return null;
	}

	public <T> T save(Object... params) {
		Field id = getField("id");
		try {
			if (id.get(this) != null) {
				if (id.toString().equals("0"))
					create(params);
				else
					update(params);
			}
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
		return (T) this;
	}

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
				ps.setObject(i + 1, f.get(this));
			}

			ps.executeUpdate();
			ResultSet rs = ps.getGeneratedKeys();

			if (rs.next()) {
				Field f = getClass().getDeclaredField("id");
				f.set(this, rs.getLong(1));
			}
			return (T) this;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (NoSuchFieldException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} finally {
			Database.close(db);
		}
		return null;
	}

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
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} finally {
			Database.close(db);
		}
		return null;
	}

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
				ps.setObject(i, f.get(this));
			}

			Object id = getClass().getDeclaredField("id").get(this);
			ps.setLong(i, (Long) id);
			ps.executeUpdate();
			return (T) this;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (NoSuchFieldException e) {
			e.printStackTrace();
		} finally {
			Database.close(db);
		}
		return null;
	}

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

			Object id = getClass().getDeclaredField("id").get(this);
			
			ps.setLong(i, (Long) id);
			ps.executeUpdate();
			updateAttributes((Long) id);
			return (T) this;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (NoSuchFieldException e) {
			e.printStackTrace();
		} finally {
			Database.close(db);
		}
		return null;
	}

	public <T> T delete() {
		Connection db = null;
		String sql = "DELETE FROM " + getTable() + " WHERE id = ?";
		try {
			db = Database.getConnection();
			PreparedStatement ps = db.prepareStatement(sql);
			Object id = getClass().getDeclaredField("id").get(this);
			ps.setLong(1, (Long) id);
			ps.executeUpdate();
			return (T) this;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (NoSuchFieldException e) {
			e.printStackTrace();
		} finally {
			Database.close(db);
		}
		return null;
	}

	public static <T> T delete(Class<? extends ORZ> c, long id) {
		Connection db = null;
		try {
			String sql = "DELETE FROM " + c.newInstance().getTable()
					+ " WHERE id = ?";
			T o = c.newInstance().find(id);
			db = Database.getConnection();
			PreparedStatement ps = db.prepareStatement(sql);
			ps.setLong(1, id);
			ps.executeUpdate();
			return o;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} finally {
			Database.close(db);
		}
		return null;
	}

	public String getTableFields() {
		try {
			Connection cn = Database.getConnection();
			DatabaseMetaData databaseMetaData = cn.getMetaData();
			ResultSet rs = databaseMetaData.getColumns(null, null, getTable(),
					"%");
			StringBuilder fields = new StringBuilder();

			while (rs.next())
				if (!(rs.getString("COLUMN_NAME").equals("id")))
					for (Field f : getClass().getDeclaredFields())
						if (f.getName().equals(rs.getString("COLUMN_NAME")))
							fields.append(f.getName()).append(", ");

			fields.delete(fields.length() - 2, fields.length());
			return fields.toString();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	private String getAllTableFields(Class<?> c, String prefix) {
		try {
			Connection cn = Database.getConnection();
			DatabaseMetaData databaseMetaData = cn.getMetaData();
			ResultSet rs = databaseMetaData.getColumns(null, null,
					getTable(c.getName()), "%");

			StringBuilder fields = new StringBuilder();
			while (rs.next())
				for (Field f : c.getDeclaredFields())
					if (f.getName().equals(rs.getString("COLUMN_NAME")))
						fields.append(prefix).append(f.getName()).append(", ");

			fields.delete(fields.lastIndexOf(","), fields.length());
			return fields.toString();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	private <T> T updateAttributes(long id) {
		T o = find(id);
		for (Method m : o.getClass().getDeclaredMethods()) {
			if (m.getName().startsWith("set")) {
				StringBuilder setter = new StringBuilder(m.getName());
				String name = setter.delete(0, 3).toString().toLowerCase();
				try {
					Field f = getField(name);
					Field other = o.getClass().getDeclaredField(name);
					f.set(this, other);
				} catch (IllegalArgumentException e) {
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					e.printStackTrace();
					e.printStackTrace();
				} catch (SecurityException e) {
					e.printStackTrace();
				} catch (NoSuchFieldException e) {
					e.printStackTrace();
				}
			}
		}
		return (T) this;
	}
	
	public Field getField(String name) {
		try {
			Field f = getClass().getDeclaredField(name);
			f.setAccessible(true);
			return f;
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (NoSuchFieldException e) {
			e.printStackTrace();
		}
		return null;
	}

	public String getTable() {
		return getTable(getClass().getSimpleName());
	}

	private String getTable(String name) {
		StringBuilder table = new StringBuilder();
		table.append(name.toLowerCase());
		// int ex = table.lastIndexOf("dto");
		// table.replace(ex, table.length(), "");
		return table.toString();
	}

	/* ActiveRelation? No U_U */

	public <T> List<T> parent(Class<T> c) {
		List<T> all = new ArrayList<T>();
		Connection db = null;

		String sql = "SELECT " + getAllTableFields(c, "parent.") + " FROM "
				+ getTable(c.getName()) + " AS parent INNER JOIN "
				+ getTable(getClass().getName()) + " AS child ON child."
				+ getTable(c.getName()) + "_id = parent.id WHERE child.id = ?";

		try {
			db = Database.getConnection();
			PreparedStatement ps = db.prepareStatement(sql);
			ps.setLong(1, (Long) getField("id").get(this));
			ResultSet rs = ps.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();

			while (rs.next()) {
				String name;
				T o = c.newInstance();
				for (int i = 1; i <= rsmd.getColumnCount(); i++) {
					name = rsmd.getColumnName(i);
					Field f = c.getDeclaredField(name);
					f.setAccessible(true);
					f.set(o, rs.getObject(name));
				}
				all.add(o);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (NoSuchFieldException e) {
			e.printStackTrace();
		} finally {
			Database.close(db);
		}
		return all;
	}

	public <T> List<T> children(Class<T> c) {
		List<T> all = new ArrayList<T>();
		Connection db = null;

		String sql = "SELECT " + getAllTableFields(c, "child.") + " FROM "
				+ getTable(c.getName()) + " AS child INNER JOIN "
				+ getTable(getClass().getName()) + " AS parent ON child."
				+ getTable(getClass().getName())
				+ "_id = parent.id WHERE parent.id = ?";

		try {
			db = Database.getConnection();
			PreparedStatement ps = db.prepareStatement(sql);
			ps.setLong(1, (Long) getField("id").get(this));
			ResultSet rs = ps.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();

			while (rs.next()) {
				String name;
				T o = c.newInstance();
				for (int i = 1; i <= rsmd.getColumnCount(); i++) {
					name = rsmd.getColumnName(i);
					Field f = c.getDeclaredField(name);
					f.setAccessible(true);
					f.set(o, rs.getObject(name));
				}
				all.add(o);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (NoSuchFieldException e) {
			e.printStackTrace();
		} finally {
			Database.close(db);
		}
		return all;
	}

}
