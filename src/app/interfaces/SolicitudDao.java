package app.interfaces;

import app.beans.Equipo;

public interface SolicitudDao {
	public Equipo buscarEquipo(int codigoPatrimonial);
}