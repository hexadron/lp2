package app.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ApplicationController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void render(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/WEB-INF/" + getUrlPath();
		if (request.getPathInfo() == null || request.getPathInfo().equals("/"))
			url += "/index.jsp";
		else
			url += request.getPathInfo() + "/index.jsp";
		request.getRequestDispatcher(url).forward(request, response);
	}
	
	protected String getUrlPath() {
		StringBuilder url = new StringBuilder();
		url.append(getClass().getName().toLowerCase());
		url.replace(0, url.lastIndexOf(".") + 1, "");
		url.replace(url.lastIndexOf("servlet"), url.length(), "");
		return url.toString();
	}
	
}
