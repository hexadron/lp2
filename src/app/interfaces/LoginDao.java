package app.interfaces;

import app.beans.Usuario;

public interface LoginDao {
	
	public Usuario validate(String username, String password);
}
