<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang='es'>
  <head>
    <title>Solicitar Mantenimiento Correctivo</title>
    <link href='${pageContext.request.contextPath}/assets/stylesheets/screen.css' rel='stylesheet' type='text/css' />
  </head>
  <body>
    <div id='menu'>
      	<ul class='menu_items'>
      		<li><a href="security/logout">salir</a></li>
      		<li>${sessionScope.user.usuario}</li>
			<c:forEach var='m' items="${ modulos }">
				<li><a href="${ m.uri }">${ m.descripcion }</a></li>
			</c:forEach>
			<li><a href="${pageContext.request.contextPath}">Men&uacute; Principal</a></li>
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
            <label for='nombre'>C&oacute;digo Patrimonial</label>
            <input id='equipo' name="equipo" type='text' />
            </li>
            <li>
            <div class='actions'>
              <input id="buscar" class='default' type='submit' value='Buscar' />
            </div>
            </li>
            <li>
            	<ul class="desc">
            	<!-- <li>
            	<span class="desc_left">C&oacute;digo Patrimonial</span>
            	<span class="desc_right">0002033</span>
            	</li>
            	<li>
            	<span class="desc_left">Denominaci&oacute;n</span>
            	<span class="desc_right">M&aacute;quina de coser</span>
            	</li>
            	<li>
            	<span class="desc_left">Fabricante</span>
            	<span class="desc_right">Black & Decker</span>
            	</li>
            	<li>
            	<span class="desc_left">&Aacute;rea a la que pertenece</span>
            	<span class="desc_right">Emergencias</span>
            	</li> -->
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
                <!-- <tr>
                  <td>0002034</td>
                  <td>Ventilador</td>
                  <td>Samsung</td>
                </tr>
                <tr>
                  <td>0001045</td>
                  <td>Estetoscopio</td>
                  <td>EKG</td>
                </tr>
                <tr>
                  <td>0204014</td>
                  <td>Monitor 24"</td>
                  <td>Toshiba</td>
                </tr> -->
              </tbody>
            </table>
            </li>
            <li><h3>Problema Descrito</h3></li>
            <li><textarea id='texto'></textarea></li>
            <li>
            <div class='actions'>
              <input class='default' type='submit' value='Enviar' />
              <input type='submit' value='Quitar' />
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