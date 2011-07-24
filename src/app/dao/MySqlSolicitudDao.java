package app.dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import app.beans.DetalleSolicitud;
import app.beans.Equipo;
import app.beans.Solicitud;
import app.beans.Usuario;
import app.interfaces.SolicitudDao;

public class MySqlSolicitudDao implements SolicitudDao {

	public Equipo buscarEquipo(long codigoPatrimonial) {
		List<Equipo> e = Equipo.where(Equipo.class, 
					"codigoPatrimonial = ? and dadodebaja = ?", 
					codigoPatrimonial, "false");
		return e.size() != 0 ? e.get(0) : null; 
	}

	@Override
	public Solicitud guardar(String jsonparam, Usuario usuario) {
		Solicitud sol = new Solicitud();
		sol.setUsuario(usuario.getId());
		Timestamp tstamp = new Timestamp
			(Calendar.getInstance().getTime().getTime());
		sol.setFecha(tstamp);
		sol.save();
		List<DetalleSolicitud> dets = parse(jsonparam, sol);
		for (DetalleSolicitud d : dets) {
			Equipo e = Equipo.find(Equipo.class, d.getEquipo());
			e.setEnproceso(true);
			d.save();
			e.save();
		}
		return sol;
	}
	
	private ArrayList<DetalleSolicitud> parse(String jsonstring, Solicitud sol) {
		String cad = jsonstring.substring(1, jsonstring.length() - 1);
		ArrayList<String> partes = new ArrayList<String>();
		int init=-1, end=-1;
		for (int i=0; i<cad.length(); i++) {
			if (cad.charAt(i) == '{') {
				init = i;
			} else if (cad.charAt(i) == '}') {
				end = i;
				partes.add(cad.substring(init + 1, end));
				init = -1;
				end = -1;
			}
		}
		ArrayList<DetalleSolicitud> dets = new ArrayList<DetalleSolicitud>();
		for (String p : partes) {
			int in = p.indexOf(",");
			String equipo = p.substring(10, in - 1);
			String problema = p.substring(in + 13, p.length() - 1);
			DetalleSolicitud det = new DetalleSolicitud();
			Equipo e = new Equipo();
			e.setCodigoPatrimonial(Long.valueOf(equipo));
			det.setEquipo(e.getCodigoPatrimonial());
			det.setProblema(problema);
			det.setSolicitud(sol.getId());
			dets.add(det);
		}
		return dets;
	}

}