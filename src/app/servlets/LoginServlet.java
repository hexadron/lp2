package app.servlets;

import static app.util.Collections.*;
import java.util.*;

import app.beans.Usuario;

public class LoginServlet extends ApplicationController {
	private static final long serialVersionUID = 1L;

	public void listar() {
		List<String> arreglo = List("Sprockets", "Coffee", "Compass");
		add("arreglo", arreglo);
		render();
	}

	public void procesar() {
		// modo: Framework de Pila Completa
		String name = param("nombre");
		String pwd = param("password");
		String userRol = Usuario.validate(name, pwd);
		if (userRol != null)
			add("rol", userRol);
		else
			add("error", "Ingreso Fallido");
		render("index");
		// modo: Java Evil Edition
		
	}

}