package app.dao;

import app.interfaces.*;

public abstract class DaoFactory {

	public static enum Factories { MYSQL }
	
	public static DaoFactory getFactory(Factories factory) {
		switch (factory) {
		case MYSQL:
			return new MySQLDaoFactory();
		}
		return null;
	}
	
	public abstract AdministradorDao getAdministradorDao();
	
}
