package app.dao;

import app.interfaces.*;

public class MySQLDaoFactory extends DaoFactory {

	@Override
	public AdministradorDao getAdministradorDao() {
		return new MySQLAdministradorDao();
	}

	@Override
	public SecurityDao getSecurityDao() {
		return new MySqlSecurityDao();
	}

	@Override
	public SolicitudDao getSolicitudDao() {
		return new MySqlSolicitudDao();
	}

	@Override
	public ReparacionDao getReparacionDao() {
		return new MySqlReparacionDao();
	}

}
