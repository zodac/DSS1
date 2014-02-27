<%@ page contentType="text/html" language="java" import="java.sql.*"%>
<%@ page contentType="text/html" language="java" import="persistence.*"%>
<%@ page contentType="text/html" language="java" import="java.util.List"%>
<!DOCTYPE html>
<html><head>
	<script src="js/bootstrap.js"></script>
	<link href="css/bootstrap.css" rel="stylesheet">
	<link href="css/customBootstrap.css" rel="stylesheet">
</head>

<body>
	<div style="position: absolute; top: 10; right: 0; margin-right: 10px;">
		<form method="POST" name="logout" action="LoginServlet">
				<button class="btn btn-danger" type="submit">Logout</button>
		</form>
	</div>

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
	if (userName == null){
		response.getWriter().print("<script>alert(\"Must be logged in to view that page!\");"
				 				 + "window.location.replace(\"index.jsp\");</script>");
	} else{
		response.getWriter().print("<TITLE>" + userName + "'s To-Do List</TITLE>"
								 + "<CENTER><H2>" + userName + "'s To-Do List</H2></CENTER>");
			
		List<Object[]> toDoObjects = PersistenceUtil.findToDoObjectsByUsername(userName);
		
		if(!toDoObjects.isEmpty()){
			response.getWriter().print("<div class=\"container\" style=\"width: 900px;\">"
					+ "<div class=\"content\"><div style=\"max-height:535px; overflow:auto;\">"
					+ "<TABLE class=\"table table-striped table-condensed table-bordered\" cellpadding=\"5\" border=\"1\" style=\"table-layout: fixed;\">");
			
			
			response.getWriter().print("<TR>"
									 + "<TD style=\"width: 150px;\"><B>Timestamp</B></TD>"
									 + "<TD><B>Task</B></TD>"
									 + "<TD style=\"width: 120px;\"><B>Remove Task</B></TD>"
									 + "</TR>");
			
			for(Object[] obj : toDoObjects){
				response.getWriter().print("<TR>"
										 + "<TD style=\"width: 150px;\"><CENTER>" + String.valueOf(obj[0]) + "</CENTER></TD>"
										 + "<TD style=\"max-width: 200px; word-wrap: break-word\">" + String.valueOf(obj[1]) + "</TD>"
									 	 + "<TD style=\"width: 120px;\"><CENTER>"
									 	 	+ "<form method=\"GET\" action=\"RemoveItemServlet\">"
										 	+ "<input type=\"text\" value=\"" + String.valueOf(obj[2]) + "\" style=\"display:none;\" name=\"removeID\" />"
										 	+ "<button class=\"btn btn-warning\" type=\"submit\">Remove</button>"
										 	+ "</form></CENTER>"
											+ "</TD>"
										+ "</TR>");
			}
			response.getWriter().print("</TABLE></div></div></div><br /></CENTER>");
		}
	}
%>
	
	<div style="position: relative; text-align: center">
		<a href="addItem.jsp">
			<button style="position: relative; text-align:center" class="btn btn-success" type="button">Add Item</button>
		</a>
	</div>
</body></html>