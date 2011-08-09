package app.beans;

import app.util.ORZ;

public class DetalleReparacion extends ORZ {

	private long id;
	private Reparacion reparacion;
	private String trabajo;
	private double costo;
	private double garantia;
	private String recomendaciones;

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

	public String getTrabajo() {
		return trabajo;
	}

	public void setTrabajo(String trabajo) {
		this.trabajo = trabajo;
	}

	public double getCosto() {
		return costo;
	}

	public void setCosto(double costo) {
		this.costo = costo;
	}

	public double getGarantia() {
		return garantia;
	}

	public void setGarantia(double garantia) {
		this.garantia = garantia;
	}

	public String getRecomendaciones() {
		return recomendaciones;
	}

	public void setRecomendaciones(String recomendaciones) {
		this.recomendaciones = recomendaciones;
	}
}
