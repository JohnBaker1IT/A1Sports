package com.test.filters;

import java.io.IOException;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class AuthenticationFilter implements Filter {
	private ServletContext context;

	/* DocPoint 48.
	 * Features of Filters 
	 * • Filter classes are reserved for preprocessing and
	 * postprocessing of a request 
	 * • Can dynamically intercept request and response
	 * • Promote modularity, reusability, and maintainability 
	 * • Possess the power of abruptly terminating the request Execution
	 * 
	 * Request can go through serveral filter and the servlet to form a
	 * filter chain.
	 * Request - Filter 1 - Filter 2 - Filter n - Servlet
	 */

	
	
	
	
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain)
			throws IOException, ServletException {
		HttpServletRequest req = ((HttpServletRequest) request);
		if (req.getRequestURI().startsWith("/A1SportGit/orderHistory")
				|| req.getRequestURI().startsWith("/A1SportGit/viewProfile")) {
			HttpSession session = req.getSession();
			if (session.getAttribute("username") == null) {
				// redirect to login
				req.getRequestDispatcher("/html/login.jsp").forward(req, response);
			}
		}
		    //takes you to the next filter or servlet
		    // preprocessing side
			filterChain.doFilter(req, response);
			// post processing side
			/* DocPoint 49.  If the username is invalid we will restrict
			 * access to the orderHistory and viewProfile pages using
			 * filter chains */
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		System.out.println("init of filter");
		System.out.println(arg0.getInitParameter("abc"));

	}

}
