package app.beans;

import app.util.ORZ;

public class DetalleSolicitud extends ORZ {
	
	private long id;
	private Solicitud solicitud;
	private Equipo equipo;
	private String problema;

	public Solicitud getSolicitud() {
		return solicitud;
	}

	public void setSolicitud(Solicitud solicitud) {
		this.solicitud = solicitud;
	}

	public Equipo getEquipo() {
		return equipo;
	}

	public void setEquipo(Equipo equipo) {
		this.equipo = equipo;
	}

	public String getProblema() {
		return problema;
	}

	public void setProblema(String problema) {
		this.problema = problema;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getId() {
		return id;
	}

}