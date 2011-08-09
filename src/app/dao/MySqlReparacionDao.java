package app.dao;

import java.util.*;
import java.util.Map.Entry;

import com.google.gson.*;

import app.beans.*;
import app.interfaces.ReparacionDao;

import static app.util.Utilities.*;

public class MySqlReparacionDao implements ReparacionDao {

	public List<Solicitud> getSolicitudesSinAsignar() {
		List<Solicitud> solicitudes = new ArrayList<Solicitud>();
		for (Object s : Solicitud.all(Solicitud.class)) {
			Solicitud x = (Solicitud) s;
			List<DetalleSolicitud> detalles = 
				DetalleSolicitud.where(DetalleSolicitud.class,
						"solicitud_id = ?", x.getId());
			int asignados = 0;
			for (DetalleSolicitud d : detalles) {
				if (d.getEquipo().getAsignado() == true)
					asignados++;
			}
			if (asignados < detalles.size())
				solicitudes.add(x);
		}
		return solicitudes;
	}

	public List<Tecnico> getTecnicos() {
		List<Tecnico> tecnicos = Tecnico.all(Tecnico.class);
		for (Tecnico t : tecnicos ) {
			t.setNombres(decode(t.getNombres()));
			t.setApellidos(decode(t.getApellidos()));
			t.setEspecialidad(decode(t.getEspecialidad()));
		}
		return tecnicos;
	}

	public List<DetalleSolicitud> getDetalles(Long sol) {
		List<DetalleSolicitud> d = DetalleSolicitud.where(DetalleSolicitud.class, "solicitud_id = ?", sol);
		for (DetalleSolicitud dt : d)
			if (dt.getEquipo().getAsignado() == true)
				d.remove(dt);
			else
				dt.setProblema(decode(dt.getProblema()));
		return d;
	}
	
	@Override
	public void guardarReparaciones(String jsonString) {
		List<Reparacion> reps = parse(jsonString);
		for (Reparacion r : reps) {
			Solicitud sol = Solicitud.find(Solicitud.class, r.getDetalleSolicitud().getSolicitud().getId());
			sol.setEnatencion(true);
			sol.save();
			Equipo e = r.getEquipo();
			e.setAsignado(true);
			e.save();
			r.save();
		}
	}

	private List<Reparacion> parse(String json) {
		//[{ "solicitud": "2", "equipo": "3", "tecnico": "1" }, {...}, {...}...]
		int init = -1, fin = -1;
		String jsonString = json.substring(1, json.length() - 1);
		List<String> minijsons = new ArrayList<String>();
		for (int i = 0; i < jsonString.length(); i++) {
			if (jsonString.charAt(i) == '{')
				init = i;
			if (jsonString.charAt(i) == '}')
				fin = i;
			if (init != -1 && fin != -1) {
				minijsons.add(jsonString.substring(init, fin + 1));
				init = -1;
				fin = -1;
			}
		}
		List<Reparacion> reps = new ArrayList<Reparacion>();
		for (String j : minijsons) {
			List<Integer> ids = new ArrayList<Integer>();
			JsonElement jsonElement = new JsonParser().parse(j);
			JsonObject jsonObject = jsonElement.getAsJsonObject();
			for (Entry<String, JsonElement> entry : jsonObject.entrySet()) {
				ids.add(entry.getValue().getAsInt());
			}
			Reparacion r = new Reparacion();
			r.setDetalleSolicitud(
					(DetalleSolicitud) DetalleSolicitud.where(DetalleSolicitud.class,
							"solicitud_id = ? and equipo_id = ?", ids.get(0), ids.get(1)).get(0));
			r.setEquipo((Equipo) Equipo.find(Equipo.class, ids.get(1)));
			r.setTecnico((Tecnico) Tecnico.find(Tecnico.class, ids.get(2)));
			r.setAtendida(false);
			reps.add(r);
		}
		return reps;
	}

	@Override
	public List<Reparacion> getReparacionesAsignadas(long id) {
		List<Reparacion> reparaciones = 
			Reparacion.where(Reparacion.class, "tecnico_id = ?" +
					" and diagnostico is null", id);
		for (Reparacion r : reparaciones)
			if (r.getEquipo().getAsignado() == false)
				reparaciones.remove(r);
		return reparaciones;
	}

	@Override
	public Reparacion getDatosReparacion(Long id) {
		Reparacion r = Reparacion.find(Reparacion.class, id);
		String problema = r.getDetalleSolicitud().getProblema();
		r.getDetalleSolicitud().setProblema(decode(problema));
		String den = r.getEquipo().getDenominacion();
		r.getEquipo().setDenominacion(decode(den));
		String fab = r.getEquipo().getFabricante();
		r.getEquipo().setFabricante(decode(fab));
		return r;
	}

	@Override
	public void registrarDiagnostico(long reparacion, String diagnostico,
			String prioridad) {
		Reparacion r = Reparacion.find(Reparacion.class, reparacion);
		r.setDiagnostico(encode(diagnostico));
		r.setPrioridad(prioridad);
		r.save();
	}

	@Override
	public void registrarBaja(long id) {
		Equipo e = Equipo.find(Equipo.class, id);
		e.setDadodebaja(true);
		e.save();
	}

	@Override
	public List<Reparacion> getReparacionesDiagnosticadas(long id) {
		return Reparacion.where(Reparacion.class, "tecnico_id = ? " +
				"and diagnostico is not null and atendida is false", id);
	}
	
}