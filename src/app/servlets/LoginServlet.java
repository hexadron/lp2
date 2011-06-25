package app.servlets;

import static app.util.Collections.*;

import java.util.ArrayList;
import java.util.List;

public class LoginServlet extends ApplicationController {
	private static final long serialVersionUID = 1L;

	public void listar() {
		List<String> arreglo = List("Sprockets", "Coffee", "Compass");
		add("arreglo", arreglo);
		render();
	}

	public void procesar() {
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
		
		renderJSON(v); // {"number":1234,"nombre":"Cowww","hijos":[{"nombre":"Hijo 1"},{"nombre":"Hijo 2"}]}
	}

}

// probando gson
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
