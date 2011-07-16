<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang='es'>
  <head>
    <title>Asignar T&eacute;cnicos a Solicitud</title>
    <link href='${pageContext.request.contextPath}/assets/stylesheets/screen.css' rel='stylesheet' type='text/css' />
    <link href='${pageContext.request.contextPath}/assets/stylesheets/apprise.css' rel='stylesheet' type='text/css' />
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
           	<table>
              <thead>
                <tr>
                  <fmt:message key='table.tooltip' var="tooltip" />
                  <th title="${ tooltip }">Código</th>
                  <th title="${ tooltip }">Fecha y hora</th>
                  <th title="${ tooltip }">&Aacute;rea solicitante</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>00000001</td>
                  <td>10/01/2011 4:50</td>
                  <td>Recursos Humanos</td>
                </tr>
                <tr>
                  <td>00000002</td>
                  <td>20/03/2011 19:21</td>
                  <td>Finanzas</td>
                </tr>
              </tbody>
            </table>
            </li>
            <li><h3>Equipos</h3></li>
            <li><span style="font-size: 1em;color: hsl(0, 60%, 40%);">Seleccione un equipo para ver el problema</span></li>
            <!-- Arturo, dale estilo a este span -->
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
                <tr>
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
                </tr>
              </tbody>
            </table>
            </li>
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
            <div class='actions'>
              <input type='submit' value='Asignar' />
              <input class='default' type='submit' value='Historial Técnico' />
            </div>
            </li>
            <li>
            <h2>Equipos Asignados</h2>
            </li>
            <li>
           	<table>
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
                <tr>
                  <td>0003561</td>
                  <td>0000001</td>
                  <td>Máquina de Rayos X</td>
                  <td>Juan Flores</td>
                </tr>
                <tr>
                  <td>0003561</td>
                  <td>0000002</td>
                  <td>Máquina de Rayos Z</td>
                  <td>Juan Flores</td>
                </tr>
                <tr>
                  <td>000356</td>
                  <td>0000004</td>
                  <td>Máquina de Rayos Y</td>
                  <td>Juan Flores</td>
                </tr>
              </tbody>
            </table>
            </li>
            <li>
            <div class='actions'>
              <input type='submit' value='Confirmar' />
              <input class='default' type='submit' value='Quitar' />
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
    			$("#equipos td").click(function() {
    				// este problema se carga usando ajax enviando el id de la solicitud y
    				// el id del equipo. Éstos se obtienen del atributo id del elemento
    				// seleccionado.
    				var problema = 
    					"<h2>Ventilador [000233]</h2>" + 
					"<h4>Solicitud #1111</h4>" + 
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
