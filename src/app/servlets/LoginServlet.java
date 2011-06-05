package app.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginServlet extends ApplicationController {
	private static final long serialVersionUID = 1L;
       
	public void listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] arreglo = {"Sprockets", "Coffee", "Compass"};
		for (String s : arreglo)
			System.out.println(s);
		render(request, response, "index");
	}

}
