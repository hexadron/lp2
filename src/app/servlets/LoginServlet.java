package app.servlets;

import static app.util.Collections.*;
import java.util.*;

import app.beans.*;
import app.services.LoginService;

public class LoginServlet extends ApplicationController {
	private static final long serialVersionUID = 1L;
	
	private LoginService service = new LoginService();

	public void listar() {
		List<String> arreglo = List("Sprockets", "Coffee", "Compass");
		add("arreglo", arreglo);
	}

	public void procesar() {
		String name = param("nombre");
		String pwd = param("password");
		
		Usuario u = service.validate(name, pwd);
		
		if (u != null) {
			toSession("user", u);
			redirectTo("index");
		} else {
			add("error", "Ingreso Fallido");
			render("index");
		}
	}

}