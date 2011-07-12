<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Solicitud</title>
</head>
<body>
	<!-- Y aquí vamos a diagramar más o menos lo que nos dijo Athenas... -->
	<!-- mejor que hacerlo en mockups o prototipos -->
	<h1>Solicitud de Mantenimiento</h1>
	<h3>Ingrese el código patrimonial</h3>
	<div id="sub">
		<input type="text" id="equipo"/><span id="check"></span>
		<input type="button" value="Agregar"/>
	</div>
	<table id="equipos">
		
	</table>
	<h3>Problema presentado</h3><span id="sol_type"></span>
	<textarea id="descripcion"></textarea>
	<input type="button" value="Enviar solicitud"/>
</body>
</html>