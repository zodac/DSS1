<HTML><HEAD>

<%
	String userName = null;
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("user")) {
				userName = cookie.getValue();
			}
		}
	}
	if (userName == null)
		response.sendRedirect("index.jsp");

	response.setContentType("text/html");
	response.getWriter().print(
			"<TITLE>" + userName
					+ "'s To-Do List</TITLE>"+
					"<p id=\"name\" style=\"visibility:hidden\">" + userName + "</p>");
%>

<script>
var userName = document.getElementById("name").innerHTML;
</script>

</HEAD><BODY>


<form name="loadList" action="ToDoServlet" method="GET">
			<input type="text" name="userName" />
			<input type="submit" value="Load List" />
</form>





</BODY></HTML>






