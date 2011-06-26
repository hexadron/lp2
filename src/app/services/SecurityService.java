package app.services;

import java.util.List;

import app.beans.Modulo;
import app.beans.Perfil;
import app.beans.Usuario;
import app.dao.DaoFactory;
import app.dao.DaoFactory.Factories;
import app.interfaces.SecurityDao;

public class SecurityService {
	
	DaoFactory factory = DaoFactory.getFactory(Factories.MYSQL);

	public Usuario validate(String name, String pwd) {
		SecurityDao dao = factory.getSecurityDao();
		return dao.validate(name, pwd);
	}

	public List<Modulo> getModules(Perfil p) {
		SecurityDao dao = factory.getSecurityDao();
		return dao.getModules(p);
	}

}
