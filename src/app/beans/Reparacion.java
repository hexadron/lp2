package app.beans;

import app.util.*;

public class Reparacion extends ORZ {

	private long id;
	private DetalleSolicitud detallesolicitud;
	private Equipo equipo;
	private Tecnico tecnico;
	private String diagnostico;
	private String prioridad;
	private boolean atendida;
	
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

	public void setDiagnostico(String diagnostico) {
		this.diagnostico = diagnostico;
	}

	public String getDiagnostico() {
		return diagnostico;
	}

	public void setPrioridad(String prioridad) {
		this.prioridad = prioridad;
	}

	public String getPrioridad() {
		return prioridad;
	}

	public void setAtendida(boolean atendida) {
		this.atendida = atendida;
	}

	public boolean getAtendida() {
		return atendida;
	}

}

