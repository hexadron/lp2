package app.services;

import app.dao.DaoFactory;
import app.dao.DaoFactory.Factories;
import app.interfaces.LoginDao;

public class LoginService {
	
	DaoFactory factory = DaoFactory.getFactory(Factories.MYSQL);

	public String validate(String name, String pwd) {
		// "Patr—n" Dao ... o como convertir una linea en 3 clases y una interface...
		LoginDao dao = factory.getLoginDao();
		return dao.validate(name, pwd);
	}

}
