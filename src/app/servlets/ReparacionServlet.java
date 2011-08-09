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
		String json = param("reparaciones");
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
		Usuario u = (Usuario) fromSession("user");
		Tecnico t = (Tecnico) Tecnico.where(Tecnico.class, "usuario_id = ?", u.getId()).get(0);
		add("reparaciones", service.getReparacionesDiagnosticadas(t.getId()));
		render();
	}
	
	public void registrarReparacion() {
		long reparacion = Long.valueOf(param("reparacion"));
		String trabajo = param("trabajo");
		double costo = Double.valueOf(param("costo"));
		double garantia = Double.valueOf(param("garantia"));
		String recomendaciones = param("recomendaciones");
		DetalleReparacion d = new DetalleReparacion();
		d.setCosto(costo);
		d.setGarantia(garantia);
		d.setRecomendaciones(recomendaciones);
		d.setTrabajo(trabajo);
		d.setReparacion((Reparacion) Reparacion.find(Reparacion.class, reparacion));
		service.registrarReparacion(d);
	}
	
	public void registrarOrdenTerceros() {
		long reparacion = Long.valueOf(param("reparacion"));
		String sustentacion = param("terceros");
		OrdenTerceros o = new OrdenTerceros();
		o.setReparacion((Reparacion) Reparacion.find(Reparacion.class, reparacion));
		o.setSustentacion(sustentacion);
		service.registrarOrdenTerceros(o);
	}
	
	public void registrarBaja() {
		long id = Long.valueOf(param("reparacion"));
		service.registrarBaja(id);
	}
	
	public void diagnostico() {
		Usuario u = (Usuario) fromSession("user");
		Tecnico t = (Tecnico) Tecnico.where(Tecnico.class, "usuario_id = ?", u.getId()).get(0);
		add("asignadas", service.getReparacionesAsignadas(t.getId()));
		render();
	}
	
	public void getDatosReparacion() {
		renderJSON(service.getDatosReparacion(Long.valueOf(param("reparacion"))));
	}
	
	public void registrarDiagnostico() {
		long reparacion = Long.valueOf(param("reparacion"));
		String diagnostico = (String) param("diagnostico");
		String prioridad = (String) param("prioridad");
		service.registrarDiagnostico(reparacion, diagnostico, prioridad);
	}
	
	public void reparacionexterna() {
		
	}

}