<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang='es'>
  <head>
    <title>Registrar Reparación</title>
    <link href='${pageContext.request.contextPath}/assets/stylesheets/screen.css' rel='stylesheet' type='text/css' />
    <link href='${pageContext.request.contextPath}/assets/stylesheets/apprise.css' rel='stylesheet' type='text/css' />
  </head>
  <body>
    <div id='menu'>
      <ul class='menu_items'>
        <li><a href="${pageContext.request.contextPath}/security/logout">Salir</a></li>
<%--         <li>${ sessionScope.user.usuario }</li> --%>
        <li>${ sessionScope.nombre }</li>
        <li><a href="${pageContext.request.contextPath}/reparacion/diagnostico">Diagn&oacute;stico</a></li>
        <li><a href="${pageContext.request.contextPath}">Men&uacute; principal</a></li>
      </ul>
    </div>
    <div class='container'>
      <div id='header'>
        <h1>Registrar Reparación de Equipo</h1>
      </div>
      <ul class='content'>
        <li>
        <form>
          <ul>
            <li>
            <h2>Trabajos</h2>
            </li>
            <li>
              <span style="font-size: 1em;color: hsl(0, 60%, 40%);">Seleccione una reparación para ver el problema y el diagnóstico</span>
            </li>
            <li>
           	<table id="reparaciones">
              <thead>
                <tr>
                  <fmt:message key='table.tooltip' var="tooltip" />
                  <th title="${ tooltip }">Fecha de Inicio</th>
                  <th title="${ tooltip }">Código de Reparación</th>
                  <th title="${ tooltip }">Equipo</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>12/07/2011</td>
                  <td>0000322</td>
                  <td>Refrigeradora</td>
                </tr>
                <tr>
                  <td>13/07/2011</td>
                  <td>0000323</td>
                  <td>Cocina</td>
                </tr>
              </tbody>
            </table>
            </li>
            <li><h3>Diagnóstico</h3></li>
            <li>
             <textarea></textarea>
            </li>
            <li><h3>Prioridad</h3></li>
            <li>
              <ul>
                <li>
                  <label style="width: 7em; text-align: left;">Programable</label>
                  <input type="radio" name="prioridad" value="Programable" /></li>
                <li>
                  <label style="width: 7em; text-align: left;">Urgente</label>
                  <input type="radio" name="prioridad" value="Urgente" /></li>
                <li>
                  <label style="width: 7em; text-align: left;">Muy Urgente</label>
                  <input type="radio" name="prioridad" value="Muy Urgente" /></li>
              </ul>
            </li>
            <li>
            <div class='actions'>
              <input class='default' type='submit' value='Guardar' />
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
    <script type="text/javascript">
    		$(function() {
    			$("#reparaciones td").click(function() {
    				// este problema se carga usando ajax enviando el id de la solicitud y
    				// el id del equipo. Éstos se obtienen del atributo id del elemento
    				// seleccionado.
    				var problema = 
    					"<h2>Ventilador [000233]</h2>" + 
					"<h4>Reparación #1111</h4>" + 
					"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit." + 
					" Duis venenatis metus ut purus molestie facilisis. Morbi" + 
					" fermentum tincidunt ipsum quis pretium. Ut in elit risus." + 
					" Nulla pellentesque odio et augue varius sed pellentesque augue" +
					" accumsan. Vivamus at quam diam. Quisque sollicitudin nisi ut" + 
					" mauris consectetur eu molestie ante lacinia. Aenean at diam" +
					" ipsum, a vestibulum magna. Sed vel neque ligula, at viverra nunc." +
					" Cum sociis natoque penatibus et magnis dis parturient montes," + 
					" nascetur ridiculus mus. Nunc consequat interdum auctor.</p> "
    				apprise(problema, {verify: true, textYes: 'seleccionar', textNo: 'cancelar'});
    			});	
    		});
    </script>
  </body>
</html>
