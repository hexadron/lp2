package app.dao;

import java.util.ArrayList;
import java.util.List;

import app.beans.Modulo;
import app.beans.ModuloPorPerfil;
import app.beans.Perfil;
import app.beans.Usuario;
import app.interfaces.SecurityDao;

public class MySqlSecurityDao implements SecurityDao {

	@Override
	public Usuario validate(String username, String password) {
		List<Usuario> users = Usuario.where
			(Usuario.class, "usuario = ? and password = ?", username, password);
		return (users.size() > 0) ? users.get(0) : null;
	}

	@Override
	public List<Modulo> getModules(Perfil p) {
		List<ModuloPorPerfil> modsp = 
			ModuloPorPerfil.where(ModuloPorPerfil.class, "perfil_id = ?", p.getId());
		List<Modulo> mods = new ArrayList<Modulo>();
		for (ModuloPorPerfil mpp : modsp)
			mods.add(mpp.getModulo());
		return mods;
	}

}