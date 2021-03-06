/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.uic.web.struts.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/** 
 * MyEclipse Struts
 * Creation date: 10-24-2014
 * 
 * XDoclet definition:
 * @struts.action validate="true"
 * @struts.action-forward name="goTopicListUi" path="/WEB-INF/logined/Teacher/topicList.jsp"
 */
public class GoTopicListUiAction extends Action {
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
		System.out.println("Using GoTopicListUiAction");
		if(request.getSession().getAttribute("role").equals("teacher")){
			return mapping.findForward("goTopicListUi");
		}else{
			request.setAttribute("msg", "ERROR: Permission denied.");
			return mapping.findForward("goLogin");
		}
	}
}