package app.dao;

import app.interfaces.LoginDao;

public class MySQLLoginDao implements LoginDao {

	@Override
	public String validate(String username, String password) {
		return username;
		// deber’a retornar el perfil... cuando haya una base de datos
	}
	
}
