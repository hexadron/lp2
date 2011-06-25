package app.servlets;

import static app.util.Collections.*;
import java.util.*;

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
		
		// modo: Framework de Pila Completa
		// String userRol = Usuario.validate(name, pwd);
		// modo: Java Evil Edition... Marea de DAOS!!!!
		String userRol = service.validate(name, pwd);
		if (userRol != null)
			add("rol", userRol);
		else
			add("error", "Ingreso Fallido");
		render("index");
	}

}