package app.dao;

import java.util.List;

import app.beans.Usuario;
import app.interfaces.LoginDao;

public class MySQLLoginDao implements LoginDao {

	@Override
	public Usuario validate(String username, String password) {
		List<Usuario> users = Usuario.where
			(Usuario.class, "usuario = ? and password = ?", username, password);
		return (users.size() > 0) ? users.get(0) : null;
	}

}