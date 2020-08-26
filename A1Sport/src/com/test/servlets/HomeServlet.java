package com.test.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Home 
 */
@WebServlet( urlPatterns = {"/home", ""})
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L; 
       
    /**  
     * @see HttpServlet#HttpServlet()  
     */
    public HomeServlet() {
        super();
    }

	/* DocPoint 0. MVC (Model View controller architecture) <br><br>	 
	  Model (Data Model Java Classes) (FBX 3d model)
	    Model defines the business layer of the application
		This is the data layer which contains business 
		logic of the system, and also represents the state of the application.
		It's independent of the presentation layer, the controller 
		fetches the data from the Model layer and sends it to the View layer.
		Responsible for getting and manipulating the data
		You could have three folder with you model classes, views classes,
		and controller
		classes.
		Data related logic
		Interactions with database (SELECT, INSERT, UPDATE,
		DELETE)
		Communicates with controller
 		Can sometimes update the view (Depends on framework)
 		
 		View (html,css,and jsp) (FBX render)
 			View defines the presentation layer of the application
			What the end user sees (UI)
			Usually consists of HTML/CSS
			Communicates with the controller
			Can be passed dynamic values from the controller
			Template Engines
		
		Controller (Servlets) (FBX controller)
			the Controller manages the flow of the application
			Controller layer acts as an interface between View and Model. 
			It receives requests from the View layer and processes them, 
			including the necessary validations.
			The requests are further sent to Model layer for data processing, 
			and once they are processed, the data is sent back to the 
			Controller and then displayed on the View.
			Receives input (from view, url)
			Processes requests (GET, POST, PUT, DELETE)
			Gets data from the model
			Passes data to the view
	View ---> Controller ---> Service ---> Data Access Layer


	 * 
	 * 
	 * 
	 * 
	 * */
	
    
    
    
    
    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.getRequestDispatcher("/html/index.html").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	/* DocPoint 30. The purpose of the HomeServlet is so that index.html is on not
	 * referenced and accessed in a static fashion. Rather we want to use object
	 * oriented concepts. */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
