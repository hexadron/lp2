package app.beans;

import java.sql.Timestamp;

import app.util.ORZ;

public class Solicitud extends ORZ {
	private long id;
	private Timestamp fecha;
	private Usuario usuario;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public void setFecha(Timestamp fecha) {
		this.fecha = fecha;
	}

	public Timestamp getFecha() {
		return fecha;
	}
}
