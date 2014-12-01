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
import com.uic.domain.Teacher;
import com.uic.domain.Topic;
import com.uic.service.imp.FYPServiceImp;
import com.uic.service.imp.TeachersServiceImp;
import com.uic.web.struts.form.ObserverForm;

/** 
 * MyEclipse Struts
 * Creation date: 11-29-2014
 * 
 * XDoclet definition:
 * @struts.action path="/setObserver" name="observerForm" input="/WEB-INF/logined/Teacher/chooseObserver.jsp" parameter="flag" scope="request" validate="true"
 * @struts.action-forward name="obsSaved" path="/teacherPageControl.do?flag=chooseObserver"
 */
public class SetObserverAction extends Action {
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
		ObserverForm observerForm = (ObserverForm) form;// TODO Auto-generated method stub
		FYPServiceImp fypService= new FYPServiceImp();
		TeachersServiceImp teacherService= new TeachersServiceImp();
		
		String[] obsTopic=observerForm.getObsTopic();
		for(int i=0;i<obsTopic.length;i++){
			String[] temp=obsTopic[i].split(",");
			Topic topic = fypService.getUniqueTopic(temp[0]);
			Teacher observer= teacherService.getUniqueTeacherById(temp[1]);
			fypService.setObserver(observer, topic);
		}
		request.setAttribute("setObserverInfo", "observer changed successful!");
		return mapping.findForward("obsSaved");
	}
}