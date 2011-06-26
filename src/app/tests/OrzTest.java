package app.tests;

import java.util.List;

import org.junit.Test;

import app.beans.Usuario;

import junit.framework.TestCase;
import junit.textui.TestRunner;

public class OrzTest extends TestCase {
	
	@Test
	public void testObjects() throws Exception {
		String username = "root", password = "sudo";
		List<Usuario> users = Usuario.where
		(Usuario.class, "usuario = ? and password = ?", username, password);
		String n = (users.size() > 0) ? users.get(0).getPerfil().getDescripcion() : null;
		System.out.println(n);
		assertNotNull(n);
	}
	
	public static void main(String[] args) {
		TestRunner.run(OrzTest.class);
	}
}
