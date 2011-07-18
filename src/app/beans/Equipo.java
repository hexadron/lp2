package app.beans;

import app.util.ORZ;

public class Equipo extends ORZ {
	private long id; // primary key
	private String codigoPatrimonial; //unique key
	private String denominacion;
	private String fabricante;
	private Area area;
	private String estado;

	public String getDenominacion() {
		return denominacion;
	}

	public void setDenominacion(String denominacion) {
		this.denominacion = denominacion;
	}

	public String getFabricante() {
		return fabricante;
	}

	public void setFabricante(String fabricante) {
		this.fabricante = fabricante;
	}

	public void setCodigoPatrimonial(String codigoPatrimonial) {
		this.codigoPatrimonial = codigoPatrimonial;
	}

	public String getCodigoPatrimonial() {
		return codigoPatrimonial;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getId() {
		return id;
	}

	public void setArea(Area area) {
		this.area = area;
	}

	public Area getArea() {
		return area;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getEstado() {
		return estado;
	}
}