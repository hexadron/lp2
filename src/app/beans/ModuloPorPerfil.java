package app.beans;

import app.util.ORZ;

public class ModuloPorPerfil extends ORZ {
	
	private long id;
	private long modulo;
	private long perfil;
	
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getModulo() {
		return modulo;
	}

	public void setModulo(long modulo) {
		this.modulo = modulo;
	}

	public long getPerfil() {
		return perfil;
	}

	public void setPerfil(long perfil) {
		this.perfil = perfil;
	}

}
