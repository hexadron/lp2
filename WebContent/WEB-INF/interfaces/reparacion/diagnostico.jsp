<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang='es'>
  <head>
    <title>Registrar Diagnóstico</title>
    <link href='${pageContext.request.contextPath}/assets/stylesheets/screen.css' rel='stylesheet' type='text/css' />
    <link href='${pageContext.request.contextPath}/assets/stylesheets/apprise.css' rel='stylesheet' type='text/css' />
    <style>
		#susterceros {
			background-color: hsl(0, 0%, 97%);
			width: 100%;
			height: 5em;
    		};
	</style>
  </head>
  <body>
    <div id='menu'>
      <ul class='menu_items'>
        <li>
        <a href="${pageContext.request.contextPath}/security/logout">salir</a></li>
      		<li>${sessionScope.user.perfil.descripcion}</li>
			<c:forEach var='m' items="${ modulos }">
				<li><a href="${pageContext.request.contextPath}/${ m.uri }">${ m.shorthand }</a></li>
			</c:forEach>
			<li><a href="${pageContext.request.contextPath}">Men&uacute; Principal</a></li>
      </ul>
    </div>
    <div class='container'>
      <div id='header'>
        <h1>Registrar Diagnóstico de Equipo</h1>
      </div>
      <ul class='content'>
        <li>
        <form>
          <ul>
            <li>
            <h2>Trabajos Asignados</h2>
            </li>
            <li>
              <span style="font-size: 1em;color: hsl(0, 60%, 40%);">Seleccione un trabajo para ver el problema</span>
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
             <textarea id='diagnostico'></textarea>
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
            <div style='margin-top: 1em'>
            	  <label for='terceros' style="width: 34em; text-align: right;">Solicitar Terceros</label><input id='terceros' name='terceros' type='checkbox' />
            </div>
            <div class='actions'>
              <input class='default' type='submit' value='Guardar' id='guardar' disabled/>
              <input type='submit' value='Cancelar' />
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
    				$("input[type='radio']").attr("disabled", b);
    				$("#diagnostico").attr("disabled", b);  				
    			}
    			
    			$('#terceros').click(function(e) {
    				if ($("#terceros").attr("checked") === "checked") {
    					e.preventDefault();
    					var elements =
        					"<div class='contentapprise'><h3>Sustentación de Solicitar Terceros</h3>" +
        					"<textarea id='susterceros'></textarea>"
        					"</div>";
        				apprise(elements, {verify: true, textYes: 'Aceptar', textNo: 'Cancelar' },
        					function(b) { $("#terceros").attr("checked", b); }
        				);    					
    				};
    				evaluarElementos();
    			});
    		});
    </script>
    </body>
</html>
