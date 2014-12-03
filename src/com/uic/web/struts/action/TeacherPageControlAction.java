/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.uic.web.struts.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
/** 
 * MyEclipse Struts
 * Creation date: 10-26-2014
 * 
 * XDoclet definition:
 * @struts.action parameter="flag" validate="true"
 * @struts.action-forward name="chooseObserver" path="/WEB-INF/logined/Teacher/chooseObserver.jsp"
 * @struts.action-forward name="changePwd" path="/WEB-INF/logined/Teacher/changePwd.jsp"
 * @struts.action-forward name="topicList" path="/WEB-INF/logined/Teacher/topicList.jsp"
 * @struts.action-forward name="mainPage" path="/WEB-INF/logined/Teacher/teacherMain.jsp"
 * @struts.action-forward name="timetable" path="/WEB-INF/logined/Teacher/timetable.jsp"
 * @struts.action-forward name="uploadTopic" path="/WEB-INF/logined/Teacher/uploadTopic.jsp"
 */
public class TeacherPageControlAction extends DispatchAction {
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
	public ActionForward mainPage(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("Using TeacherPageControlAction");
		if(request.getSession().getAttribute("role").equals("teacher")){
			return mapping.findForward("mainPage");
		}else{
			request.setAttribute("msg", "ERROR: Permission denied.");
			return mapping.findForward("goLogin");
		}
	}
}