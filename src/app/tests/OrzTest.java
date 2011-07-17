package app.tests;

import java.util.List;

import org.junit.Test;

import app.beans.Equipo;
import app.beans.Usuario;

import junit.framework.TestCase;
import junit.textui.TestRunner;

public class OrzTest extends TestCase {
	
	@Test
	public void testObjects() throws Exception {
		List<Usuario> users = Usuario.where
			(Usuario.class, "usuario = ? and password = ?", "scott", "tiger");
		Usuario u =  (users.size() > 0) ? users.get(0) : null;
		System.out.println(u.getUsuario());
		assertNotNull(u);
		assertNotNull(u.getPerfil());
	}
	
	@Test
	public void testFindId() {
		Usuario u = Usuario.find(Usuario.class, 1);
		String n = (u != null) ? u.getPerfil().getDescripcion() : null;
		System.out.println(n);
		assertNotNull(n);
	}
	
	@Test
	public void testEquipos() {
		List<Equipo> e = Equipo.where
		(Equipo.class, "codigoPatrimonial = ?", 1);
		System.out.println(e);
		assertNotNull(e.get(0));
	}
	
	public static void main(String[] args) {
		TestRunner.run(OrzTest.class);
	}
}
