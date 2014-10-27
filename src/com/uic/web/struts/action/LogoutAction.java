/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.uic.web.struts.action;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/** 
 * MyEclipse Struts
 * Creation date: 10-22-2014
 * 
 * XDoclet definition:
 * @struts.action
 */
public class LogoutAction extends Action {
	/*
	 * Generated Methods
	 */

	/** 
	 * Method execute
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("Using LogoutAction");
		//clear up cookie
				Cookie cookies[] = request.getCookies();
				for(int i=0;i<cookies.length;i++){
					if ("autologin".equals(cookies[i].getName())){
						cookies[i].setMaxAge(0);
						response.addCookie(cookies[i]);
						System.out.println("cookie clear!!!!!!!!!!!");
					}
				}
				//clear up session
				request.getSession().invalidate();
				return mapping.findForward("goLoginUi");
	}
}