package main;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class ToDoServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("userName");

		String dbURL = "jdbc:mysql://localhost:3306/DSS1";
		String dbUser = "root";
		String dbPass = "toor";
		Connection connection = null;
		StringBuffer htmlRows = new StringBuffer();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(dbURL, dbUser, dbPass);
			Statement statement = connection.createStatement();
			htmlRows.append("<!DOCTYPE html><HTML><TITLE>" + userName + "'s to-do list</TITLE><BODY>"); //<!DOCTYPE html> needed for IE
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			
			
			if(tableExists(connection)){
				ResultSet resultset = statement.executeQuery("SELECT DATE_FORMAT(timestamp, '%d/%m/%Y %k:%i') AS Date, "
														   + "task AS Task FROM ToDoObject WHERE user='" + userName + "'");
				ResultSetMetaData metaData = resultset.getMetaData();
				int columnCount = metaData.getColumnCount();
				
				htmlRows.append("<CENTER><p><B><FONT face=\"verdana\" color=\"red\" size=\"5\">"
						+ "</FONT></B></p>"
						+ "<TABLE cellpadding=\"5\" border=\"1\"" + "<TR>");
	
				for (int i = 1; i <= columnCount; i++) {
					htmlRows.append("<TD><B>" + metaData.getColumnName(i)
							+ "</B></TD>");
				}
				htmlRows.append("</TR>");
	
				while (resultset.next()) {
					htmlRows.append("<TR>");
					for (int i = 1; i <= columnCount; i++) {
						htmlRows.append("<TD>" + resultset.getString(i) + "</TD>");
					}
					htmlRows.append("</TR>");
				}
				htmlRows.append("</TR></TABLE></CENTER>");
				resultset.close();
			}
			
			htmlRows.append("<DIV style=\"position: relative\">"
					+ "<p style=\"position: fixed; bottom: 0; width=100%; text-align: center\"></p>"
					+ "<CENTER><a href=\"addItem.jsp\"><button>Add Item</button></a></CENTER>"
					+ "</DIV></BODY></HTML>");

			String output = htmlRows.toString();
			out.print(output);

			out.close();
			
			statement.close();
			connection.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	private boolean tableExists(Connection connection) throws SQLException {
		ResultSet tables = connection.getMetaData().getTables(null, null, "ToDoObject", null);
		if (tables.next())
			return true;
		
		return false;
	}
}