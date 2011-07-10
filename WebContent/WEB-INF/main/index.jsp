<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<h1>${sessionScope.user.usuario}</h1>
	<ul>
	<c:forEach var="m" items="${ modulos }">
		<li><a href="${ m.uri }">${ m.descripcion }</a></li>
	</c:forEach>
	</ul>
	<div id="foot">
		<a href="security/logout">Cerrar sesi&oacute;n</a>
	</div>
</body>
</html>