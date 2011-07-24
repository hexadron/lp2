package app.beans;

import app.util.ORZ;

public class Usuario extends ORZ {

	private long id;
	private String usuario;
	private String password;
	private long perfil;
	private long area;

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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public long getPerfil() {
		return perfil;
	}

	public void setPerfil(long perfil) {
		this.perfil = perfil;
	}

	public long getArea() {
		return area;
	}

	public void setArea(long area) {
		this.area = area;
	}

}