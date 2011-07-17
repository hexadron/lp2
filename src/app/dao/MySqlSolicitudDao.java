package app.dao;

import java.util.List;

import app.beans.Equipo;
import app.interfaces.SolicitudDao;

public class MySqlSolicitudDao implements SolicitudDao {

	public Equipo buscarEquipo(int codigoPatrimonial) {
		List<Equipo> e = Equipo.where
			(Equipo.class, "codigoPatrimonial = ?", codigoPatrimonial);
		return e.size() != 0 ? e.get(0) : null; 
	}

}
