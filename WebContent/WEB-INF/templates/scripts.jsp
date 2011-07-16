<%@ page trimDirectiveWhitespaces="true" %>
  <% String[] scripts = request.getParameter("scripts").split(","); %> 
  <% for (String s : scripts) { %>
  	<% if (s.equals("defaults")) { %>
  		<% String[] def = {"json2", "underscore", "underscore.string", "jquery", "backbone", "apprise"}; %>
  		<% for (String d : def) { %>
  		<script type="text/javascript" src="${pageContext.request.contextPath}/assets/javascripts/lib/<%= d %>.js"></script>
  		<% } %>
  	<% } else { %>
	<script type="text/coffeescript" src="${pageContext.request.contextPath}/assets/coffeescripts/<%= s.trim() %>.coffee"></script>
  	<% } %>
  <% } %>
  <script type="text/javascript" src="${pageContext.request.contextPath}/assets/javascripts/coffee-script.js"></script>