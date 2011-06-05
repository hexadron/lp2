package app.api;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EquipoAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getMethod());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getParameter("method");
		if (method.equals("create")) {
			create(request, response);
		} else if (method.equals("update")) {
			update(request, response);
		}
	}
	
	private void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
