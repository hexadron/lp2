<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang='es'>
  <head>
    <title>Reparación Externa</title>
    <link href='${pageContext.request.contextPath}/assets/stylesheets/screen.css' rel='stylesheet' type='text/css' />
    <link href='${pageContext.request.contextPath}/assets/stylesheets/apprise.css' rel='stylesheet' type='text/css' />
    <style>
    		#susbaja {
    			background-color: hsl(0, 0%, 97%);
    			width: 100%;
    			height: 5em;
    		};
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
        <h1>Registrar Reparación<br/> por Técnico Externo</h1>
      </div>
      <ul class='content'>
        <li>
        <form>
          <ul>
            <li>
            <h2>Trabajos</h2>
            </li>
            <li>
              <span style="font-size: 1em;color: hsl(0, 60%, 40%);">Seleccione una reparación para ver el diagnóstico</span>
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
            <li>
              <div class='actions'>
              	<input class='default' id="baja" type='submit' value='Dar de Baja' />
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
              <input class='default' type='submit' value='Guardar' disabled/>
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
    <script type="text/javascript">
    		$(function() {
    			$("#reparaciones td").click(function() {
    				// este problema se carga usando ajax enviando el id de la solicitud y
    				// el id del equipo. Éstos se obtienen del atributo id del elemento
    				// seleccionado.
    				var problema = 
    					"<div class='contentapprise'><h2>Ventilador [000233]</h2>" + 
					"<h4>Reparación #1111</h4>" +
					"<h3> Diagnóstico </h3>" +
					"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit." + 
					" Duis venenatis metus ut purus molestie facilisis. Morbi" + 
					" fermentum tincidunt ipsum quis pretium. Ut in elit risus." + 
					" Nulla pellentesque odio et augue varius sed pellentesque augue" +
					" accumsan. Vivamus at quam diam. Quisque sollicitudin nisi ut" + 
					" mauris consectetur eu molestie ante lacinia. Aenean at diam" +
					" ipsum, a vestibulum magna. Sed vel neque ligula, at viverra nunc." +
					" Cum sociis natoque penatibus et magnis dis parturient montes," + 
					" nascetur ridiculus mus. Nunc consequat interdum auctor.</p></div>"
    				apprise(problema, {verify: true, textYes: 'seleccionar', textNo: 'cancelar'});
    			});
    			
    			var evaluarElementos = function() {
    				var checked = $("#terceros").attr("checked");
    				var b = checked ? true : false;
    				$("input[type='text']").attr("disabled", b);
    				$("#trabajo").attr("disabled", b);
    				$("#recomendaciones").attr("disabled", b);  				
    			}
    			
    			$('#baja').click(function(e) {
				e.preventDefault();
				var elements =
	  					"<div class='contentapprise'><h3>Sustentación de Baja</h3>" +
	  					"<textarea id='susbaja'></textarea>"
	  					"</div>";
				apprise(elements, {verify: true, textYes: 'Aceptar', textNo: 'Cancelar' });    					
				evaluarElementos();
    			});
    		});
    </script>
  </body>
</html>
