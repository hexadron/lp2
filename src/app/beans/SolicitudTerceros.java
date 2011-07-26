package app.beans;

import java.sql.Timestamp;

import app.util.ORZ;

public class SolicitudTerceros extends ORZ {
	private long id;
	private Timestamp fecha;
	private String sustentacion;
	private Reparacion reparacion;
	private boolean enatencion;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Timestamp getFecha() {
		return fecha;
	}

	public void setFecha(Timestamp fecha) {
		this.fecha = fecha;
	}

	public String getSustentacion() {
		return sustentacion;
	}

	public void setSustentacion(String sustentacion) {
		this.sustentacion = sustentacion;
	}

	public Reparacion getReparacion() {
		return reparacion;
	}

	public void setReparacion(Reparacion reparacion) {
		this.reparacion = reparacion;
	}

	public boolean isEnatencion() {
		return enatencion;
	}

	public void setEnatencion(boolean enatencion) {
		this.enatencion = enatencion;
	}
}