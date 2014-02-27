<%@ page contentType="text/html" language="java" import="java.sql.*"%>
<!DOCTYPE html>
<html><head>
	<title>Add Task</title>
	
	<script src="js/validation.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/jquery.tools.min.js"></script>
	<link href="css/bootstrap.css" rel="stylesheet">
	<link href="css/customBootstrap.css" rel="stylesheet">
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
	}
%>	
	<script>
		$(function() {
			$("#task").tooltip({
		    	position: "center right",
		    	offset: [-2, 10],
		    	effect: "fade",
		    	opacity: 0.7
		    });
		});
	</script>
</head>

<body>
	<div style="position: absolute; top: 10; right: 0; margin-right: 10px;">
		<form method="POST" name="logout" action="LoginServlet">
				<button class="btn btn-danger" type="submit">Logout</button>
		</form>
	</div>
	
	<div class="container">
		<div class="content">
			<div class="row">
				<div class="login-form">
					<h2>Add Task</h2>
					<form id="myform" name="addItem" action="AddItemServlet" method="GET" onsubmit="return validateTask(this.task)">
						<fieldset>
							<div class="control-group">
								<input id="task" type="text" name="task" placeholder="Task Description" title="Maximum of 255 characters" required />
							</div>
							<button class="btn btn-success" type="submit">Add to list</button>
							<a href="toDoList.jsp">
								<button class="btn btn-warning" type="button">Cancel</button>
							</a>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
</body></html>