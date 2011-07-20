package app.servlets;

import app.beans.*;
import app.services.SecurityService;

public class SecurityServlet extends ApplicationController {
	private static final long serialVersionUID = 1L;
	
	private SecurityService service = new SecurityService();
	
	public void login() {
		
	}
	
	public void logout() {
		destroysession();
		toHome();
		skipRender();
	}
	
	public void perfiles() {
		
	}
	
	public void usuarios() {
		
	}

	public void authenticate() {
		if (!req.getMethod().equals("POST")) {
			redirect("login");
			return;
		}

		String name = param("nombre");
		String pwd = param("password");
		Usuario u = service.validate(name, pwd);
		
		if (u != null) {
			toSession("user", u);
			toHome();
		} else {
			add("error", "Ingreso Fallido");
			render("login");
		}
	}

}