package app.beans;

public class Rol {

	private long id;
	private String nombre;
	private String privilegios;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getPrivilegios() {
		return privilegios;
	}

	public void setPrivilegios(String privilegios) {
		this.privilegios = privilegios;
	}

}
