<%@ page language="java" import="java.sql.*"%>
<!DOCTYPE html>
<HTML><HEAD>


<script src="js/bootstrap.js"></script>
<link href="css/bootstrap.css" rel="stylesheet">

<style type="text/css">
    html, body {
      background-color: #eee;
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
			"<TITLE>" + userName + "'s To-Do List</TITLE>");

	String DRIVER = "com.mysql.jdbc.Driver";
	Class.forName(DRIVER).newInstance();

	Connection connection = null;
	ResultSet resultset = null;
	Statement statement = null;

	try {
		String dbURL = "jdbc:mysql://localhost:3306/DSS1";
		String dbUser = "root";
		String dbPass = "toor";

		connection = DriverManager.getConnection(dbURL, dbUser, dbPass);
		statement = connection.createStatement();
		response.setContentType("text/html");
		ResultSet tables = connection.getMetaData().getTables(null, null, "ToDoObject", null);

		if(tables.next()){

			resultset = statement.executeQuery("SELECT DATE_FORMAT(timestamp, '%d/%m/%Y %k:%i') AS Timestamp, "
													   + "task AS Task, ID FROM ToDoObject WHERE userName='" + userName + "'");
			
			resultset.last(); 
			int total = resultset.getRow();
			resultset.beforeFirst();
			
			response.getWriter().print("<center><h2>" + userName + "'s To-Do List</h2></center>");

			if(total > 0){
				ResultSetMetaData metaData = resultset.getMetaData();
				int columnCount = metaData.getColumnCount();
				
				response.getWriter().print("<CENTER><p><B><FONT face=\"verdana\" color=\"red\" size=\"5\">"
						+ "</FONT></B></p>"
						+ "<TABLE class=\"table table-striped table-condensed table-bordered\" cellpadding=\"5\" border=\"1\"" + "<TR>");
	
				for (int i = 1; i <= columnCount; i++)
					if(i == 1)
						response.getWriter().print("<TD style=\"width: 150px;\"><B>" + metaData.getColumnName(i) + "</B></TD>");
					else if(i < columnCount)
						response.getWriter().print("<TD><B>" + metaData.getColumnName(i) + "</B></TD>");
					else
						response.getWriter().print("<TD style=\"width: 120px;\"><B>Remove Task</B></TD>");
				response.getWriter().print("</TR>");
				
				while (resultset.next()) {
					response.getWriter().print("<TR>");
					for (int i = 1; i <= columnCount; i++) {
						if(i == 1)
							response.getWriter().print("<TD style=\"width: 150px;\"><CENTER>" + resultset.getString(i) + "</CENTER></TD>");
						else if(i < columnCount)
							response.getWriter().print("<TD>" + resultset.getString(i) + "</TD>");
						else
							response.getWriter().print("<TD style=\"width: 120px;\"><CENTER>"
								+"<form method=\"POST\" action=\"RemoveItemServlet\">"
								+"<input type=\"text\" value=\"" + resultset.getString(i) + "\" style=\"display:none;\" name=\"removeID\" />"
								+"<button class=\"btn btn-warning\" type=\"submit\">Remove</button>"
								+"</form></CENTER></TD>");
						
					}
					response.getWriter().print("</TR>");
				}
				response.getWriter().print("</TR></TABLE></CENTER>");
			}
			resultset.close();
		}
		
		statement.close();
		connection.close();
	} catch (Exception e) {
		System.out.println(e.getMessage());
	}
%>

<div style="position: relative; text-align: center">
	<a href="addItem.jsp">
		<button style="position: relative; text-align:center" class="btn btn-success" type="button">Add Item</button>
	</a>
</div>

</BODY></HTML>