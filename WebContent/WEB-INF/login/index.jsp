<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang='es'>
  <head>
    <title>Login</title>
    <link href='assets/stylesheets/screen.css' rel='stylesheet' type='text/css' />
  </head>
  <body>
    <div class='container'>
      <div id='header'>
        <h1>Inicia Sesi&oacute;n</h1>
      </div>
      <ul class='content'>
        <li>
          <form>
            <ul>
              <li>
                <h2>Ingresa tus datos</h2>
              </li>
              <li>
                <label for='nombre'>Usuario</label>
                <input id='nombre' type='text' />
              </li>
              <li>
                <label for='pwd'>Password</label>
                <input id='pwd' type='password' />
              </li>
              <li>
                <div class='actions'>
                  <input class='default' type='submit' value='Enviar' />
                  <input type='submit' value='Cancelar' />
                </div>
              </li>
            </ul>
          </form>
        </li>
      </ul>
    </div>
    <jsp:include page="../templates/scripts.jsp">
    	<jsp:param value="defaults" name="scripts"/>
    </jsp:include>
  </body>
</html>
