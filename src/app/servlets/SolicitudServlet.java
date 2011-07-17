package app.servlets;

import app.beans.Equipo;
import app.services.SolicitudService;

public class SolicitudServlet extends ApplicationController {

	private static final long serialVersionUID = 1L;
	private SolicitudService service = new SolicitudService(); 
	
	public void buscarequipo() {
		Equipo e = service.buscarEquipo(Integer.valueOf(param("equipo")));
		if (e != null)
			renderJSON(e);
		else
			renderText("notfound");
	}
}
