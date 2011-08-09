<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="gg" uri="apptags" %>
<!DOCTYPE html>
<html lang='es'>
  <head>
    <title>Registrar Reparación</title>
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
        <h1>Registrar Reparaci&oacute;n de Equipo</h1>
      </div>
      <ul class='content'>
        <li>
        <form>
          <ul>
            <li>
            <h2>Trabajos Diagnosticados</h2>
            </li>
            <li>
              <span style="font-size: 1em;color: hsl(0, 60%, 40%);">Seleccione un trabajo para ver el diagn&oacute;stico</span>
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
                <c:forEach var='r' items="${ reparaciones }">
				<tr>
					<td class='id repid'>${ r.id }</td>
					<td class='solid'>${ r.detalleSolicitud.solicitud.fecha }</td>
					<td>${ r.equipo.denominacion }</td>
				</tr>
			  </c:forEach>
              </tbody>
            </table>
            </li>
            <li>
              <div class='actions'>
              	<input id="dardebaja" class='default' type='submit' value='Dar de Baja' disabled />
              	<label for='terceros' style="width: 8em; text-align: left;">Solicitar Terceros</label><input id='terceros' name='terceros' type='checkbox' />
              </div>
            </li>
            <li><h3>Trabajo Realizado</h3></li>
            <li>
             <textarea id='trabajo'></textarea>
            </li>
            <li>
              <ul>
                <li>
                  <label style="width: 5em; text-align: left;">Costo</label>
                  <input type="text" id="costo" style="width: 10em;" name="costo" />
                </li>
                <li>
                  <label style="width: 5em; text-align: left;">Garant&iacute;a</label>
                  <input type="text" id="garantia" style="width: 10em;" name="garantia" />
                </li>
              </ul>
            </li>
            <li><h3>Recomendaciones</h3></li>
            <li>
             <textarea id='recomendaciones'></textarea>
            </li>
            <li>
            <div class='actions'>
              <input id="guardar" class='default' type='submit' value='Guardar' />
              <input type='submit' value='Limpiar' />
            </div>
            </li>
          </ul>
        </form>
        </li>
      </ul>
    </div>
    <jsp:include page="../../templates/scripts.jsp">
    	<jsp:param value="defaults, reparacion" name="scripts"/>
    </jsp:include>
  </body>
</html>
