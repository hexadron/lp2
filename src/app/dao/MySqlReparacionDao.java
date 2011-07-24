package app.dao;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;

import app.beans.DetalleSolicitud;
import app.beans.Equipo;
import app.beans.Reparacion;
import app.beans.Solicitud;
import app.beans.Tecnico;
import app.interfaces.ReparacionDao;

public class MySqlReparacionDao implements ReparacionDao {

	public List<Solicitud> getSolicitudesSinAsignar() {
		return Solicitud.where(Solicitud.class, "enatencion = ?", "false");
	}

	public List<Tecnico> getTecnicos() {
		return Tecnico.all(Tecnico.class);
	}

	public List<DetalleSolicitud> getDetalles(Long sol) {
		return DetalleSolicitud.where(DetalleSolicitud.class, "solicitud = ?", sol);
	}

	@Override
	public List<Object> getEquiposPorDetalles(Long sol) {
		Gson gson = new Gson();
		List<Object> equipos = new ArrayList<Object>();
		for (DetalleSolicitud d : getDetalles(sol))
			equipos.add(gson.toJson(new Object[] {
					Equipo.find(Equipo.class, d.getEquipo()), d.getProblema()}));
		return equipos;
	}

	@Override
	public void guardarReparaciones(String jsonString) {
		List<Reparacion> reps = parse(jsonString);
		for (Reparacion r : reps) {
			Solicitud sol = Solicitud.find(Solicitud.class, r.getSolicitud());
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