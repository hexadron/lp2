package app.listeners;

import javax.servlet.*;

import app.beans.Area;
import app.beans.Usuario;
import static app.util.Collections.*;

public class DeafListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent e) {
		
	}

	@Override
	public void contextInitialized(ServletContextEvent e) {
//		e.getServletContext().setAttribute("list", List(a, b));
	}

}
