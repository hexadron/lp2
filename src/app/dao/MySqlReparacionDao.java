package app.dao;

import java.util.*;

import com.google.gson.Gson;

import app.beans.*;
import app.interfaces.ReparacionDao;

public class MySqlReparacionDao implements ReparacionDao {

	public List<Solicitud> getSolicitudesSinAsignar() {
		return Solicitud.where(Solicitud.class, "enatencion = ?", "false");
	}

	public List<Tecnico> getTecnicos() {
		return Tecnico.all(Tecnico.class);
	}

	public List<DetalleSolicitud> getDetalles(Long sol) {
		return DetalleSolicitud.where(DetalleSolicitud.class, "solicitud_id = ?", sol);
	}
	
	@Override
	public void guardarReparaciones(String jsonString) {
		List<Reparacion> reps = parse(jsonString);
		for (Reparacion r : reps) {
			Solicitud sol = Solicitud.find(Solicitud.class, r.getSolicitud().getId());
			sol.setEnatencion(true);
			sol.save();
			r.save();
		}
	}

	private List<Reparacion> parse(String json) {
		//[{ "solicitud": "sol", "equipo": "eq", "tecnico": "tec" }, {...}, {...}...]
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
			Reparacion r = g.fromJson(j, Reparacion.class);
			reps.add(r);
		}
		return reps;
	}


	
}