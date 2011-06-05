package app.api;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import app.beans.Usuario;

public class UsuarioAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getPathInfo());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			if (!Usuario.isAdmin(request.getParameter("admin_user"), request.getParameter("admin_pass"))) {
				response.getWriter().write("Acceso denegado");
				return;
			}
			String method = request.getParameter("method");
			if (method.equals("create")) {
				create(request, response);
			} else if (method.equals("update")) {
				update(request, response);
			}
		} catch (NullPointerException e) {
			response.getWriter().write("Formato de datos incorrecto");
			return;
		}
	}
	
	private void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Usuario.save(Usuario.class, request.getParameter("nombre"));
	}
	
	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long id = Long.parseLong(request.getParameter("id"));
		Usuario usuario = Usuario.find(Usuario.class, id);
		usuario.save(request.getParameter("nombre"));
	}

}
