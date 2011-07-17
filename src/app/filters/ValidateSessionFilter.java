package app.filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class ValidateSessionFilter implements Filter {

	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		
		HttpSession session = req.getSession(false);
		if (session != null) {
			if (session.getAttribute("usuDTO") != null) {
				chain.doFilter(request, response);
			} else {
				req.getRequestDispatcher("/logueo.jsp").forward(request, response);
			}
		} else {
			// que mal, estan tratando de entrar como sea
			req.getRequestDispatcher("/logueo.jsp").forward(request, response);
		}
		System.out.println("FILTRO");
	}

	public void init(FilterConfig fConfig) throws ServletException {

	}

}
