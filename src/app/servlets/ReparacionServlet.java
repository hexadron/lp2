package app.servlets;

import java.util.*;

import javax.servlet.Servlet;

import app.beans.*;
import app.services.ReparacionService;
import static app.util.Utilities.*;

public class ReparacionServlet extends ApplicationController implements Servlet {
	private static final long serialVersionUID = 1L;
	ReparacionService service = new ReparacionService();
	
	public void solicitar() {
		
	}
	
	public void asignar() {
		add("solicitudes", service.getSolicitudesSinAsignar());
		add("tecnicos", service.getTecnicos());
		render();
	}
	
	public void realizarAsignacion() {
		String json = ToUTF(param("reparaciones"));
		service.guardarReparaciones(json);
		renderText("ok");
	}
	
	public void historial() {
		render();
	}
	
	public void reparacion() {
		
	}
	
	public void diagnostico() {
		
	}

}