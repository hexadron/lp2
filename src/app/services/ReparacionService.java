package app.services;

import java.util.List;

import app.beans.*;
import app.dao.DaoFactory;
import app.dao.DaoFactory.Factories;
import app.interfaces.ReparacionDao;

public class ReparacionService {
	
	DaoFactory factory = DaoFactory.getFactory(Factories.MYSQL);
	ReparacionDao dao = factory.getReparacionDao();

	public List<Solicitud> getSolicitudesSinAsignar() {
		return dao.getSolicitudesSinAsignar();
	}

	public List<Tecnico> getTecnicos() {
		return dao.getTecnicos();
	}

	public List<DetalleSolicitud> getDetalles(Long sol) {
		return dao.getDetalles(sol);
	}

	public void guardarReparaciones(String json) {
		dao.guardarReparaciones(json);
	}

	public List<Reparacion> getReparacionesAsignadas(long id) {
		return dao.getReparacionesAsignadas(id);
	}

	public Reparacion getDatosReparacion(Long id) {
		return dao.getDatosReparacion(id);
	}

	public void registrarDiagnostico(long reparacion, String diagnostico,
			String prioridad) {
		dao.registrarDiagnostico(reparacion, diagnostico, prioridad);
	}

}
