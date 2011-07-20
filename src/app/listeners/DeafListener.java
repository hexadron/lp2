package app.listeners;

import javax.servlet.*;

public class DeafListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent e) {
		
	}

	@Override
	public void contextInitialized(ServletContextEvent e) {
//		e.getServletContext().setAttribute("list", List(a, b));
	}

}
