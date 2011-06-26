package app.services;

import app.beans.Usuario;
import app.dao.DaoFactory;
import app.dao.DaoFactory.Factories;
import app.interfaces.LoginDao;

public class LoginService {
	
	DaoFactory factory = DaoFactory.getFactory(Factories.MYSQL);

	public Usuario validate(String name, String pwd) {
		LoginDao dao = factory.getLoginDao();
		return dao.validate(name, pwd);
	}

}
