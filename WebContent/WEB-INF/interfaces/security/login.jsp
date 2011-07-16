<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang='es'>
  <head>
    <title>Login</title>
    <meta charset="utf-8">
    <link href='${pageContext.request.contextPath}/assets/stylesheets/screen.css' rel='stylesheet' type='text/css' />
  </head>
  <body>
    <div class='container'>
      <div id='header'>
        <h1>Inicia Sesi&oacute;n</h1>
      </div>
      <ul class='content'>
        <li>
          <form action="${pageContext.request.contextPath}/security/authenticate" method="post">
            <ul>
              <li>
                <h2>Ingresa tus datos</h2>
              </li>
              <li>
                <label for='nombre'>Usuario</label>
                <input name="nombre" id='nombre' type='text' />
              </li>
              <li>
                <label for='pwd'>Password</label>
                <input name="password" id='pwd' type='password' />
              </li>
              <li>
                <div class='actions'>
                  <span id='error'>${ error }</span>
                  <input class='default' type='submit' value='Ingresar' id="login" />
                </div>
              </li>
            </ul>
          </form>
        </li>
      </ul>
    </div>
    <jsp:include page="../../templates/scripts.jsp">
    	<jsp:param value="defaults, dorotea" name="scripts"/>
    </jsp:include>
  </body>
</html>