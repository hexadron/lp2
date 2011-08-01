<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang='es'>
  <head>
    <title>Asignar T&eacute;cnicos a Solicitud</title>
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
        <h1>Asignar T&eacute;cnicos a Solicitud</h1>
      </div>
      <ul class='content'>
        <li>
        <form>
          <ul>
            <li>
            <h2>Solicitudes</h2>
            </li>
            <li>
           	<table id="solicitudes">
              <thead>
                <tr>
                  <fmt:message key='table.tooltip' var="tooltip" />
                  <th title="${ tooltip }">Código</th>
                  <th title="${ tooltip }">Fecha y hora</th>
                  <th title="${ tooltip }">&Aacute;rea solicitante</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach var='s' items="${ solicitudes }">
				<tr>
					<td class='solid'>${ s.id }</td>
					<td>${ s.fecha }</td>
					<td>${ s.usuario.area.descripcion }</td>
				</tr>
			  </c:forEach>
              </tbody>
            </table>
            </li>
            <li><h3>Equipos</h3></li>
            <li><span class="message">Seleccione un equipo para ver el problema</span></li>
            <li>
           	<table id="equipos">
              <thead>
                <tr>
                  <fmt:message key='table.tooltip' var="tooltip" />
                  <th title="${ tooltip }">C&oacute;digo Patrimonial</th>
                  <th title="${ tooltip }">Denominaci&oacute;n</th>
                  <th title="${ tooltip }">Fabricante</th>
                </tr>
              </thead>
              <tbody>
              </tbody>
            </table>
            </li>
            <li>
            <h3>T&eacute;cnicos</h3>
            </li>
            <li>
           	<table id="tecnicos">
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
              <c:forEach var='t' items="${ tecnicos }">
				<tr>
					<td class='tid'>${ t.id }</td>
					<td class='tnombre'>${ t.nombres }&nbsp;${ t.apellidos }</td>
					<td>${ t.fechaIngreso }</td>
					<td>${ t.especialidad }</td>
				</tr>
			  </c:forEach>
              </tbody>
            </table>
            </li>
            <li>
            <div class='actions'>
              <input class='default' id='asignar' type='submit' value='Asignar' disabled/>
            </div>
            </li>
            <li>
            <h3>Equipos Asignados</h3>
            </li>
            <li>
           	<table id="asignados">
              <thead>
                <tr>
                  <fmt:message key='table.tooltip' var="tooltip" />
                  <th title="${ tooltip }">Solicitud</th>
                  <th title="${ tooltip }">Equipo</th>
                  <th title="${ tooltip }">Denominación</th>
                  <th title="${ tooltip }">Técnico Encargado</th>
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
