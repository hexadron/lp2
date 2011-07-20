package app.util;

import java.io.UnsupportedEncodingException;

public abstract class Utilities {
	
	public static String ToUtf(String val) {
		try {
			return new String(val.getBytes("iso-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return null;
		}
	}
    
    public static String Capitalize(String cadena) {
    		StringBuilder builder = new StringBuilder();
    		builder.append(cadena.substring(0, 1).toUpperCase());
    		builder.append(cadena.subSequence(1, cadena.length()));
		return builder.toString();
	}
	
}
