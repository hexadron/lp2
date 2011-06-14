<%@ page trimDirectiveWhitespaces="true" %>
  <% String[] scripts = request.getParameter("scripts").split(","); %> 
  <% for (String s : scripts) { %>
  	<% if (s.equals("defaults")) { %>
  		<% String[] def = {"json2", "underscore", "underscore.string", "jquery", "backbone"}; %>
  		<% for (String d : def) { %>
  		<script type="text/javascript" src="assets/javascripts/lib/<%= d %>.js"></script>
  		<% } %>
  	<% } else { %>
	<script type="text/javascript" src="assets/javascripts/<%= s.trim() %>.js"></script>
  	<% } %>
  <% } %>