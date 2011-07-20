package app.dao;

import java.util.List;

import app.beans.DetalleSolicitud;
import app.beans.Solicitud;
import app.beans.Tecnico;
import app.interfaces.ReparacionDao;
import static app.util.Utilities.ToUTF;

public class MySqlReparacionDao implements ReparacionDao {

	public List<Solicitud> getSolicitudesSinAsignar() {
		return Solicitud.where(Solicitud.class, "enatencion = ?", "false");
	}

	public List<Tecnico> getTecnicos() {
		List<Tecnico> tecs = Tecnico.all(Tecnico.class);
		for (Tecnico t : tecs) {
			t.setNombres(ToUTF(t.getNombres()));
			t.setApellidos(ToUTF(t.getApellidos()));
			t.setEspecialidad(ToUTF(t.getEspecialidad()));
		}
		return tecs;
	}

	public List<DetalleSolicitud> getDetalles(Long sol) {
		return DetalleSolicitud.where(DetalleSolicitud.class, "solicitud_id = ?", sol);
	}

	
}