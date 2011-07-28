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
    		#perfiles { width: 55%; margin: auto; }
    		#perfiles th, #perfiles td { text-align: center; }
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
           	<table id="perfiles">
              <thead>
                <tr>
                </tr>
              </thead>
              <tbody>
                <c:forEach var='p' items="${ perfiles }">
                <tr><td> ${ p.descripcion } </td></tr>
                </c:forEach>
              </tbody>
            </table>
            </li>
            <li><h2>Operaciones</h2></li>
            <li><a href="security/agregarperfiles">Agregar</a></li>
            <li><a href="security/editarperfiles">Editar</a></li>
            <li><a href="security/eliminarperfiles">Eliminar</a></li>
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
