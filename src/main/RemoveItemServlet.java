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
//		response.setHeader("Refresh", "5"); //URL becomes "http://localhost:8080/DSS1/RemoveItemServlet?removeID=xx"
//		response.getWriter().print("<script>location.reload();</script>"); //Reloads servlet too - endless loop.
	}
}