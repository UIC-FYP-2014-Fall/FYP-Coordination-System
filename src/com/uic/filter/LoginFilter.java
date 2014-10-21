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
		//get session
		HttpSession session = req.getSession();
		//get current URL
		String url=req.getServletPath();
		String contextPath=req.getContextPath();
		if(url.equals("")) url+="/";
		System.out.println("URL: "+url);
		if((url.startsWith("/")&&!url.startsWith("/login"))){
			String role=(String)session.getAttribute("role");
			if(role==null){
				//return message
				request.setAttribute("msg", "Illegal access to the viewer. Please use a valid URL!");
				res.sendRedirect(contextPath+"/index.jsp");
				return;
			}
		}
		
		//Filtration is complete, filter chain to continue downward.
		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
