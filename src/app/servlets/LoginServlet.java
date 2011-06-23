package app.servlets;

import static app.util.Collections.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import app.beans.Usuario;

public class LoginServlet extends ApplicationController {
	private static final long serialVersionUID = 1L;
	
	public void listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> arreglo = List("Sprockets", "Coffee", "Compass");
		for (String s : arreglo)
			System.out.println(s);
		for (int i : Range(1, 10))
			System.out.println(i);
	}
	
	public void procesar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (!request.getMethod().equalsIgnoreCase("POST")) {
			System.out.println("8-)");
			redirectTo(request, response, "index");
			return;
		}
		System.out.println("ES POOOOOST");
		PrintWriter pw = response.getWriter();
		pw.write("Hola inmundo");
//		String user = request.getParameter("user");
//		String password = request.getParameter("nombre");
//		if (Usuario.validate(user, password) != null) {
//			redirectTo(request, response, "home/");
//		}
	}
	
}
