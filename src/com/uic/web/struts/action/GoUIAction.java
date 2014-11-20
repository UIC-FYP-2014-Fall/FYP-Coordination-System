/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.uic.web.struts.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.uic.domain.Message;
import com.uic.domain.Users;
import com.uic.service.imp.MessagesServiceImp;
import com.uic.service.inter.MessagesServiceInter;
import com.uic.util.PropertiesHelper;

/** 
 * MyEclipse Struts
 * Creation date: 10-19-2014
 * 
 * XDoclet definition:
 * @struts.action parameter="flag"
 */
public class GoUIAction extends DispatchAction {
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
		//System.out.println("Using GoUIAction");
		if(request.getSession().getAttribute("role").equals("coordinator")){
			//preTime data prepare
			//prepare data for the jsp page
			PropertiesHelper ph = new PropertiesHelper("/WEB-INF/config/FYP-system.properties");
			
			String state1 = ph.getProperties("UploadTopicsDateTimeState");
			String state2 = ph.getProperties("ChooseTopicDateTimeState");
			String state3 = ph.getProperties("ChooseExaminersDateTimeState");
			String state4 = ph.getProperties("PreDateTimeState");
			
			if(state1!=null){
				if(state1.equals("true")){
					request.setAttribute("UploadTopicsDateTimeState", "true");
					request.setAttribute("UTstartDateTime", ph.getProperties("UploadTopicsStartDateTime"));
					request.setAttribute("UTendDateTime", ph.getProperties("UploadTopicsEndDateTime"));
				}else{
					request.setAttribute("UploadTopicsDateTimeState", "false");
				}
			}
			if(state2!=null){
				if(state2.equals("true")){
					request.setAttribute("ChooseTopicDateTimeState", "true");
					request.setAttribute("CTstartDateTime", ph.getProperties("ChooseTopicStartDateTime"));
					request.setAttribute("CTendDateTime", ph.getProperties("ChooseTopicEndDateTime"));
				}else{
					request.setAttribute("ChooseTopicDateTimeState", "false");
				}
			}
			if(state3!=null){
				if(state3.equals("true")){
					request.setAttribute("ChooseExaminersDateTimeState", "true");
					request.setAttribute("CEstartDateTime", ph.getProperties("ChooseExaminersStartDateTime"));
					request.setAttribute("CEendDateTime", ph.getProperties("ChooseExaminersEndDateTime"));
				}else{
					request.setAttribute("ChooseExaminersDateTime", "false");
				}
			}
			if(state4!=null){
				if(state4.equals("true")){
					request.setAttribute("PreDateTimeState", "true");
					request.setAttribute("PstartDateTime", ph.getProperties("PreStartDateTime"));
					request.setAttribute("PendDateTime", ph.getProperties("PreEndDateTime"));
				}else{
					request.setAttribute("PreDateTimeState", "false");
				}
			}
			
			
			
			
			//pagination
			int pageNow=1;
			//get pageNow from the main.jsp
			String s_pageNow=request.getParameter("pageNow");
			//check pageNow from the main.jsp
			if(s_pageNow!=null){
				pageNow=Integer.parseInt(s_pageNow);
			}
			
			
			//load the messages from database
			MessagesServiceInter messagesServiceInter = new MessagesServiceImp();
			Users user = (Users)request.getSession().getAttribute("userinfo");
			List<Message> list = messagesServiceInter.getMessages(user,pageNow,4);
			int pageCount = messagesServiceInter.getPageCount(user, 4);
			
			request.setAttribute("messageList", list);
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("pageNow", pageNow);
			return mapping.findForward("goMainUi");
			
			
		}else if(request.getSession().getAttribute("role").equals("teacher")){
			return mapping.findForward("goTeacherMain");
		}else{
			request.setAttribute("msg", "ERROR: Permission denied.");
			return mapping.findForward("goLogin");
		}
		
	}
}