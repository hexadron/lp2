<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang='es'>
  <head>
    <title>Agregar Equipo</title>
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
        <h1>Agregar Equipo</h1>
      </div>
      <ul class='content' id='mp'>
        <li>
        <form>
          <ul>
            <li>
            <h2>Datos del Equipo</h2>
            </li>
            <li>
            <label for='denominacion'>Denominaci&oacute;n</label>
            <input id='denominacion' name='denominacion' type='text' />
            </li>
            <li>
            <label for='fabricante'>Fabricante</label>
            <input id='fabricante' name='fabricante' type='text' />
            </li>
            <li>
            <label for='area'>&Aacute;rea</label>
            <select id='area' name='area'>
            	<option>Elegir &Aacute;rea</option>
            	<option value="Mantenimiento">Mantenimiento</option>
            	<option value="Recursos Humanos">Recursos Humanos</option>
            	<option value="Emergencias">Emergencias</option>
            	<option value="Clinica">Clinica</option>
            </select>
            </li>
            <li>
            <div class='actions'>
              <input id="buscar" class='default' type='submit' value='Guardar' disabled/>
              <input id="buscar" type='submit' value='Limpiar' />
            </div>
            </li>
            <li><h2>Otras Operaciones</h2></li>
            <li><a href="actualizar">Actualizar</a></li>
            <li><a href="eliminar">Dar de baja</a></li>
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