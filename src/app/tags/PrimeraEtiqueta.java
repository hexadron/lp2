package app.tags;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.Tag;

public class PrimeraEtiqueta implements Tag {

	PageContext pc;

	@Override
	public int doEndTag() throws JspException {
		try {
			JspWriter out = pc.getOut();
			out.println("<select name=destino >");
			out.println("<option>Los</option>");
			out.println("<option>Espacios</option>");
			out.println("<option>Estan</option>");
			out.println("<option>Prohibidos</option>");
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

}
