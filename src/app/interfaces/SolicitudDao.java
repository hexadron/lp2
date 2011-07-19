package app.interfaces;

import app.beans.Equipo;
import app.beans.Solicitud;
import app.beans.Usuario;

public interface SolicitudDao {
	public Equipo buscarEquipo(long codigoPatrimonial);
	public Solicitud guardar(String jsonparam, Usuario usuario);
}