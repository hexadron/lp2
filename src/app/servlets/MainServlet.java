package app.servlets;

import java.util.List;

import app.beans.Modulo;
import app.beans.Perfil;
import app.beans.Usuario;
import app.services.SecurityService;
import static app.util.Utilities.ToUtf;

public class MainServlet extends ApplicationController {
    
    private static final long serialVersionUID = 1L;
    SecurityService service = new SecurityService();
    
    @Override
    public void index() {
		Usuario u = (Usuario) fromSession("user");
		if (u == null)
			render("security/login");
		else {
			Perfil p = u.getPerfil();
			p.setDescripcion(ToUtf(p.getDescripcion()));
			List<Modulo> mods = service.getModules(u.getPerfil());
			for (Modulo m : mods) {
				m.setDescripcion(ToUtf(m.getDescripcion()));
			}
			toSession("perfil", p);
			toSession("modulos", mods);
		}
    }

}