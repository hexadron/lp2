package app.servlets;

import javax.servlet.Servlet;

public class MantenimientoServlet extends ApplicationController implements Servlet {
	private static final long serialVersionUID = 1L;
	
	public void solicitar() {
		render("solicitar_ads");
	}

}