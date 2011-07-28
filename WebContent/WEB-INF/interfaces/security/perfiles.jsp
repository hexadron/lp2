<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang='es'>
  <head>
    <title>Mantener Perfiles</title>
    <link href='${pageContext.request.contextPath}/assets/stylesheets/screen.css' rel='stylesheet' type='text/css' />
    <link href='${pageContext.request.contextPath}/assets/stylesheets/apprise.css' rel='stylesheet' type='text/css' />
    <style>
		#susterceros {
			background-color: hsl(0, 0%, 97%);
			width: 100%;
			height: 5em;
    	};
    	.message {
    			font-size: 1em;
    			color: hsl(0, 60%, 40%); }
   		.selected, .eqselected, .tselected, .aselected { 
   			background-color: #FF8; }
   		.waitwhat {
   			margin-left: 14em;
   		}
   		.escondidos {
   			display: none;
   		}
	</style>
  </head>
  <body>
    <div id='menu'>
      <ul class='menu_items'>
        <li>
        <a href="${pageContext.request.contextPath}/security/logout">salir</a></li>
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
      	<li><h2>Perfiles</h2></li>
        <li>
        <form>
          <ul>
            <li>
           	<table id="reparaciones">
              <thead>
                <tr>
                  <fmt:message key='table.tooltip' var="tooltip" />
                  <th title="${ tooltip }">Denominacion</th>
                </tr>
              </thead>
              <tbody>
				<tr>
					<td>Administrador</td>
				</tr>
				<tr>
					<td>T&eacute;cnico Interno</td>
				</tr>
				<tr>
					<td>Usuario</td>
				</tr>
              </tbody>
            </table>
            </li>
            <li>
			<div class='actions'>
				<input class='default' type='submit' value='Nuevo' />
				<input class='default' type='submit' value='Editar' />
				<input class='default' type='submit' value='Eliminar' />
			</div>
            </li>
            <li class="Nuevo escondidos">
            	<ul>
            	<li><h3>Nuevo Perfil</h3></li>
            	<li><label>Nombre</label><input type="text"/></li>
            	<li><label>Modulos</label></li>
            	<li>
            		<ul>
            		<li class="waitwhat"><input type="checkbox"/> Diagn&oacute;stico de Equipos</li>
            		<li class="waitwhat"><input type="checkbox"/> Reparaci&oacute;n de Equipos</li>
            		<li class="waitwhat"><input type="checkbox"/> Terceros</li>
            		<li class="waitwhat"><input type="checkbox"/> Solicitar Mantenimiento Correctivo</li>
            		</ul>
            	</li>
            	<li>
            	<div class='actions'>
					<input class='default' type='submit' value='Guardar' />
					<input type='submit' value='Cancelar' />
				</div>
            	</li>
            	</ul>
            </li>
            <li class="Editar escondidos">
            	<ul>
            	<li><h3>Editar Perfil</h3></li>
            	<li><label>Nombre</label><input type="text"/></li>
            	<li><label>Modulos</label></li>
            	<li>
            		<ul>
            		<li class="waitwhat"><input type="checkbox"/> Diagn&oacute;stico de Equipos</li>
            		<li class="waitwhat"><input type="checkbox"/> Reparaci&oacute;n de Equipos</li>
            		<li class="waitwhat"><input type="checkbox"/> Terceros</li>
            		<li class="waitwhat"><input type="checkbox"/> Solicitar Mantenimiento Correctivo</li>
            		</ul>
            	</li>
            	<li>
            	<div class='actions'>
					<input class='default' type='submit' value='Guardar' />
					<input type='submit' value='Cancelar' />
				</div>
            	</li>
            	</ul>
            </li>
            
            <li class="Eliminar escondidos">
            	<p>¿Est&aacute; seguro que desea eliminar el perfil seleccionado?</p>
            	<div class='actions'>
					<input class='default' type='submit' value='S&iacute;' />
					<input type='submit' value='No' />
				</div>
            </li>
            
          </ul>
        </form>
        </li>
      </ul>
    </div>
    <script type="text/coffeescript">
		$ ->
			($ 'input[type=submit]').click (e) ->
				e.preventDefault()
				nombre = e.target.value
				el = ($ '.' + nombre)
				status = el.css 'display'
				el.css 'display', if status is 'block' then 'none' else 'block'
    </script>
    <jsp:include page="../../templates/scripts.jsp">
    	<jsp:param value="defaults, diagnostico" name="scripts"/>
    </jsp:include>
    </body>
</html>

