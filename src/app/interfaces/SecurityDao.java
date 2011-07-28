package app.interfaces;

import java.util.List;

import app.beans.Modulo;
import app.beans.Perfil;
import app.beans.Usuario;

public interface SecurityDao {
	
	public Usuario validate(String username, String password);

	public List<Modulo> getModules(Perfil p);

	public List<Perfil> allPerfiles();
}
