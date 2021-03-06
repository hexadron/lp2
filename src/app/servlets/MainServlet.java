package app.servlets;

import app.beans.Usuario;
import app.services.SecurityService;

public class MainServlet extends ApplicationController {
    
    private static final long serialVersionUID = 1L;
    SecurityService service = new SecurityService();
    
    @Override
    public void index() {
		Usuario u = (Usuario) fromSession("user");
		if (u == null)
			render("security/login");
		else {
			toSession("perfil", u.getPerfil());
			toSession("modulos", service.getModules(u.getPerfil()));
		}
    }

}