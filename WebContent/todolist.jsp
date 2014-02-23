<%@ page language="java" import="java.sql.*"%>
<!DOCTYPE html>
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

			resultset = statement.executeQuery("SELECT DATE_FORMAT(timestamp, '%d/%m/%Y %k:%i') AS Date, "
													   + "task AS Task FROM ToDoObject WHERE user='" + userName + "'");
			ResultSetMetaData metaData = resultset.getMetaData();
			int columnCount = metaData.getColumnCount();
			
			response.getWriter().print("<CENTER><p><B><FONT face=\"verdana\" color=\"red\" size=\"5\">"
					+ "</FONT></B></p>"
					+ "<TABLE cellpadding=\"5\" border=\"1\"" + "<TR>");

			for (int i = 1; i <= columnCount; i++) {
				response.getWriter().print("<TD><B>" + metaData.getColumnName(i)
						+ "</B></TD>");
			}
			response.getWriter().print("</TR>");

			while (resultset.next()) {
				response.getWriter().print("<TR>");
				for (int i = 1; i <= columnCount; i++) {
					response.getWriter().print("<TD>" + resultset.getString(i) + "</TD>");
				}
				response.getWriter().print("</TR>");
			}
			response.getWriter().print("</TR></TABLE></CENTER>");
			resultset.close();
		}
		
		statement.close();
		connection.close();
		
		
		
	} catch (Exception e) {
		System.out.println(e.getMessage());
	}
%>

</HEAD><BODY>

<DIV style="position: relative">
		<p style="position: fixed; bottom: 0; width =100%; text-align: center"></p>
			<a href="addItem.jsp">Add Item</a>
</DIV>

<div>
	<form method="post" name="logout" action="LogoutServlet">
		<input type="submit" value="Logout" />
	</form>

</div>
</BODY>
</HTML>






