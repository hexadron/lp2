package app.servlets;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.jsp.jstl.core.Config;

public class I18NServlet extends ApplicationController implements Servlet {
	private static final long serialVersionUID = 1L;
	
	public void idioma() throws ServletException, IOException {
		String idioma = param("idioma");
		String pais = param("pais");

		Locale locale = pais != null ? new Locale(idioma, pais) : new Locale(idioma);
		
		Config.set(req.getSession(false), Config.FMT_LOCALE, locale);
		renderJSP("ejemplo");
	}

}
