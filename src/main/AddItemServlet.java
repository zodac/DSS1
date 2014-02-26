package main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import persistence.PersistenceUtil;
import entity.ToDoObject;
import entity.User;

@SuppressWarnings("serial")
public class AddItemServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String task = request.getParameter("task");
		
		String userName = null;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("user")) {
					userName = cookie.getValue();
				}
			}
		}
		User user = PersistenceUtil.findSingleUserName(userName);
		PersistenceUtil.persist(new ToDoObject(task, user));

		response.sendRedirect("toDoList.jsp");
	}
}