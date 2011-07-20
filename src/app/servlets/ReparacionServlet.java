package app.servlets;

import javax.servlet.Servlet;

import app.services.ReparacionService;

public class ReparacionServlet extends ApplicationController implements Servlet {
	private static final long serialVersionUID = 1L;
	ReparacionService service = new ReparacionService();
	
	public void solicitar() {
		
	}
	
	public void asignar() {
		add("solicitudes", service.getSolicitudesSinAsignar());
		add("tecnicos", service.getTecnicos());
	}
	
	public void detallesolicitud() {
		renderJSON(service.getDetalles(Long.valueOf(param("solicitud"))));
	}
	
	public void historial() {
		
	}
	
	public void reparacion() {
		
	}
	
	public void diagnostico() {
		
	}

}