package app.servlets;

import java.util.List;

import javax.servlet.Servlet;

import app.beans.DetalleSolicitud;
import app.services.ReparacionService;

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
	
	public void detallesolicitud() {
		List<DetalleSolicitud> dets = 
			service.getDetalles(Long.valueOf(param("solicitud")));
		renderJSON(dets);
	}
	
	public void historial() {
		
	}
	
	public void reparacion() {
		
	}
	
	public void diagnostico() {
		
	}

}