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

public class LoginFilter extends HttpServlet implements Filter {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		//Obtain the absolute path to the root directory.
		String currentURL = req.getRequestURI();
		//Cut out the current file name
		String targetURL = currentURL.substring(currentURL.indexOf("/", 1), currentURL.length());
		System.out.println("targetURL: "+targetURL);
		//get session
		HttpSession session = req.getSession(false);
		//check session
		if(!"/login.do".equals(targetURL)){
			if(session==null||session.getAttribute("userinfo")==null){
				//return message
				req.setAttribute("msg", "Illegal access to the viewer. Please use a valid URL!");
				res.sendRedirect(req.getContextPath());
				return;
			}
		}
		
		//Filtration is complete, filter chain to continue downward.
		chain.doFilter(request, response);
		
	
	}

	@Override
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}
}
