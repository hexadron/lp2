<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="gg" uri="apptags" %>
<!DOCTYPE html>
<html lang='es'>
<head>
	<meta charset="UTF-8">
	<link href='${pageContext.request.contextPath}/assets/stylesheets/screen.css' rel='stylesheet' type='text/css' />
	<title>Men&uacute; Principal</title>
</head>
<body>
	<div id='menu'>
      	<ul class='menu_items'>
      		<li><gg:salir/></li>
			<li>${sessionScope.user.usuario}</li>
			<c:forEach var='m' items="${ modulos }">
				<li><a href="${pageContext.request.contextPath}/${ m.uri }">${ m.shorthand }</a></li>
			</c:forEach>
			<li><gg:menu/></li>
		</ul>
	</div>
	
	<div class='container'>
      <div id='header'>
        <h1>Men&uacute; Principal</h1>
      </div>
      <ul class='content' id='mp'>
      	<c:forEach var='m' items="${ modulos }">
			<li><a href="${ m.uri }">${ m.descripcion }</a></li>
		</c:forEach>
      </ul>
	</div>
	<jsp:include page="../../templates/scripts.jsp">
    	<jsp:param value="defaults, ix.switch, ix.initialize" name="scripts"/>
    </jsp:include>
</body>
</html>