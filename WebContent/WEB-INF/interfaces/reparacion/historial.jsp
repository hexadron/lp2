<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang='es'>
  <head>
    <title>Consultar Historial T&eacute;cnico</title>
    <link href='${pageContext.request.contextPath}/assets/stylesheets/screen.css' rel='stylesheet' type='text/css' />
  </head>
  <body>
    <div id='menu'>
      <ul class='menu_items'>
        <li><a href="${pageContext.request.contextPath}/security/logout">Salir</a></li>
<%--         <li>${ sessionScope.user.usuario }</li> --%>
        <li>${ sessionScope.nombre }</li>
        <li><a href="${pageContext.request.contextPath}/reparacion/asignar">Asignar</a></li>
        <li><a href="${pageContext.request.contextPath}/reparacion/historial">Historial</a></li>
        <li><a href="${pageContext.request.contextPath}">Men&uacute; principal</a></li>
      </ul>
    </div>
    <div class='container'>
      <div id='header'>
        <h1>Consultar Historial T&eacute;cnico</h1>
      </div>
      <ul class='content'>
        <li>
        <form>
          <ul>
          <li>
            <h2>T&eacute;cnicos</h2>
            </li>
            <li>
           	<table>
              <thead>
                <tr>
                  <fmt:message key='table.tooltip' var="tooltip" />
                  <th title="${ tooltip }">C&oacute;digo</th>
                  <th title="${ tooltip }">Nombre</th>
                  <th title="${ tooltip }">Empleado desde</th>
                  <th title="${ tooltip }">Especialidad</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>0003561</td>
                  <td>Juan Flores</td>
                  <td>30/05/2008</td>
                  <td>Equipos m&eacute;dicos</td>
                </tr>
                <tr>
                  <td>1051055</td>
                  <td>Ernesto Torres</td>
                  <td>12/07/2009</td>
                  <td>Electr&oacute;nica</td>
                </tr>
                <tr>
                  <td>5150155</td>
                  <td>Ximena Alvarado</td>
                  <td>03/09/2008</td>
                  <td>Electricista</td>
                </tr>
              </tbody>
            </table>
            </li>
            <li>
            	  <h3>Filtros de Trabajos</h3>
              
              	<ul>
              		<li>Área: 
              		<select style="font-size: .9em; margin-right: 6.8em;">
              			<option>Enfermeria</option>
              			<option>Urgencias</option>
              			<option>Mantenimiento</option>
              		</select>
              		Estado: 
              		<select style="font-size: .9em;">
              			<option>Reparado</option>
              			<option>Dado de Baja</option>
              			<option>Diagnosticado</option>
              			<option>Asignado</option>
              		</select>
              		<li>Fecha de Inicio: <input style="width: 5em; margin-right: 4em" type="text" />
              			Fecha de Fin: <input style="width: 5em;" type="text" /></li>
              		<li><input type='submit' value='Buscar' style="margin-top: 2em"></li>
              	</ul>
              
            </li>
            <li>
            <h2>Trabajos Realizados</h2>
            <h4 style="font-size: 1.2em;color: hsl(0, 60%, 40%);">5 trabajos</h4>
            </li>
            <li>
           	<table>
              <thead>
                <tr>
                  <fmt:message key='table.tooltip' var="tooltip" />
                  <th title="${ tooltip }">Solicitud</th>
                  <th title="${ tooltip }">Fecha Inicio</th>
                  <th title="${ tooltip }">Fecha Fin</th>
                  <th title="${ tooltip }">Estado</th>
                  <th title="${ tooltip }">&Aacute;rea solicitante</th>
                  <th title="${ tooltip }">Equipo</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>0023561</td>
                  <td>17/02/2011</td>
                  <td>29/02/2011</td>
                  <td>Dada de baja</td>
                  <td>Recursos Humanos</td>
                  <td>Ventilador</td>
                </tr>
                <tr>
                  <td>0074579</td>
                  <td>21/03/2011</td>
                  <td>04/05/2011</td>
                  <td>Dada de baja</td>
                  <td>Finanzas</td>
                  <td>Aire Acondicionado</td>
                </tr>
              </tbody>
            </table>
            </li>
          </ul>
        </form>
        </li>
      </ul>
    </div>
    <jsp:include page="../../templates/scripts.jsp">
    	<jsp:param value="defaults, ix.switch, ix.initialize" name="scripts"/>
    </jsp:include>
  </body>
</html>
