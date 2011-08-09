package app.beans;

import app.util.ORZ;

public class OrdenTerceros extends ORZ {

	private long id;
	private Reparacion reparacion;
	private String sustentacion;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Reparacion getReparacion() {
		return reparacion;
	}

	public void setReparacion(Reparacion reparacion) {
		this.reparacion = reparacion;
	}

	public String getSustentacion() {
		return sustentacion;
	}

	public void setSustentacion(String sustentacion) {
		this.sustentacion = sustentacion;
	}

}
