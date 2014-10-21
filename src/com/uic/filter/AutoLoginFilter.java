package com.uic.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uic.domain.Coordinator;
import com.uic.domain.Student;
import com.uic.domain.Teacher;
import com.uic.domain.Users;
import com.uic.service.imp.UsersServiceImp;
import com.uic.service.inter.UsersServiceInter;
import com.uic.util.SecurityUtil;


public class AutoLoginFilter extends HttpServlet implements Filter {

	/**
	 * AutoLoginFilter will check session and cookie to implement auto login
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest request=(HttpServletRequest) arg0;
		HttpServletResponse response=(HttpServletResponse) arg1;
		//Check session whether userinfo is existent
		Object obj=request.getSession().getAttribute("userinfo");
		if(obj!=null){
            request.getRequestDispatcher("goUI.do").forward(request, response);
            return;    
        }
		//check cookie
		Cookie autoCookie=null;
		Cookie cookies[]=request.getCookies();
		if(cookies!=null){
			//traversal cookie
			 for (Cookie cookie : cookies) {
				 //check whether autologin tag is existent
				 if("autologin".equals(cookie.getName())){
					 autoCookie=cookie;
				 }
			 }
			 if(autoCookie == null){
				 arg2.doFilter(request, response);
				 return;
			 }
			 
			 //System.out.println("+++++++++++"+autoCookie);
			 
			 //get cookie value
			 String value=autoCookie.getValue();
			 String temp[]=value.split(":");
			 //System.out.println("length::::::::;;"+temp.length);
			 //Check cookie length
	         if(temp.length!=4){
	        	 arg2.doFilter(request, response);
	             return;
	         }
	         String type=temp[0];
	         String username=temp[1];
	         String time=temp[2];
	         String service_md5Value=temp[3];
	         //System.out.println(Long.valueOf(time)+"-----Time------"+System.currentTimeMillis());
	         //Check cookie EXPIRY DATE
	         if(Long.valueOf(time)<=System.currentTimeMillis()){
	             arg2.doFilter(request, response);
	             return;
	         }
	         UsersServiceInter userServiceInter = new UsersServiceImp();
	         Object user = userServiceInter.checkUser(username, type);
	         Users tempUser = new Users();
	         
	         if(user==null){
	        	 arg2.doFilter(request, response);
	        	 return;
	         }
	         if(type.equals("student")){
	        	 Student stu = (Student)user;
	        	 tempUser.setType("student");
	        	 tempUser.setUsername(stu.getSid());
	        	 tempUser.setPassword(stu.getPassword());
	        	 request.getSession().setAttribute("studentinfo", stu);
	         }else if(type.equals("teacher")){
	        	 Teacher teacher = (Teacher)user;
	        	 tempUser.setType("teacher");
	        	 tempUser.setUsername(teacher.getAccount());
	        	 tempUser.setPassword(teacher.getPassword());
	        	 request.getSession().setAttribute("teacherinfo", teacher);
	         }else if(type.equals("coordinator")){
	        	 Coordinator coordinator = (Coordinator)user;
	        	 tempUser.setType("coordinator");
	        	 tempUser.setUsername(coordinator.getAccount());
	        	 tempUser.setPassword(coordinator.getPassword());
	        	 request.getSession().setAttribute("coordinatorinfo", coordinator);
	         }
	         String md5Temp=tempUser.getType()+":"+tempUser.getUsername()+":"+tempUser.getPassword()+":"+time;
	         if(!(SecurityUtil.MD5(md5Temp).equals(service_md5Value))){
	        	 arg2.doFilter(request, response);
	        	 return;
	         }
	         request.getSession().setAttribute("userinfo", user);
	         request.getSession().setAttribute("role", type);
	         request.getRequestDispatcher("goUI.do").forward(request, response);
	         
			 
		}else{
			arg2.doFilter(request, response);
			return;
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
