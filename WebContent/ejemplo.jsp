<%@ taglib prefix="at" uri="apptags" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ejemplos de i18n y Custom Tags</title>
</head>
<body>
	<fmt:message key="mensaje" />
	<fmt:message key="mensaje.saludo" />
	<a href="/proyecto/i18n/idioma?idioma=fr">Frances</a>
	<a href="/proyecto/i18n/idioma?idioma=it">Italiano</a>
	<a href="/proyecto/i18n/idioma?idioma=es">Espanol</a>
	<!-- Estan en /web-inf/tag/etiquetas.tld -->
	<at:etiquetapersonalizada>
	</at:etiquetapersonalizada>
</body>
</html>