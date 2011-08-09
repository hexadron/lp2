<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="gg" uri="apptags" %>
<!DOCTYPE html>
<html lang='es'>
  <head>
    <title>Registrar Diagn&oacute;stico</title>
    <link href='${pageContext.request.contextPath}/assets/stylesheets/screen.css' rel='stylesheet' type='text/css' />
    <link href='${pageContext.request.contextPath}/assets/stylesheets/apprise.css' rel='stylesheet' type='text/css' />
    <style>
		#susterceros {
			background-color: hsl(0, 0%, 97%);
			width: 100%;
			height: 5em;
    	};
    	.message {
    			font-size: 1em;
    			color: hsl(0, 60%, 40%); }
   		.selected, .eqselected, .tselected, .aselected { 
   			background-color: #FF8; }
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
        <h1>Registrar Diagn&oacute;stico de Equipo</h1>
      </div>
      <ul class='content'>
        <li>
        <form>
          <ul>
            <li>
            <h2>Trabajos Asignados</h2>
            </li>
            <li>
              <span style="font-size: 1em;color: hsl(0, 60%, 40%);">Seleccione un trabajo para ver problema</span>
            </li>
            <li>
           	<table id="reparaciones">
              <thead>
                <tr>
                  <fmt:message key='table.tooltip' var="tooltip" />
                  <th title="${ tooltip }">C&oacute;digo de Reparación</th>
                  <th title="${ tooltip }">Fecha de Inicio</th>
                  <th title="${ tooltip }">Equipo</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach var='r' items="${ asignadas }">
				<tr>
					<td class='id repid'>${ r.id }</td>
					<td class='solid'>${ r.detalleSolicitud.solicitud.fecha }</td>
					<td>${ r.equipo.denominacion }</td>
				</tr>
			  </c:forEach>
              </tbody>
            </table>
            </li>
            <li><h3>Diagn&oacute;stico</h3></li>
            <li>
             <textarea id='diagnostico'></textarea>
            </li>
            <li><h3>Prioridad</h3></li>
            <li>
              <ul>
                <li>
                  <label>Programable</label>
                  <input type="radio" name="prioridad" value="Programable" /></li>
                <li>
                  <label>Urgente</label>
                  <input type="radio" name="prioridad" value="Urgente" /></li>
                <li>
                  <label>Muy Urgente</label>
                  <input type="radio" name="prioridad" value="Muy Urgente" /></li>
              </ul>
            </li>
            <li>
            <div>
            	  <label for='terceros'>Solicitar Terceros</label><input id='terceros' name='terceros' type='checkbox' />
            </div>
            <div class='actions'>
              <input class='default' type='submit' value='Guardar' id='guardar' disabled/>
              <input type='submit' value='Limpiar' />
            </div>
            </li>
          </ul>
        </form>
        </li>
      </ul>
    </div>
    <jsp:include page="../../templates/scripts.jsp">
    	<jsp:param value="defaults, diagnostico" name="scripts"/>
    </jsp:include>
    </body>
</html>
