package main;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;

import persistence.PersistenceUtil;
import entity.User;

@SuppressWarnings("serial")
public class RegisterServlet extends HttpServlet {      

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean valid = true;
			
		String userName = request.getParameter("username");
		String userPassword = request.getParameter("password");
		
		List<String> userNamesFromDB = PersistenceUtil.findAllUserNames();

		for(String userNameFromDB : userNamesFromDB){
			if(userNameFromDB.equalsIgnoreCase(userName)){
				valid = false;
				break;
			}
		}
		
		if(valid){
			PersistenceUtil.persist(new User(userName, DigestUtils.sha1Hex(userPassword)));
			response.sendRedirect("index.jsp");
		} else {
			response.getWriter().print("<script>alert(\"Username taken!\");"
					+ "window.location.replace(\"register.jsp\");</script>");
		}
	}
}