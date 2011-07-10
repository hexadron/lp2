<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang='es'>
  <head>
    <title>Solicitar Mantenimiento Correctivo</title>
    <link href='${pageContext.request.contextPath}/assets/stylesheets/ads.css' rel='stylesheet' type='text/css' />
  </head>
  <body>
    <div id='menu'>
      <ul class='menu_items'>
        <li>Salir</li>
        <li>jmedina</li>
        <li>Solicitudes Realizadas</li>
        <li>Solicitar</li>
        <li>Men&uacute; principal</li>
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
            <li class="halflife">
            <ul class="halflife">
            <li>
            	<label for='nombre'>Ingrese el c&oacute;digo patrimonial</label>
            	<input id='nombre' name="nombre" type='text' />
            </li>
            <li>
            <div class='actions'>
              <input id="buscar" class='default' type='submit' value='Buscar' />
            </div>
            </li>
            <li>
            	<label class='nowrap'>Describa el problema:</label>
            <textarea></textarea></li>
            </ul>
            </li>
            <li id="omg1" class="halflife secondpane">
            	<ul class="desc halflife">
            	
            	<li>
            	<p class="error">Equipo no encontrado</p>
            	</li>
            	</ul>
            </li>
            <li>
            <div class='actions'>
              <input class='default' type='submit' value='Agregar a solicitud' disabled />
            </div>
            </li>
            <li><h2>Solicitud</h2></li>
            <li class="halflife">
            <table>
              <thead>
                <tr>
                  <fmt:message key='table.tooltip' var="tooltip" />
                  <th class="numeric" title="${ tooltip }">C&oacute;digo Patrimonial</th>
                  <th class="date" title="${ tooltip }">Denominaci&oacute;n</th>
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
            <li id="omg2" class="halflife secondpane">
            <ul class="halflife">
            <li><span>Problema Descrito</span></li>
            <li><textarea id='texto'></textarea></li>
            </ul>
            </li>
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
  </body>
</html>
