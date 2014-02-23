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

</HEAD><BODY>

fuck

<form name="addItem" action="AddItemServlet" method="GET">
			Task: <input type="text" name="task" /> <br />
			Username: <input type="text" name="user" />
			<input type="submit" value="Add to list" />
</form>


</BODY></HTML>






