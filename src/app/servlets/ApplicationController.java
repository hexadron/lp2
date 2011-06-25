package app.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.gson.Gson;

import java.lang.reflect.*;

public class ApplicationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected boolean rendered = false;
	protected boolean ajax = false;
	protected HttpServletRequest req;
	protected HttpServletResponse res;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String path = request.getPathInfo();
			this.req = request;
			this.res = response;
			
			if (request.getParameter("ajax") != null &&
					request.getParameter("ajax").equals("true"))
				ajax = true;
			
			if (path != null && !path.equals("/")) {
				StringBuilder url = new StringBuilder(path);
				url.replace(0, 1, ""); // /accion => accion
				if (url.indexOf("/") != -1) // accion/* => accion
					url.replace(url.indexOf("/"), url.length(), "");
				path = url.toString();
				
				Method[] methods = this.getClass().getDeclaredMethods();
				for (Method m : methods)
					if (m.getName().equals(path)) {
						rendered = false;
						m.invoke(this);
						//m.invoke(this, request, response);
						if (!rendered && !ajax)
							render(m.getName());
					}
			} else {
				rendered = false;
				index();
				if (!rendered)
					render("index");
			}
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
	}
	
	public void index(){
		render("index");
	}

	// stack: [0] getStackTrace [1] render [2] metodo que llamo a render
	protected void render() {
		String accion = Thread.currentThread().getStackTrace()[2].getMethodName();
		render(accion);
	}
	
	// agrega un atributo al request, solo para terminar de aislar los requests y responses
	protected void add(String name, Object o) {
		req.setAttribute(name, o);
	}
		
	// parametro            resultado
	// accion               sitio.com/controlador/accion.jsp
	// controlador/accion   sitio.com/controlador/accion.jsp
	// cobb/goes/to/limbo   sitio.com/cobb/goes/to/limbo.jsp	
	protected void render(String template) {
		String url = "/WEB-INF/";
		// si es que es una accion del mismo controlador
		if (template.indexOf("/") == -1)
			url += getControllerPath() + "/" + template + ".jsp";
		else // accion de otro controlador
			url += template + ".jsp";
		rendered = true;
		try {
			this.req.getRequestDispatcher(url).forward(this.req, this.res);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	protected void redirectTo(String location)  {
		String url = req.getContextPath() + "/";
		// evita que renderice automaticamente la vista
		rendered = true;
		try {
			if (location.indexOf("/") == -1) {
				url += getControllerPath();
				if (location.equals("index"))
					res.sendRedirect(url);
				else
					res.sendRedirect(url + "/" + location);
			}
			else
				res.sendRedirect(url + location);
		} catch(IOException ex) {
			ex.printStackTrace();
		}
	}
	
	// app.servlets.LalalaServlet => lalala
	protected String getControllerPath() {
		StringBuilder url = new StringBuilder();
		url.append(getClass().getSimpleName().toLowerCase());
		url.replace(url.lastIndexOf("servlet"), url.length(), "");
		return url.toString();
	}
	
	protected void renderJSON(Object o) {
		Gson gs = new Gson();
		try {
			res.getOutputStream().println(gs.toJson(o));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
