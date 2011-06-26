package app.beans;

import app.util.ObjectRelationalZapper;

public class Area extends ObjectRelationalZapper {

	private int id;
	private int descripcion;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(int descripcion) {
		this.descripcion = descripcion;
	}
}
