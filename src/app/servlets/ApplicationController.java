package app.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.*;

public class ApplicationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			doAction(request, response);
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
	}
	
	public void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		render(request, response);
	}
	
	protected Method doAction(HttpServletRequest request, HttpServletResponse response) throws IllegalArgumentException, IllegalAccessException, InvocationTargetException, ServletException, IOException {
		Method[] methods = this.getClass().getDeclaredMethods();
		String path = request.getPathInfo();
		if (path != null && !path.equals("/")) {
			for (Method m : methods) {
				if (("/" + m.getName()).equals(path) ||
					("/" + m.getName() + "/").equals(path)) {
					m.invoke(this, request, response);
					return m;
				}
			}
		} else {
			index(request, response);
		}
		return null;
	}

	protected void render(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		render(request, response, "index");
	}
	
	// template             resultado
	// accion               sitio.com/controlador/accion.jsp
	// controlador/accion   sitio.com/controlador/accion.jsp
	// cobb/goes/to/limbo   sitio.com/cobb/goes/to/limbo.jsp
	protected void render(HttpServletRequest request, HttpServletResponse response, String template) throws ServletException, IOException {
		String url = "/WEB-INF/";
		// si es que es una accion del mismo controlador
		if (template.indexOf("/") == -1)
			url += getUrlPath() + "/" + template + ".jsp";
		else // accion de otro controlador
			url += template + ".jsp";
		request.getRequestDispatcher(url).forward(request, response);
	}
	
	// LalalaServlet => lalala
	protected String getUrlPath() {
		StringBuilder url = new StringBuilder();
		url.append(getClass().getName().toLowerCase());
		url.replace(0, url.lastIndexOf(".") + 1, "");
		url.replace(url.lastIndexOf("servlet"), url.length(), "");
		return url.toString();
	}
	
}
