package app.api;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UsuarioAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getPathInfo());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
//	
//	private void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		Usuario.save(Usuario.class, request.getParameter("nombre"));
//	}
//	
//	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		long id = Long.parseLong(request.getParameter("id"));
//		Usuario usuario = Usuario.find(Usuario.class, id);
//		usuario.save(request.getParameter("nombre"));
//	}

}
