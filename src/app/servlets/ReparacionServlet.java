package app.servlets;

import javax.servlet.Servlet;

import app.beans.*;
import app.services.ReparacionService;
import static app.util.Utilities.*;

public class ReparacionServlet extends ApplicationController implements Servlet {
	private static final long serialVersionUID = 1L;
	ReparacionService service = new ReparacionService();

	public void solicitar() {

	}

	public void asignar() {
		add("solicitudes", service.getSolicitudesSinAsignar());
		add("tecnicos", service.getTecnicos());
		render();
	}

	public void realizarAsignacion() {
		String json = ToUTF(param("reparaciones"));
		service.guardarReparaciones(json);
		skipRender();
	}

	public void detallesolicitud() {
		renderJSON(service.getDetalles(Long.valueOf(param("solicitud"))));
	}

	public void historial() {
		render();
	}

	public void reparacion() {

	}

	public void diagnostico() {
		Usuario u = (Usuario) fromSession("user");
		Tecnico t = (Tecnico) Tecnico.where(Tecnico.class, "usuario_id = ?",
				u.getId()).get(0);
		add("asignadas", service.getReparacionesAsignadas(t.getId()));
		render();
	}

	public void getDatosReparacion() {
		System.out.println(service.getDatosReparacion(Long
				.valueOf(param("reparacion"))));
		renderJSON(service
				.getDatosReparacion(Long.valueOf(param("reparacion"))));
	}

	public void registrarDiagnostico() {
		long reparacion = Long.valueOf(param("reparacion"));
		String diagnostico = (String) param("diagnostico");
		String prioridad = (String) param("prioridad");
		service.registrarDiagnostico(reparacion, diagnostico, prioridad);
	}

}