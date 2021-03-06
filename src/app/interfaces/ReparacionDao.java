package app.interfaces;

import java.util.List;

import app.beans.DetalleReparacion;
import app.beans.DetalleSolicitud;
import app.beans.OrdenTerceros;
import app.beans.Reparacion;
import app.beans.Solicitud;
import app.beans.Tecnico;

public interface ReparacionDao {
	
	public List<Solicitud> getSolicitudesSinAsignar();
	
	public List<Tecnico> getTecnicos();
	
	public List<DetalleSolicitud> getDetalles(Long sol);

	public void guardarReparaciones(String jsonparam);

	public List<Reparacion> getReparacionesAsignadas(long id);

	public Reparacion getDatosReparacion(Long id);

	public void registrarDiagnostico(long reparacion, String diagnostico, String prioridad);

	public void registrarBaja(long id);

	public List<Reparacion> getReparacionesDiagnosticadas(long id);

	public void registrarReparacion(DetalleReparacion d);

	public void registrarOrdenTerceros(OrdenTerceros o);

}
