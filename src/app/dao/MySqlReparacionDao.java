package app.dao;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;

import app.beans.DetalleSolicitud;
import app.beans.Equipo;
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
			equipos.add(gson.toJson(new Object[] {Equipo.find(Equipo.class, d.getEquipo()), d.getProblema()}));
		return equipos;
	}

	
}