package app.beans;

import app.util.ORZ;

public class DetalleSolicitud extends ORZ {
	
	private long solicitud;
	private long equipo;
	private String problema;

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

	public String getProblema() {
		return problema;
	}

	public void setProblema(String problema) {
		this.problema = problema;
	}

}