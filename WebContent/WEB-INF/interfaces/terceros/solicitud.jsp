<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <h1>Registrar Solicitud de Terceros</h1>
      </div>
      <ul class='content'>
        <li>
        <form>
          <ul>
            <li>
            <h2>Órdenes de Solicitud</h2>
            </li>
            <li>
           	<table id="solicitudes">
              <thead>
                <tr>
                  <fmt:message key='table.tooltip' var="tooltip" />
                  <th title="${ tooltip }">Orden Nro.</th>
                  <th title="${ tooltip }">Fecha de Orden</th>
                  <th title="${ tooltip }">Cod. Patrimonial</th>
                  <th title="${ tooltip }">Denominación del Equipo</th>
                  <th title="${ tooltip }">Técnico</th>
                </tr>
              </thead>
              <tbody>
              	<tr class="selected">
              		<td>000001</td>
              		<td>12/12/2011</td>
              		<td>000232</td>
              		<td>Licuadora</td>
              		<td>Alan Garc&iacute;a</td>
              	</tr>
                	<tr>
              		<td>000002</td>
              		<td>12/12/2001</td>
              		<td>000233</td>
              		<td>Cocina</td>
              		<td>Linus Torvalds</td>
              	</tr>
              </tbody>
            </table>
            </li>
            <li><h3>Diagnóstico</h3></li>
            <li><textarea disabled>Éste es un diagnóstico</textarea></li>
            <li><h3>Sustentación</h3></li>
            <li><textarea disabled>Ésta es una sustentación</textarea></li>
            <li>
            <div class='actions'>
              <input class='default' id='asignar' type='submit' value='Denegar'/>
              <input class='default' id='asignar' type='submit' value='Registrar'/>
            </div>
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
