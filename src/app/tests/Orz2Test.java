package app.tests;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import app.beans.Modulo;
import app.beans.ModuloPorPerfil;
import app.beans.Usuario;

import junit.framework.TestCase;
import junit.textui.TestRunner;

public class Orz2Test extends TestCase {
	
	//Security
	
	@Test
	public void testLogin() {
		List<Usuario> users = Usuario.where
			(Usuario.class, "usuario = ? and password = ?", "root", "sudo");
		assertNotNull(users.get(0));	
	}
	
	public void testModules() {
		List<ModuloPorPerfil> modsp = 
			ModuloPorPerfil.where(ModuloPorPerfil.class, "perfil_id = ?", 1);
		List<Modulo> mods = new ArrayList<Modulo>();
		for (ModuloPorPerfil mpp : modsp)
//			mods.add(mpp.getModulo());
		assertTrue(mods.size() > 0);
	}
	
	public static void main(String[] args) {
		TestRunner.run(Orz2Test.class);
	}
}
