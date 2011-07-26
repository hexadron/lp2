package app.dao;

import java.util.*;
import java.util.Map.Entry;

import com.google.gson.*;

import app.beans.*;
import app.interfaces.ReparacionDao;

public class MySqlReparacionDao implements ReparacionDao {

	public List<Solicitud> getSolicitudesSinAsignar() {
		List<Solicitud> solicitudes = new ArrayList<Solicitud>();
		for (Object s : Solicitud.all(Solicitud.class)) {
			Solicitud x = (Solicitud) s;
			List<DetalleSolicitud> detalles = 
				DetalleSolicitud.where(DetalleSolicitud.class, "solicitud_id = ?", x.getId());
			int asignados = 0;
			for (DetalleSolicitud d : detalles)
				if (d.getEquipo().getAsignado() == true)
					asignados++;
			if (asignados < detalles.size())
				solicitudes.add(x);
		}
		return solicitudes;
	}

	public List<Tecnico> getTecnicos() {
		return Tecnico.all(Tecnico.class);
	}

	public List<DetalleSolicitud> getDetalles(Long sol) {
		List<DetalleSolicitud> d = DetalleSolicitud.where(DetalleSolicitud.class, "solicitud_id = ?", sol);
		for (DetalleSolicitud dt : d)
			if (dt.getEquipo().getAsignado() == true)
				d.remove(dt);
		return d;
	}
	
	@Override
	public void guardarReparaciones(String jsonString) {
		List<Reparacion> reps = parse(jsonString);
		for (Reparacion r : reps) {
			Solicitud sol = Solicitud.find(Solicitud.class, r.getSolicitud().getId());
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
		Gson g = new Gson();
		List<Reparacion> reps = new ArrayList<Reparacion>();
		for (String j : minijsons) {
			List<Integer> ids = new ArrayList<Integer>();
			JsonElement jsonElement = new JsonParser().parse(j);
			JsonObject jsonObject = jsonElement.getAsJsonObject();
			for (Entry<String, JsonElement> entry : jsonObject.entrySet()) {
				ids.add(entry.getValue().getAsInt());
			}
			Reparacion r = new Reparacion();
			r.setSolicitud((Solicitud) Solicitud.find(Solicitud.class, ids.get(0)));
			r.setEquipo((Equipo) Equipo.find(Equipo.class, ids.get(1)));
			r.setTecnico((Tecnico) Tecnico.find(Tecnico.class, ids.get(2)));
			reps.add(r);
		}
		return reps;
	}
	
}