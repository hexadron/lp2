package app.tests;

import static app.util.Utilities.*;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.junit.Test;

import app.beans.DetalleSolicitud;
import app.beans.Equipo;
import app.beans.Modulo;
import app.beans.Perfil;
import app.beans.Solicitud;
import app.beans.Tecnico;
import app.beans.Usuario;
import app.services.SecurityService;

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
		Perfil p = (Perfil) ((u != null) ? Perfil.find(Perfil.class, u.getPerfil()) : null);
		String n = p.getDescripcion();
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
			e.setCodigoPatrimonial(Long.valueOf(equipo));
			det.setEquipo(e.getCodigoPatrimonial());
			det.setProblema(problema);
			det.setSolicitud(sol.getId());
			dets.add(det);
		}
	}
	
	@Test
	public void testSol() {
		Solicitud sol = new Solicitud();
		sol.setUsuario(((Usuario) Usuario.find(Usuario.class, 1)).getId());
		Timestamp tstamp = new Timestamp
			(Calendar.getInstance().getTime().getTime());
		sol.setFecha(tstamp);
		sol.save();
		Usuario u = Usuario.find(Usuario.class, sol.getUsuario());
		System.out.println(u.getUsuario());
		assertNotNull(sol);
	}
	
	@Test
	public void testEquipo() {
		Equipo e = Equipo.find(Equipo.class, 1);
		e.setEnproceso(true);
		e.save();
		assertNotNull(e);
	}
	
	@Test
	public void testGetSolicitudes() {
		List<Solicitud> sols = Solicitud.where(Solicitud.class, 
				"enatencion = ?", "false");
		System.out.println(sols.size());
		assertNotNull(sols);
	}
	
	@Test
	public void testGetTecnicos() { // and utf8
		List<Tecnico> tecs = Tecnico.all(Tecnico.class);
		for (Tecnico t : tecs)
			try {
				t.setNombres(new String(t.getNombres().getBytes("iso-8859-1"), "utf-8"));
				t.setApellidos(new String(t.getApellidos().getBytes("iso-8859-1"), "utf-8"));
				System.out.println(t.getNombres());
				System.out.println(t.getApellidos());
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		assertTrue(tecs.size() > 0);
	}
	
	@Test
	public void testSave() {
		Tecnico t = new Tecnico();
		String v = "áéíóúñ";
		t.setNombres(ToISO(v));
		t.setApellidos("otro normal");
		t.setFechaIngreso(new Date());
		t.setEspecialidad("y otro");
		t.save();
		assertNotNull(t);
	}
	
	@Test
	public void testUtf8() {
		Usuario u = Usuario.find(Usuario.class, 2);
		Perfil p = Perfil.find(Perfil.class, u.getPerfil());
		p.setDescripcion(ToUTF(p.getDescripcion()));
		List<Modulo> mods = new SecurityService().getModules(p);
		for (Modulo m : mods) {
			m.setDescripcion(ToUTF(m.getDescripcion()));
		}
		for (Modulo m : mods) {
			System.out.println(m.getDescripcion());
		}
		
	}
	
	@Test
	public void testOrzUtfSave() {
		Tecnico t = new Tecnico();
		String v = "áéíóúñ";
		t.setNombres(v);
		t.setApellidos("otro normal");
		t.setFechaIngreso(new Date());
		t.setEspecialidad("y otro");
		t.save();
	}
	
	@Test
	public void testOrzUtfGet() {
		List<Tecnico> tecs = Tecnico.where(Tecnico.class, "nombres = ?", "alan");
		for (Tecnico t : tecs)
			System.out.println(t.getNombres() + " " + t.getApellidos());
	}
	
	public static void main(String[] args) {
		TestRunner.run(SomeTests.class);
	}
}
