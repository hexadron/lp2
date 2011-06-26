package app.beans;

import app.util.ObjectRelationalZapper;

public class Perfil extends ObjectRelationalZapper {

	private long id;
	private String descripcion;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getDescripcion() {
		return descripcion;
	}

}
