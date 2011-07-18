package app.tests;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.junit.Test;

import app.beans.DetalleSolicitud;
import app.beans.Equipo;
import app.beans.Solicitud;
import app.beans.Usuario;

import junit.framework.TestCase;
import junit.textui.TestRunner;

public class SomeTests extends TestCase {
	
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
	
	@Test
	public void testParse() {
		//[{"equipo":"1","problema":"ZZZZZZ"},{"equipo":"2","problema":"ZZ!!!!"}]
		String jsonstring = "[{\"equipo\":\"1\",\"problema\":\"ZZZZZZ\"},{\"equipo\":\"2\",\"problema\":\"ZZ!!!!\"}]";
		Solicitud sol = new Solicitud();
		sol.setId(1);
		String paso1 = jsonstring.substring(1, jsonstring.length() - 1);
		ArrayList<String> partes = new ArrayList<String>();
		int init=-1, end=-1;
		for (int i=0; i<paso1.length(); i++) {
			if (paso1.charAt(i) == '{') {
				init = i;
			} else if (paso1.charAt(i) == '}') {
				end = i;
				partes.add(paso1.substring(init + 1, end));
				init = -1;
				end = -1;
			}
		}
		ArrayList<DetalleSolicitud> dets = new ArrayList<DetalleSolicitud>();
		for (String p : partes) {
			int in = p.indexOf(",");
			String equipo = p.substring(10, in - 1);
			String problema = p.substring(in + 13, p.length() - 1);
			DetalleSolicitud det = new DetalleSolicitud();
			Equipo e = new Equipo();
			e.setId(Long.valueOf(equipo));
			det.setEquipo(e);
			det.setProblema(problema);
			det.setSolicitud(sol);
			dets.add(det);
		}
	}
	
	public void testSol() {
		Solicitud sol = new Solicitud();
		sol.setUsuario((Usuario) Usuario.find(Usuario.class, 1));
		Timestamp tstamp = new Timestamp
			(Calendar.getInstance().getTime().getTime());
		sol.setFecha(tstamp);
		sol.save();
		assertNotNull(sol);
	}
	
	public static void main(String[] args) {
		TestRunner.run(SomeTests.class);
	}
}