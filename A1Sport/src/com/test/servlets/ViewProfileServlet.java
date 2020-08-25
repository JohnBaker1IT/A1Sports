package com.test.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.Store;

import com.test.beans.User;
import com.test.dao.ApplicationDao;

import sun.awt.windows.ThemeReader;

/**
 * Servlet implementation class ViewProfileServlet
 */
@WebServlet("/viewProfile")
public class ViewProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ViewProfileServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("view profile");

		ApplicationDao dao = new ApplicationDao();
		
		System.out.println("====== profile servlet "+(request.getSession().getAttribute("username")));
		User user = dao.getProfileDetails((String) (request.getSession().getAttribute("username")));
		request.setAttribute("user", user);
		/* DocPoint 50. Store all the user profile information in request object */ 
		
		
		
		/* DocPoint 42. Once the session is created we get the username
		 * from the session and forward control to the profile jsp*/
		request.getRequestDispatcher("html/profile.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
