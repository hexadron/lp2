package app.beans;

import app.util.ORZ;

public class ModuloPorPerfil extends ORZ {
	private Modulo modulo;
	private Perfil perfil;

	public Modulo getModulo() {
		return modulo;
	}

	public void setModulo(Modulo modulo) {
		this.modulo = modulo;
	}

	public Perfil getPerfil() {
		return perfil;
	}

	public void setPerfil(Perfil perfil) {
		this.perfil = perfil;
	}
}
