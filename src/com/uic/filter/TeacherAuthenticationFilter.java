package com.uic.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class TeacherAuthenticationFilter extends HttpServlet implements
		Filter {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static String LOGIN_PAGE = "/login.jsp";

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		//get current URL
		//String currentUrl = req.getRequestURI();
		//get session
		HttpSession session = req.getSession();
		//If the session is empty, or the user is not logged in, redirect to the login page
		if(session == null||session.getAttribute("userinfo")==null||session.getAttribute("type")==null){
			res.sendRedirect(req.getContextPath() + LOGIN_PAGE);
			return;
		}
		//If the role is not teacher, the authentication fails, the user login again.
		if(!session.getAttribute("role").equals("teacher")){
			session.removeAttribute("userinfo");
			session.removeAttribute("role");
			res.sendRedirect(req.getContextPath() + LOGIN_PAGE);
			return;
		}
		//return message
		request.setAttribute("msg", "Illegal access to the viewer. Please use a valid URL!");
		//Filtration is complete, filter chain to continue downward.
		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
