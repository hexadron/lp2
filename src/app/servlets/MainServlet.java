package app.servlets;

import app.beans.*;
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
			Perfil p = Perfil.find(Perfil.class, u.getPerfil());
			toSession("perfil", p);
			toSession("modulos", service.getModules(p));
		}
    }

}