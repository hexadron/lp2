package app.beans;

import app.util.ORZ;

public class Equipo extends ORZ {
	private long codigoPatrimonial;
	private String denominacion;
	private String fabricante;
	private Area area;
	private boolean enproceso;
	private boolean dadodebaja;
	private boolean asignado;

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

	public void setCodigoPatrimonial(long codigoPatrimonial) {
		this.codigoPatrimonial = codigoPatrimonial;
	}

	public long getCodigoPatrimonial() {
		return codigoPatrimonial;
	}

	public void setArea(Area area) {
		this.area = area;
	}

	public Area getArea() {
		return area;
	}

	public void setDadodebaja(boolean dadodebaja) {
		this.dadodebaja = dadodebaja;
	}

	public boolean getDadodebaja() {
		return dadodebaja;
	}

	public void setEnproceso(boolean enproceso) {
		this.enproceso = enproceso;
	}

	public boolean getEnproceso() {
		return enproceso;
	}

	public void setAsignado(boolean asignado) {
		this.asignado = asignado;
	}

	public boolean getAsignado() {
		return asignado;
	}

	protected String getColumnaBase() {
		return "codigoPatrimonial";
	}
	
}
