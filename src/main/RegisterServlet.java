package main;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
		ResultSet resultset = null;
		Statement userStatement = null;
		boolean valid = true;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(dbURL, dbUserName,
					dbPassword);

			response.setContentType("text/html");

			String userName = request.getParameter("username");
			String userPassword = request.getParameter("password");
			
			userStatement = connection.createStatement();
			resultset = userStatement.executeQuery("SELECT userName FROM users");
			
			while(resultset.next() && valid){
				if(resultset.getString(1).equals(userName))
					valid = false;
			}
			
			if(valid){
				PreparedStatement statement = connection.prepareStatement("INSERT INTO users VALUES('"+userName+"',SHA('"+userPassword+"'))");
				statement.executeUpdate();
				statement.close();
			}
			
			connection.close();
			resultset.close();
			userStatement.close();			
		} catch (SQLException | ClassNotFoundException e) {
			
		} finally {
		}
		
		if(valid)
			response.sendRedirect("index.jsp");
		else{
			response.getWriter().print("<script>alert(\"Username already taken!\");window.navigate(\"register.jsp\");</script>");
		}
	}
}