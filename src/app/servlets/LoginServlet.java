package app.servlets;

import static app.util.Collections.*;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginServlet extends ApplicationController {
	private static final long serialVersionUID = 1L;
      
	public void listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> arreglo = List("Sprockets", "Coffee", "Compass");
		for (String s : arreglo)
			System.out.println(s);
	}
	
	public void procesar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (!request.getMethod().equals("POST"))
			return;
		redirectTo(request, response, "home/");
	}
	
	public void hola(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
