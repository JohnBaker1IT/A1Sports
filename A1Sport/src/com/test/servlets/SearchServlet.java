package com.test.servlets;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.SQLException;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Store;

import com.test.beans.Product;
import com.test.dao.ApplicationDao;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/search")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @throws IOException 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/** DocPoint 10. After the Dao is created call it*/
		System.out.println("in search servlet");
		ApplicationDao searchDao = new ApplicationDao();
		
		/** DocPoint 3.Get the search string and pass it to the DAO class*/
		
		String searchString = request.getParameter("search");
		List<Product> products = new ArrayList<>();
		
		try {
			/** DocPoint 11. Get the list of products*/
			products = searchDao.searchProducts(searchString);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("==== Search: product size=="+products.size());
		HttpSession session = request.getSession();
		session.setAttribute("searchCriteria", searchString);
		/* DocPoint 39. Store the searchString in the session to be retrieved later.
		 * Used to call the dao again to get the search results */
		
		/* DocPoint 31. (jsp) Java Server Pages. Jsp use html and java code to
		 * make webpages dynamic. 
		 * 
		 *4 scopes in a web application:
		 * 1. request scope
		 *    Represented by the HTTPServletRequest or the ServletRequest object.
		 *    This scope is going to be alive until the response of this request goes back to the client. 
		 *    So you can store information in this request scope in the form of an attribute, and the information
		 *    of the attribute is again a key and a value pair.
		 * 2. session scope
		 * 	  represented by the HTTPSession object. 
		 *    This scope is going to be alive til the user either closes the browser, or 
		 *    clicks on the logout button, or the session times out 
		 *    (nside the session you can have multiple requests spanned. 
		 * 3. Context scope or application scope
		 *    represented by the ServletContext object
		 *    It is used to shore information across all the servlets. 
		 *    Moreover, it can also help you to share information in the form of attributes 
		 *    and pass it to any other component of your web application. 
		 * 4. Page scope
		 *    represented by the JSPContext object.  It is accessible from any JSP page 
		 *    that creates that object.  
		 * 
		 * Here we take the products object obtained from the dao layer, and store it in the
		 * request scope as an attribute. Scopes are store in atributes and
		 * allow the componets of a webApp to talk to each other.
		 * Next, forward the control to the search
		 * results jsp search.jsp. The search.jsp will fetch the products data and
		 * generate the dynamic data on the product page.  This dynamic approach
		 * follows MVP architecture, and is better than changing html data using String
		 * builder. */		
		request.setAttribute("products", products);
		request.getRequestDispatcher("/html/search.jsp").forward(request, response);
		

	}


	/** DocPoint 12. Modify the html file to display the products from
	 * the result set by amending it like a giant string*/
	private String getHTMLString(String filePath, List<Product> products) throws IOException {
		BufferedReader template = new BufferedReader(new FileReader(filePath));
		String line="";
		StringBuilder builder = new StringBuilder();
		while((line=template.readLine())!=null){
			builder.append(line);
		}
		String page = builder.toString();
		page = MessageFormat.format(page, 
				products.get(0).getProductImgPath(),
				products.get(1).getProductImgPath(),
				products.get(2).getProductImgPath(),
				products.get(0).getProductName(),
				products.get(1).getProductName(),
				products.get(2).getProductName(),0);
		return page;
	}


}
