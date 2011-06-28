package app.servlets;

import app.beans.*;
import app.services.SecurityService;

public class SecurityServlet extends ApplicationController {
	private static final long serialVersionUID = 1L;
	
	private SecurityService service = new SecurityService();
	
	public void login() {
		
	}
	
	public void logout() {
		destroySessionWithNuclearBombsAndTurtles();
		andThenWeGoBackToHome();
	}

	public void authenticate() {
		String name = param("nombre");
		String pwd = param("password");
		
		Usuario u = service.validate(name, pwd);
		
		if (u != null) {
			toSession("user", u);
			redirect("/");
		} else {
			add("error", "Ingreso Fallido");
			render("index");
		}
	}

}