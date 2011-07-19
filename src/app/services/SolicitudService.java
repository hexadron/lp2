package app.services;

import app.beans.Equipo;
import app.beans.Solicitud;
import app.beans.Usuario;
import app.dao.DaoFactory;
import app.dao.DaoFactory.Factories;
import app.interfaces.SolicitudDao;

public class SolicitudService {
	
	DaoFactory factory = DaoFactory.getFactory(Factories.MYSQL);
	
	public Equipo buscarEquipo(long codigoPatrimonial) {
		SolicitudDao dao = factory.getSolicitudDao();
		return dao.buscarEquipo(codigoPatrimonial);
	}

	public Solicitud guardar(String jsonparam, Usuario usuario) {
		SolicitudDao dao = factory.getSolicitudDao();
		return dao.guardar(jsonparam, usuario);
	}

}
