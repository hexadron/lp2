package app.servlets;

import java.util.*;

import javax.servlet.Servlet;

import com.google.gson.*;

import app.beans.*;
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
	
	public void equipospordetalle() {
		renderJSON(service.getEquiposPorDetalle(Long.valueOf(param("solicitud"))));
	}
	
	public void historial() {
		
	}
	
	public void reparacion() {
		
	}
	
	public void diagnostico() {
		
	}

}