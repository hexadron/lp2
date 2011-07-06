package app.tags;

import java.io.IOException;
import java.util.List;

import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.Tag;
import app.beans.Area;

public class PrimeraEtiqueta implements Tag {

	private PageContext pc;
	private List<Area> list;
	private String nombre;

	// comentario adada
	@Override
	public int doEndTag() throws JspException {
		try {
			JspWriter out = pc.getOut();
			out.println("<select name=" + nombre + ">");
			for (Area a : list) {
				out.println("<option value=" + a.getId() + ">");
				out.println(a.getDescripcion() + "</option>");
			}
			out.println("</select>");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return EVAL_PAGE;
	}

	@Override
	public int doStartTag() throws JspException {
		return SKIP_BODY;
	}

	@Override
	public Tag getParent() {
		return null;
	}

	@Override
	public void release() {
	}

	@Override
	public void setPageContext(PageContext pc) {
		this.pc = pc;
	}

	@Override
	public void setParent(Tag t) {

	}

	public List<Area> getList() {
		return list;
	}

	public void setList(List<Area> list) {
		this.list = list;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

}
