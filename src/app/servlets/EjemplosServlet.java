package app.servlets;

import javax.servlet.Servlet;

import app.beans.Usuario;

public class EjemplosServlet extends ApplicationController implements Servlet {
	private static final long serialVersionUID = 1L;
	
	public void imprimir() {
		Usuario u = Usuario.find(Usuario.class, 1);
		String cadena = param("usuario");
		System.out.println(cadena.toLowerCase());
		renderJSON(u);
		//renderText("Hola Mundo");
	}

}