package com.test.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.basic.BasicToolBarUI.DockingListener;

import com.sun.tools.classfile.Opcode.Set;
import com.test.dao.ApplicationDao;

import sun.security.action.GetBooleanAction;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("==================Login do get");
		List<String> userTypes = new ArrayList<>();
		userTypes.add("Admin");
		userTypes.add("Gym Instructor");
		userTypes.add("Member");
		req.setAttribute("userTypes", userTypes);
		/* DocPoint 26. Login link from the home page will now take you to a login servlet
		 * for forwarding and keep the login.jsp from showing in the url.
		 * To do the forward RequestDispatch will dispatch the request to
		 * another resource of the application.  This method is used in
		 * struts framework*/
		
		//You can use dispatcher include to anotate a little html "Please login" to the page.
		String html = "<html><h3>Please login</h3></html>"; 
		resp.getWriter().write(html+" ");
			RequestDispatcher dispatcher = req.getRequestDispatcher("/html/login.jsp"); 
			dispatcher.include(req, resp);
		
		//or you can use dispatcher forward	
		//req.getRequestDispatcher("/html/login.jsp").forward(req, resp);
		
		

		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		System.out.println("assign privileges to the user for a successful login");
		/* DocPoint 41. Get the username from the login form.
		 * Set is an attribute in the Http session
		 * */
		
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		/* DocPoint 44. When the session is called for the
		 * first time a new session object is created.
		 * When the session is call subsequently it is the
		 * same object.*/
		req.getSession().setAttribute("username", username);
		//Set up the key value pair in the session
		
		ApplicationDao dao = new ApplicationDao();
		boolean isValid = dao.validateUser(username, password);
		
		String errorMessage= null;
		if(!isValid){
			errorMessage = "Invalid Credentials, please login again!";
			req.setAttribute("error", errorMessage);
			req.getRequestDispatcher("/html/login.jsp").forward(req,resp);
		}
		else{
			//upon sucessful login go to the login page
			req.getRequestDispatcher("/html/home.jsp").forward(req, resp);
			/* DocPoint 47. If the user is not in the database
			 * send him back to the login page*/
		}
		
	}

}
