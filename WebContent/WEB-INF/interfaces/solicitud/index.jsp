<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="gg" uri="apptags" %>
<!DOCTYPE html>
<html lang='es'>
  <head>
    <title>Solicitar Mantenimiento Correctivo</title>
    <link href='${pageContext.request.contextPath}/assets/stylesheets/screen.css' rel='stylesheet' type='text/css' />
    <link href='${pageContext.request.contextPath}/assets/stylesheets/apprise.css' rel='stylesheet' type='text/css' />
    <style>
    		.selected {background-color: #FF8;}
    </style>
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
        <h1>Solicitar Mantenimiento Correctivo</h1>
      </div>
      <ul class='content'>
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
            <li><h3>Problema</h3></li>
            <li>
            <label class='nowrap' for='problema'>Ingresa una descripci&oacute;n del problema:</label>
            </li>
            <li>
            <textarea name='problema' id='problema'></textarea>
            </li>
            <li>
            <div class='actions'>
              <input class='default ' id='agregar' type='submit' value='Agregar a solicitud' disabled />
            </div>
            <li><h2>Solicitud</h2></li>
            <li>
            <table id="solicitudes">
              <thead>
                <tr>
                  <fmt:message key='table.tooltip' var="tooltip" />
                  <th class="numeric" title="${ tooltip }">C&oacute;digo Patrimonial</th>
                  <th class="date" title="${ tooltip }">Denominaci&oacute;n</th>
                  <th title="${ tooltip }">Fabricante</th>
                </tr>
              </thead>
              <tbody>
              </tbody>
            </table>
            </li>
            <li><h3>Problema Descrito</h3></li>
            <li><textarea id='problemadescrito'></textarea></li>
            <li>
            <div class='actions'>
              <input class='default' type='submit' id='enviar' value='Enviar' disabled />
              <input type='submit' id="quitar" value='Quitar' />
            </div>
            </li>
          </ul>
        </form>
        </li>
      </ul>
    </div>
    <jsp:include page="../../templates/scripts.jsp">
    	<jsp:param value="defaults, ix.switch, ix.initialize, solicitud" name="scripts"/>
    </jsp:include>
  </body>
</html>