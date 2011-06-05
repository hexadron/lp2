package app.beans;

import app.util.ORZ;

public class Usuario extends ORZ {
	private long id;
	private String nombre;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public static boolean isAdmin(String user, String password) {
//		Usuario usuario = (Usuario) Usuario.where(Usuario.class, "nombre = ? and password = ?", user, password).get(0);
//		return usuario.getTipo().equals("admin") ? true : false;
		return true;
	}

}