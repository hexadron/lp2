package app.beans;

import app.util.ORZ;

public class Modulo extends ORZ {
	
	private long id;
	private String descripcion;
	private String uri;
	private String shorthand;

	public String getUri() {
		return uri;
	}

	public void setUri(String uri) {
		this.uri = uri;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public void setShorthand(String shorthand) {
		this.shorthand = shorthand;
	}

	public String getShorthand() {
		return shorthand;
	}

}
