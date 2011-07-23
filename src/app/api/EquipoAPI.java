package app.api;

import app.beans.Equipo;
import app.servlets.ApplicationController;

public class EquipoAPI extends ApplicationController {
	private static final long serialVersionUID = 1L;
    
	public void index() {
		renderJSON(Equipo.find(Equipo.class, Long.valueOf(param("id"))));
		skipRender();
	}
	
	protected String getControllerPath() {
		StringBuilder url = new StringBuilder();
		url.append(getClass().getSimpleName().toLowerCase());
		url.replace(url.lastIndexOf("api"), url.length(), "");
		return url.toString();
	}

}
