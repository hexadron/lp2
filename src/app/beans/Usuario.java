package app.beans;

import java.util.List;

import app.util.ORZ;

public class Usuario extends ORZ {
	private long id;
	private String usuario;
	private String nombre;
	private String password;
	private Rol rol;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setRol(Rol rol) {
		this.rol = rol;
	}

	public Rol getRol() {
		return rol;
	}

	public static String validate(String user, String password) {
		List<Usuario> u = Usuario.where(Usuario.class, "usuario", user);
		if (u.size() == 0)
			return null;
		Usuario x = u.get(0);
		if (x == null || !x.getPassword().equals(password))
			return null;
		return x.getRol().getNombre();
	}
}