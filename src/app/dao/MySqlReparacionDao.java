package app.dao;

import java.util.List;

import app.beans.DetalleSolicitud;
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
		System.out.println("antes del metodo del orm");
		return DetalleSolicitud.where(DetalleSolicitud.class, "solicitud_id = ?", sol);
	}

	
}