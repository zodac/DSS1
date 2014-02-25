package main;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import persistence.PersistenceUtil;

@SuppressWarnings("serial")
public class RemoveItemServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String dbURL = "jdbc:mysql://localhost:3306/DSS1";
		String dbUser = "root";
		String dbPass = "toor";
		Connection connection = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(dbURL, dbUser, dbPass);

			String taskID = request.getParameter("removeID");
			
			if(taskID != null){
				Integer itemID = Integer.parseInt(taskID);
				PersistenceUtil.removeToDoObject(itemID);
			}
			
			connection.close();
			response.sendRedirect("todolist.jsp");
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
}