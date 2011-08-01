<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang='es'>
  <head>
    <title>Mantener Usuarios</title>
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
        <h1>Mantener Usuarios</h1>
      </div>
      <ul class='content'>
        <li>
        <form method="post">
          <ul>
            <li><h3>Buscar usuarios</h3></li>
            <li><label>Nombre</label><input type="text"/></li>
            <li><div class='actions'>
            		<input class='default' type='submit' value='Buscar' />
            </div>
            </li>
           	<li><table id="reparaciones">
              <thead>
                <tr>
                  <fmt:message key='table.tooltip' var="tooltip" />
                  <th title="${ tooltip }">Nombre de usuario</th>
                  <th title="${ tooltip }">Perfil</th>
                  <th title="${ tooltip }">&Aacute;rea</th>
                </tr>
              </thead>
              
              <tbody>
				<tr>
					<td>jorgemedina</td>
					<td>Jefe</td>
					<td>Recursos Humanos</td>
				</tr>
				<tr>
					<td>vanhohenheim</td>
					<td>T&eacute;cnico Interno</td>
					<td>Log&iacute;stica</td>
				</tr>
				<tr>
					<td>ceciliaperez</td>
					<td>Usuario</td>
					<td>Emergencias</td>
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
            <li class="Buscar escondidos">
            	<ul>
            	<li>
            	<div class='actions'>
					<input class='default' type='submit' value='Buscar' />
					<input type='submit' value='Cancelar' />
				</div>
            	</li>
            	</ul>
            </li>
            <li class="Nuevo escondidos">
            	<ul>
            	<li><h3>Nuevo usuario</h3></li>
            	<li><label>Usuario</label><input type="text"/></li>
            	<li><label>Contraseña</label><input type="text"/></li>
            	<li><label>Perfil</label>
            		<select>
            			<option>Seleccione perfil</option>
            		</select></li>
            	<li><label>Area</label>
            		<select>
            			<option>Seleccione area</option>
            		</select></li>
            	<li>
            		<label>Interno</label><input type="checkbox"/>
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
            	<li><h3>Editar usuario</h3></li>
            	<li><label>Nombre</label><input type="text"/></li>
            	<li><label>Contraseña</label><input type="text"/></li>
            	<li><label>Perfil</label>
            		<select>
            			<option>Seleccione perfil</option>
            		</select></li>
            	<li><label>Area</label>
            		<select>
            			<option>Seleccione area</option>
            		</select></li>
            	<li>
            		<label>Interno</label><input type="checkbox"/>
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
            	<p>¿Est&aacute; seguro que desea eliminar el usuario seleccionado?</p>
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

