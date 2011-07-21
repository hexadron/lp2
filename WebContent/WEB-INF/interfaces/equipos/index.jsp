<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang='es'>
  <head>
    <title>Mantener Equipo</title>
    <link href='${pageContext.request.contextPath}/assets/stylesheets/screen.css' rel='stylesheet' type='text/css' />
    <link href='${pageContext.request.contextPath}/assets/stylesheets/apprise.css' rel='stylesheet' type='text/css' />
  </head>
  <body>
    <div id='menu'>
    		<ul class='menu_items'>
      		<li><a href="${pageContext.request.contextPath}/security/logout">salir</a></li>
      		<li>${sessionScope.user.usuario}</li>
			<c:forEach var='m' items="${ modulos }">
				<li><a href="${pageContext.request.contextPath}/${ m.uri }">${ m.shorthand }</a></li>
			</c:forEach>
			<li><a href="${pageContext.request.contextPath}">Men&uacute; Principal</a></li>
		</ul>
    </div>
    <div class='container'>
      <div id='header'>
        <h1>Mantener Equipos</h1>
      </div>
      <ul class='content' id='mp'>
        <li>
        <form>
          <ul>
            <li>
            <h2>Datos del Equipo</h2>
            </li>
            <li>
            <label for='equipo'>C&oacute;digo Patrimonial</label>
            <input id='equipo' name="equipo" type='text' />
            </li>
            <li>
            <div class='actions'>
              <input id="buscar" class='default' type='submit' value='Buscar' />
            </div>
            </li>
            <li>
            	<ul class="desc">
            	
            	</ul>
            </li>
            <li><h2>Operaciones</h2></li>
            <li><a href="equipos/agregar">Agregar</a></li>
            <li><a href="equipos/actualizar">Actualizar</a></li>
            <li><a href="equipos/eliminar">Dar de baja</a></li>
          </ul>
        </form>
        </li>
      </ul>
	</div>
    <jsp:include page="../../templates/scripts.jsp">
    	<jsp:param value="defaults, equipos" name="scripts"/>
    </jsp:include>
  </body>
</html>