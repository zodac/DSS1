package main;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;

import persistence.PersistenceUtil;
import entity.User;

@SuppressWarnings("serial")
public class LoginServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");

		String userName = request.getParameter("userName");
		String userPassword = request.getParameter("password");

		User user = PersistenceUtil.findUserAndPasswordByUsername(userName);
		
		if(user == null){
			response.getWriter().print("<script>alert(\"Username or password invalid!\");"
					+ "window.location.replace(\"index.jsp\");</script>");
		} else {
			PrintWriter out = response.getWriter();
			String userNameFromDB = user.getUserName();
			String passWordFromDB = user.getUserPassword();
			
			
			if(passWordFromDB.equals(DigestUtils.sha1Hex(userPassword))){
				Cookie loginCookie = new Cookie("user", userNameFromDB);
				loginCookie.setMaxAge(15*60);

				response.addCookie(loginCookie);
				response.sendRedirect("toDoList.jsp");
			} else{
				response.getWriter().print("<script>alert(\"Username or password invalid!\");"
						+ "window.location.replace(\"index.jsp\");</script>");
			}
			out.close();
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		Cookie loginCookie = null;
		Cookie[] cookies = request.getCookies();
		if(cookies != null){
			for(Cookie cookie : cookies){
				if(cookie.getName().equals("user")){
					loginCookie = cookie;
					break;
				}
			}
		} 
		if(loginCookie != null){
			loginCookie.setMaxAge(0);
			response.addCookie(loginCookie);
		}
		response.sendRedirect("index.jsp");
	}
}