<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang='es'>
  <head>
    <title>Registrar Reparación</title>
    <link href='${pageContext.request.contextPath}/assets/stylesheets/screen.css' rel='stylesheet' type='text/css' />
    <link href='${pageContext.request.contextPath}/assets/stylesheets/apprise.css' rel='stylesheet' type='text/css' />
    <style>
    		
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
        <h1>Mantener Perfiles</h1>
      </div>
      <ul class='content'>
        <li>
        <form>
          <ul>
            <li>
            <h2>Perfiles</h2>
            </li>
            <li>
              <span style="font-size: 1em;color: hsl(0, 60%, 40%);">Seleccione una reparación para ver el diagnóstico</span>
            </li>
            <li>
           	<table id="perfiles">
              <thead>
                <tr>
                  <fmt:message key='table.tooltip' var="tooltip" />
                  <th title="${ tooltip }">Descripción</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach var="p" items="${ perfiles }">
                <tr>
                  <td>${ p.descripcion }</td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
            </li>
            <li>
              <div class='actions'>
              	<input class='default' type='submit' value='Dar de Baja' />
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
                  <label style="width: 5em; text-align: left;">costo</label>
                  <input type="text" style="width: 5em;" name="costo" />
                </li>
                <li>
                  <label style="width: 5em; text-align: left;">garantía</label>
                  <input type="text" style="width: 5em;" name="garantia" />
                </li>
              </ul>
            </li>
            <li><h3>Recomendaciones</h3></li>
            <li>
             <textarea id='recomendaciones'></textarea>
            </li>
            <li>
            <div class='actions'>
              <input class='default' type='submit' value='Guardar' />
              <input type='submit' value='Limpiar' />
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
