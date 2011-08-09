package app.tags;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.Tag;

public class MenuEtiqueta implements Tag {

	private PageContext pc;

	@Override
	public int doEndTag() throws JspException {
		try {
			HttpServletRequest r = (HttpServletRequest) pc.getRequest();
			String s = r.getContextPath();
			JspWriter out = pc.getOut();
			out.println("<a href=\"" + s + "\">Men&uacute; Principal</a>");
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
