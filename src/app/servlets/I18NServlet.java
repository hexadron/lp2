package app.servlets;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.jstl.core.Config;

public class I18NServlet extends ApplicationController implements Servlet {
	private static final long serialVersionUID = 1L;
	
	public void idioma() throws ServletException, IOException {
		String idioma = param("idioma");
		String pais = param("pais");

		Locale locale = null;
		if (pais != null)
			locale = new Locale(idioma, pais);
		else
			locale = new Locale(idioma);
		
		HttpSession session = req.getSession(false);
		Config.set(session, Config.FMT_LOCALE, locale);
		renderJSP("ejemplo");
	}

}
