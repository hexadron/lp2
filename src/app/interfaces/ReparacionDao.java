package app.interfaces;

import java.util.List;

import app.beans.DetalleSolicitud;
import app.beans.Reparacion;
import app.beans.Solicitud;
import app.beans.Tecnico;

public interface ReparacionDao {
	public List<Solicitud> getSolicitudesSinAsignar();
	public List<Tecnico> getTecnicos();
	public List<Object> getEquiposPorDetalles(Long sol);
	public void guardarReparaciones(String jsonparam);
}