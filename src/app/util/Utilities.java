package app.util;

import org.apache.commons.lang.StringEscapeUtils;

public abstract class Utilities {
    
    public static String Capitalize(String cadena) {
    		StringBuilder builder = new StringBuilder();
    		builder.append(cadena.substring(0, 1).toUpperCase());
    		builder.append(cadena.subSequence(1, cadena.length()));
		return builder.toString();
	}
	
    public static String encode(String value) {
    	return StringEscapeUtils.escapeHtml(value);
    }
    
    public static String decode(String value) {
    	return StringEscapeUtils.unescapeHtml(value);
    }
    
}
