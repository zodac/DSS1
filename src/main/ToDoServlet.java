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

		long startTime = System.nanoTime();
		String userName = request.getParameter("userName");

		String dbURL = "jdbc:mysql://localhost:3306/dss1";
		String username = "root";
		String password = "toor";
		Connection connection = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(dbURL, username, password);
			Statement statement = connection.createStatement();

			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			

			ResultSet resultset = statement.executeQuery("SELECT date, description FROM " + userName + "list");
			StringBuffer htmlRows = new StringBuffer();
			ResultSetMetaData metaData = resultset.getMetaData();
			int columnCount = metaData.getColumnCount();
			
			htmlRows.append("<!DOCTYPE html><HTML><TITLE>IMSI Query Result</TITLE>" //<!DOCTYPE html> needed for IE
					+ "<CENTER><p><B><FONT face=\"verdana\" color=\"red\" size=\"5\">"
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
			long timeTakenInNanos = System.nanoTime()-startTime;
			htmlRows.append("</TR></TABLE></CENTER>"
				+ "<DIV style=\"position: relative\""
				+ "<p style=\"position: fixed; bottom: 0; width=100%; text-align: center\"></p>"
				+ "<p><CENTER>Query executed in " + String.format("%.2f",(double) timeTakenInNanos/1000000) + " ms.</CENTER></p>"
				+ "</DIV></HTML>");

			String output = htmlRows.toString();
			out.print(output);

			out.close();
			resultset.close();
			statement.close();
			connection.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
}