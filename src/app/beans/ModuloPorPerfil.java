package app.beans;

import app.util.ObjectRelationalZapper;

public class ModuloPorPerfil extends ObjectRelationalZapper {
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
