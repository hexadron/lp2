<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8" />
  	<% String[] styles = request.getParameter("styles").split(","); %> 
  	<% for (String s : styles) { %>
  	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/stylesheets/<%= s.trim() %>.css" />
  	<% } %>
    <title><%= request.getParameter("title") %></title>
  </head>
  <body>