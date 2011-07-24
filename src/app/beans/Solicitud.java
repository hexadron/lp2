package app.beans;

import java.sql.Timestamp;

import app.util.ORZ;

public class Solicitud extends ORZ {
	private long id;
	private Timestamp fecha;
	private long usuario;
	private boolean enatencion;
	private String descripcionArea;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getUsuario() {
		return usuario;
	}

	public void setUsuario(long usuario) {
		this.usuario = usuario;
		setDescripcionArea(((Area)Area.find(Area.class, usuario)).getDescripcion());
	}

	public void setFecha(Timestamp fecha) {
		this.fecha = fecha;
	}

	public Timestamp getFecha() {
		return fecha;
	}

	public void setEnatencion(boolean enatencion) {
		this.enatencion = enatencion;
	}

	public boolean getEnatencion() {
		return enatencion;
	}

	public void setDescripcionArea(String descripcionArea) {
		this.descripcionArea = descripcionArea;
	}

	public String getDescripcionArea() {
		return descripcionArea;
	}
}
