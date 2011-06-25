package app.servlets;

import static app.util.Collections.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

public class LoginServlet extends ApplicationController {
	private static final long serialVersionUID = 1L;
	
	public void listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> arreglo = List("Sprockets", "Coffee", "Compass");
		for (String s : arreglo)
			System.out.println(s);
		for (int i : Range(1, 10))
			System.out.println(i);
	}
	
	public void procesar(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Gson gs = new Gson();
		
		//PrintWriter out = res.getWriter();
		
		String jString = req.getParameter("vaca");
		System.out.println(jString);
		
		Vaca v2 = gs.fromJson(jString, Vaca.class);
		System.out.println(v2.getNombre());
		
		// simple ajax works...
		//out.println("Hola inmundo");
		// and now... json
		Vaca v = new Vaca();
		v.setNombre("Cowww");
		v.setNumber(1234);
		Ternero t1 = new Ternero();
		t1.setNombre("Hijo 1");
		Ternero t2 = new Ternero();
		t2.setNombre("Hijo 2");
		ArrayList<Ternero> hijos = new ArrayList<Ternero>();
		hijos.add(t1);
		hijos.add(t2);
		v.setHijos(hijos);
		
		renderJSON(res, v);
		// {"number":1234,"nombre":"Cowww","hijos":[{"nombre":"Hijo 1"},{"nombre":"Hijo 2"}]}
		// and well... json works...
	}
	
}


//probando gson
class Vaca { 
	private int number;
	private String nombre;
	private ArrayList<Ternero> hijos;
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public int getNumber() {
		return number;
	}
	public void setHijos(ArrayList<Ternero> hijos) {
		this.hijos = hijos;
	}
	public ArrayList<Ternero> getHijos() {
		return hijos;
	}
	

}

class Ternero {
	
	private String nombre;

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getNombre() {
		return nombre;
	}
}
