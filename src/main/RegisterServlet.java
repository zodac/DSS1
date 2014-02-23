package main;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class RegisterServlet extends HttpServlet {      

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String dbURL = "jdbc:mysql://localhost:3306/DSS1";
		String dbUserName = "root";
		String dbPassword = "toor";
		Connection connection = null;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(dbURL, dbUserName,
					dbPassword);

			response.setContentType("text/html");

			String userName = request.getParameter("username");
			String userPassword = request.getParameter("password");
			

			PreparedStatement statement = connection.prepareStatement("INSERT INTO users VALUES('"+userName+"',SHA('"+userPassword+"'))");
			statement.executeUpdate();
			
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
		}
		response.sendRedirect("index.jsp");
	}
}