package app.beans;

import app.util.ORZ;

public class Reparacion extends ORZ {
	private long solicitud;
	private long equipo;
	private long tecnico;

	public long getSolicitud() {
		return solicitud;
	}

	public void setSolicitud(long solicitud) {
		this.solicitud = solicitud;
	}

	public long getEquipo() {
		return equipo;
	}

	public void setEquipo(long equipo) {
		this.equipo = equipo;
	}

	public long getTecnico() {
		return tecnico;
	}

	public void setTecnico(long tecnico) {
		this.tecnico = tecnico;
	}

}
