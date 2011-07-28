<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang='es'>
  <head>
    <title>Asignar Técnico Externo de Reparación</title>
    <meta charset="utf-8">
    <link href='${pageContext.request.contextPath}/assets/stylesheets/screen.css' rel='stylesheet' type='text/css' />
    <link href='${pageContext.request.contextPath}/assets/stylesheets/apprise.css' rel='stylesheet' type='text/css' />
    <style>
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
        <h1>Asignar Técnico Externo de Reparación</h1>
      </div>
      <ul class='content'>
        <li>
        <form>
          <ul>
            <li>
            <h2>Trabajos Sin Reparación</h2>
            </li>
            <li><span class="message">Seleccione un trabajo sin reparación</span></li>
            <li>
           	<table id="solicitudes">
              <thead>
                <tr>
                  <fmt:message key='table.tooltip' var="tooltip" />
                  <th title="${ tooltip }">Fecha de Inicio</th>
                  <th title="${ tooltip }">Cod. de Reparación</th>
                  <th title="${ tooltip }">Equipo</th>
                  <th title="${ tooltip }">Prioridad</th>
                </tr>
              </thead>
              <tbody>
              <tr>
              	<td>12/12/2011</td>
              	<td>100002</td>
              	<td>Lavadora</td>
              	<td>Programable</td>
              </tr>
              </tbody>
            </table>
            </li>
            <li>
            <h3>T&eacute;cnicos Externos</h3>
            </li>
            <li>
           	<table id="tecnicos">
              <thead>
                <tr>
                  <fmt:message key='table.tooltip' var="tooltip" />
                  <th title="${ tooltip }">C&oacute;digo</th>
                  <th title="${ tooltip }">Nombre</th>
                  <th title="${ tooltip }">Especialidad</th>
                  <th title="${ tooltip }">Costo Promedio (S/.)</th>
                </tr>
              </thead>
              <tbody>
              	<tr>
              		<td>100001</td>
              		<td>Bill Gates</td>
              		<td>Informática</td>
              		<td>400.00</td>
              	</tr>
              	<tr>
              		<td>100002</td>
              		<td>Steve Jobs</td>
              		<td>Informática</td>
              		<td>400.10</td>
              	</tr>
              </tbody>
            </table>
            </li>
            <li>
            <div class='actions'>
              <input class='default' id='asignar' type='submit' value='Asignar Técnico Externo' disabled/>
            </div>
            </li>
            <li>
            <h3>Trabajos Asignados a Técnicos Externos</h3>
            </li>
            <li>
           	<table id="asignados">
              <thead>
                <tr>
                  <fmt:message key='table.tooltip' var="tooltip" />
                  <th title="${ tooltip }">Cód. de Reparación</th>
                  <th title="${ tooltip }">Equipo</th>
                  <th title="${ tooltip }">Denominación</th>
                  <th title="${ tooltip }">Técnico</th>
                </tr>
              </thead>
              <tbody>
              </tbody>
            </table>
            </li>
            <li>
            <div class='actions'>
              <input type='submit' id='confirmar' value='Confirmar' disabled/>
              <input class='default' id='quitar' type='submit' value='Quitar' disabled/>
            </div>
            </li>
          </ul>
        </form>
        </li>
      </ul>
    </div>
    <jsp:include page="../../templates/scripts.jsp">
    	<jsp:param value="defaults, ix.switch, ix.initialize, asignacion" name="scripts"/>
    </jsp:include>
  </body>
</html>
