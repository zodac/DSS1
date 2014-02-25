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
	response.getWriter().print("<TITLE>" + userName+ "'s To-Do List</TITLE>");
%>

<script src="js/bootstrap.js"></script>
<link href="css/bootstrap.css" rel="stylesheet">

<style type="text/css">
    html, body {
      background-color: #B0C4DE;
    }
    body {
      padding-top: 40px; 
    }
    .container {
      width: 300px;
    }

    .container > .content {
      background-color: #fff;
      padding: 20px;
      margin: 0 -20px; 
      -webkit-border-radius: 10px 10px 10px 10px;
         -moz-border-radius: 10px 10px 10px 10px;
              border-radius: 10px 10px 10px 10px;
      -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.15);
         -moz-box-shadow: 0 1px 2px rgba(0,0,0,.15);
              box-shadow: 0 1px 2px rgba(0,0,0,.15);
    }
    
    .login-form {
		margin-left: 65px;
	}
	
	legend {
		margin-right: -50px;
		font-weight: bold;
	 	color: #404040;
	}
</style>

</HEAD>

<BODY>
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
					<form name="addItem" action="AddItemServlet" method="GET">
						<fieldset>
							<div class="control-group">
								<input type="text" name="task" placeholder="Task Description"/>
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
	
	
</BODY></HTML>






