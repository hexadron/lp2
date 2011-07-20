package app.util;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.Method;

public abstract class Utilities {
	
	public static String ToUTF(String val) {
		try {
			return new String(val.getBytes("iso-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static String ToISO(String val) {
		try {
			return new String(val.getBytes("utf-8"), "iso-8859-1");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static <T> T ObjectToISO(T object) {
		Class<?> c = object.getClass();
		for (Method m : c.getMethods()) {
			if (m.getName().startsWith("set") &&
					m.getParameterTypes()[0].getSimpleName().equals("String")) {
				String name = m.getName().substring(3, m.getName().length());
				try {
					Method getter = c.getMethod("get" + name);
					m.invoke(object, ToISO((String) getter.invoke(object)));
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return object;
	}
	
	public static <T> T ObjectToUTF(T object) {
		Class<?> c = object.getClass();
		for (Method m : c.getMethods()) {
			if (m.getName().startsWith("set") &&
					m.getParameterTypes()[0].getSimpleName().equals("String")) {
				String name = m.getName().substring(3, m.getName().length());
				try {
					Method getter = c.getMethod("get" + name);
					m.invoke(object, ToUTF((String) getter.invoke(object)));
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return object;
	}
    
    public static String Capitalize(String cadena) {
    		StringBuilder builder = new StringBuilder();
    		builder.append(cadena.substring(0, 1).toUpperCase());
    		builder.append(cadena.subSequence(1, cadena.length()));
		return builder.toString();
	}
	
}
