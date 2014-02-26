package main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import persistence.PersistenceUtil;

@SuppressWarnings("serial")
public class RemoveItemServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String taskID = request.getParameter("removeID");
		
		if(taskID != null){
			Integer itemID = Integer.parseInt(taskID);
			PersistenceUtil.removeToDoObject(itemID);
		}
		response.sendRedirect("toDoList.jsp");
	}
}