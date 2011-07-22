package app.services;

import java.util.List;

import app.beans.DetalleSolicitud;
import app.beans.Solicitud;
import app.beans.Tecnico;
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

}