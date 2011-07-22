package app.servlets;

import app.beans.*;
import app.services.SolicitudService;

public class SolicitudServlet extends ApplicationController {

	private static final long serialVersionUID = 1L;
	private SolicitudService service = new SolicitudService();
	
	public void index() {
		System.out.println("Aqui debe ocurrir algo");
		render("index");
	}
	
	public void buscarequipo() {
		Equipo e = service.buscarEquipo(Long.valueOf(param("equipo")));
		if (e != null)
			renderJSON(e);
		else
			renderText("notfound");
	}
	
	public void guardar() {
		Solicitud s = service.guardar(param("solicitud"), (Usuario) fromSession("user"));
		System.out.println("GUARDO EQUIPO");
		renderText("" + s.getId());
	}
	
}
