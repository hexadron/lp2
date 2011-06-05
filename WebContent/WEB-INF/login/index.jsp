<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang='es'>
  <head>
    <title>Login</title>
    <link href='${pageContext.request.contextPath}/assets/stylesheets/screen.css' rel='stylesheet' type='text/css' />
  </head>
  <body>
    <div class='container'>
      <div id='header'>
        <h1>Mantenimiento de Equipos</h1>
      </div>
      <ul class='content'>
        <li>
          <form>
            <ul>
              <li>
                <h2>Datos del Equipo</h2>
              </li>
              <li>
                <h3>Datos Basicos</h3>
              </li>
              <li>
                <label for='nombre'>Texto</label>
                <input id='nombre' type='text' />
              </li>
              <li>
                <label for='pwd'>Password</label>
                <input id='pwd' type='password' />
              </li>
              <li>
                <h3>Prioridades</h3>
              </li>
              <li>
                <fieldset>
                  <legend>Datos seleccionables</legend>
                  <ul>
                    <li>
                      <label for='radio1'>Radio 1</label>
                      <input id='radio1' name='radio' type='Radio' value='1' />
                    </li>
                    <li>
                      <label for='radio2'>Radio 2</label>
                      <input id='radio2' name='radio' type='radio' value='1' />
                    </li>
                    <li>
                      <label for='radio3'>Radio 3</label>
                      <input id='radio3' name='radio' type='radio' value='1' />
                    </li>
                  </ul>
                </fieldset>
              </li>
              <li>
                <h3>Metadatos</h3>
              </li>
              <li>
                <label for='check'>Checkbox</label>
                <input id='check' type='checkbox' />
              </li>
              <li>
                <h3>Supertextos</h3>
              </li>
              <li>
                <label class='nowrap' for='texto'>Ingresa una descripcion del problema:</label>
              </li>
              <li>
                <textarea id='texto'></textarea>
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
  </body>
</html>
