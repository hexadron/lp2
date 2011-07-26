package app.beans;

import app.util.*;

public class Reparacion extends ORZ {

	private long id;
	private DetalleSolicitud detallesolicitud;
	private Equipo equipo;
	private Tecnico tecnico;
	
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
	
	public DetalleSolicitud getDetalleSolicitud() {
		return detallesolicitud;
	}
	
	public void setDetalleSolicitud(DetalleSolicitud detallesolicitud) {
		this.detallesolicitud = detallesolicitud;
	}

	public Equipo getEquipo() {
		return equipo;
	}

	public void setEquipo(Equipo equipo) {
		this.equipo = equipo;
	}

	public Tecnico getTecnico() {
		return tecnico;
	}

	public void setTecnico(Tecnico tecnico) {
		this.tecnico = tecnico;
	}

}

