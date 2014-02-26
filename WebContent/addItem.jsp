<%@ page contentType="text/html" language="java" import="java.sql.*"%>
<!DOCTYPE html>
<html><head>
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

	response.getWriter().print("<TITLE>" + userName + "'s To-Do List</TITLE>");
%>

<script src="js/validation.js"></script>
<script src="js/bootstrap.js"></script>
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/customBootstrap.css" rel="stylesheet">

</head>

<body>
	<div style="position: absolute; top: 10; right: 0; margin-right: 10px;">
		<form method="post" name="logout" action="LogoutServlet">
				<button class="btn btn-danger" type="submit">Logout</button>
		</form>
	</div>
	
	<div class="container">
		<div class="content">
			<div class="row">
				<div class="login-form">
					<h2>Add Task</h2>
					<form name="addItem" action="AddItemServlet" method="GET" onsubmit="return validateTask(this.task)">
						<fieldset>
							<div class="control-group">
								<input type="text" name="task" placeholder="Task Description" required />
							</div>
							<button class="btn btn-success" type="submit">Add to list</button>
							<a href="todolist.jsp">
								<button class="btn btn-warning" type="button">Cancel</button>
							</a>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
</body></html>