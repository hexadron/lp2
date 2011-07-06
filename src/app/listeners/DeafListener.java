package app.listeners;

import javax.servlet.*;

import app.beans.Area;
import static app.util.Collections.*;

public class DeafListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent e) {
		
	}

	@Override
	public void contextInitialized(ServletContextEvent e) {
		Area a = new Area();
		a.setId(1);
		a.setDescripcion("Reposteria Orientada a Objetos");
		
		Area b = new Area();
		b.setId(2);
		b.setDescripcion("Criminalistica Enterprise Edition");
		
		e.getServletContext().setAttribute("list", List(a, b));
	}

}
