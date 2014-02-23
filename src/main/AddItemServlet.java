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
import entity.ToDoObject;

@SuppressWarnings("serial")
public class AddItemServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String task = request.getParameter("task");
		String user = request.getParameter("user");

		String dbURL = "jdbc:mysql://localhost:3306/DSS1";
		String dbUser = "root";
		String dbPass = "toor";
		Connection connection = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(dbURL, dbUser, dbPass);
			
			ToDoObject todo = new ToDoObject(task, user);
			PersistenceUtil.persist(todo);
			
			connection.close();
			
			response.sendRedirect("todolist.jsp");
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
}