<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang='es'>
  <head>
    <title>Men&uacute; Principal</title>
    <link href='${pageContext.request.contextPath}/assets/stylesheets/screen.css' rel='stylesheet' type='text/css' />
  </head>
  <body>
    <div id='menu'>
      <ul class='menu_items'>
        <li><a href="security/logout">Salir</a></li>
<%--         <li>${ sessionScope.user.usuario }</li> --%>
        <li>${ sessionScope.nombre }</li>
        <% String s = (String) request.getSession().getAttribute("nombre"); %>
		<% if (s.equals("scott")) { %>
		<li><a href="reparacion/solicitar">Solicitar</a></li>
        <% } else if (s.equals("bob")) { %>
		<li><a href="reparacion/asignar">Asignar</a></li>
        <li><a href="reparacion/historial">Historial</a></li>
        <% } %>
        <li><a href="${pageContext.request.contextPath}">Men&uacute; principal</a></li>
      </ul>
    </div>
    <div class='container'>
      <div id='header'>
        <h1>Men&uacute; Principal</h1>
      </div>
      <ul class='content'>
		<% if (s.equals("scott")) { %>
		<li><a href="reparacion/solicitar">Solicitar Mantenimiento</a></li>
		<% } else if (s.equals("bob")) { %>
		<li><a href="reparacion/asignar">Asignar T&eacute;cnico</a></li>
		<li><a href="reparacion/historial">Consultar Historial T&eacute;cnico</a></li>
		<% } %>
      </ul>
    </div>
    <jsp:include page="../../templates/scripts.jsp">
    	<jsp:param value="defaults, ix.switch, ix.initialize" name="scripts"/>
    </jsp:include>
  </body>
</html>