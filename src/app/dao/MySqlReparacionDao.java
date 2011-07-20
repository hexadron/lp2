package app.dao;

import java.util.List;

import app.beans.DetalleSolicitud;
import app.beans.Solicitud;
import app.beans.Tecnico;
import app.interfaces.ReparacionDao;
import static app.util.Utilities.ToUtf;

public class MySqlReparacionDao implements ReparacionDao {

	public List<Solicitud> getSolicitudesSinAsignar() {
		return Solicitud.where(Solicitud.class, "enatencion = ?", "false");
	}

	public List<Tecnico> getTecnicos() {
		List<Tecnico> tecs = Tecnico.all(Tecnico.class);
		for (Tecnico t : tecs) {
			t.setNombres(ToUtf(t.getNombres()));
			t.setApellidos(ToUtf(t.getApellidos()));
			t.setEspecialidad(ToUtf(t.getEspecialidad()));
		}
		return tecs;
	}

	public List<DetalleSolicitud> getDetalles(Long sol) {
		return DetalleSolicitud.where(DetalleSolicitud.class, "solicitud_id = ?", sol);
	}

	
}