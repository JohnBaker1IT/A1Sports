package com.test.servlets;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.SQLException;
import java.text.MessageFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.beans.User;
import com.test.dao.ApplicationDao;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	
	
	/** DocPoint 25. implement the doGet for the registration information
	 * for the link to get us to the registration page */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String page = getHTMLString(request.getServletContext().getRealPath("/html/register.html"), "");
		response.getWriter().write(page);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("in post of register");
		
		

		// take all the form data
        /** DocPoint 14. Get the information from the registration html form */       
		
		String username = request.getParameter("username");
		String password =request.getParameter("password"); 
		String firstName = request.getParameter("fname");
		String lastName = request.getParameter("lname");
		int age = Integer.parseInt(request.getParameter("age"));
		String activity = request.getParameter("activity");
		/** DocPoint 15. pack the user bean using a parameterized
		 * constructor and pass the user information to the dao */ 
		
		User user = new User(username,password, firstName, lastName, age, activity);
		ApplicationDao applicationDao = new ApplicationDao();
		String registerMessage = null;
		int userSaved = 0;
		
		
		try {
			/** DocPoint 20. pass the user bean to the doa to register
			 * the user and write the lines into the database.  userSaved is determined from rows affected. */
			userSaved = applicationDao.registerUser(user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (userSaved == 1) {
			registerMessage = "User registered successfully!";

		} else {
			registerMessage = "Sorry! Some error occurred!";
		}

		//response.getWriter().write(registerMessage);
		
		/** DocPoint 23. use the servlet to pass the updated webpage back to the client
		 * using the relative path /html/register.html  */	
		String page = getHTMLString(request.getServletContext().getRealPath("/html/register.html"), registerMessage);
		response.getWriter().write(page);

	}

	/** DocPoint 21. write the user information into the html file */
	public String getHTMLString(String filePath, String message) throws IOException{
		BufferedReader reader = new BufferedReader(new FileReader(filePath));
		String line="";
		StringBuffer buffer = new StringBuffer();
		while((line=reader.readLine())!=null){
			buffer.append(line);
		}
		reader.close();
		String page = buffer.toString();
		/** DocPoint 22. Use MessageFormat to insert the data at the desired point
		 * on the webpage */
		page = MessageFormat.format(page, message);
		return page;
	}
}
