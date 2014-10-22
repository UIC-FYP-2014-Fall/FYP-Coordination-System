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
import javax.servlet.http.HttpServletResponseWrapper;

public class SessionFilter extends HttpServlet implements Filter {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public FilterConfig config;
	
	public static boolean isContains(String container, String[] regx) {
        boolean result = false;

        for (int i = 0; i < regx.length; i++) {
            if (container.indexOf(regx[i]) != -1) {
                return true;
            }
        }
        return result;
    }

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest hrequest = (HttpServletRequest)request;
        HttpServletResponseWrapper wrapper = new HttpServletResponseWrapper((HttpServletResponse) response);
        
        String logonStrings = config.getInitParameter("logonStrings");        // login page
        String includeStrings = config.getInitParameter("includeStrings");    // Filter Resources suffix parameter
        String redirectPath = hrequest.getContextPath() + config.getInitParameter("redirectPath");// redirect path
        String disabletestfilter = config.getInitParameter("disabletestfilter");// The filter is active.
        //String currentURL = hrequest.getRequestURI();
        
        //Obtain the absolute path to the root directory.
      	//String currentURL = hrequest.getRequestURI();
      	//Cut out the current file name
      	//String targetURL = currentURL.substring(currentURL.indexOf("/", 1), currentURL.length());
        
        //System.out.println("URL: "+currentURL);
        
        // Filter invalid
        if (disabletestfilter.toUpperCase().equals("Y")) {    
            chain.doFilter(request, response);
            return;
        }
        String[] logonList = logonStrings.split(";");
        String[] includeList = includeStrings.split(";");
        // Only to specify the filter parameters to filter suffix
        if (!isContains(hrequest.getRequestURI(), includeList)) {
            chain.doFilter(request, response);
            return;
        }
        //login page without filtering
        if (isContains(hrequest.getRequestURI(), logonList)) {
            chain.doFilter(request, response);
            return;
        }       
        //Determine whether the user login
        String user = ( String ) hrequest.getSession().getAttribute("role");
        if (user == null) {
        	hrequest.setAttribute("msg", "Illegal access to the viewer. Please use a valid URL!");
            wrapper.sendRedirect(redirectPath);
            return;
        }else {
            chain.doFilter(request, response);
            return;
        }
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		config = filterConfig;
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		this.config = null;
	}


}
