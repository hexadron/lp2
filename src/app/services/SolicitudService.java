package app.services;

import app.beans.Equipo;
import app.dao.DaoFactory;
import app.dao.DaoFactory.Factories;
import app.interfaces.SolicitudDao;

public class SolicitudService {
	
	DaoFactory factory = DaoFactory.getFactory(Factories.MYSQL);
	
	public Equipo buscarEquipo(int codigoPatrimonial) {
		SolicitudDao dao = factory.getSolicitudDao();
		return dao.buscarEquipo(codigoPatrimonial);
	}

}
