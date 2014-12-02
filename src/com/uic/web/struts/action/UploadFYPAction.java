/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.uic.web.struts.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.uic.domain.ObsTopic;
import com.uic.domain.Teacher;
import com.uic.domain.Topic;
import com.uic.service.imp.FYPServiceImp;
import com.uic.service.imp.TeachersServiceImp;
import com.uic.web.struts.form.UploadFYPForm;

/**
 * MyEclipse Struts Creation date: 11-02-2014
 * 
 * XDoclet definition:
 * 
 * @struts.action path="/uploadFYP" name="uploadFYPForm" parameter="flag"
 *                scope="request" validate="true"
 */
public class UploadFYPAction extends DispatchAction {
	/*
	 * Generated Methods
	 */

	/**
	 * Method execute
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward uploadTopicUi(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("Using TeacherPageControlAction");
		if(request.getSession().getAttribute("role").equals("teacher")){
			TeachersServiceImp ts = new TeachersServiceImp();
			List<Teacher> teacherList = ts.getTeachers();
			request.setAttribute("teacherList", teacherList);
			return mapping.findForward("uploadTopicUi");
		}else{
			request.setAttribute("msg", "ERROR: Permission denied.");
			return mapping.findForward("goLogin");
		}
	}
	
	public ActionForward uploadFYP(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Using UploadFYPaction");
		UploadFYPForm uploadFYPForm = (UploadFYPForm) form;

		// set up the data service.
		TeachersServiceImp teachersServiceImp = new TeachersServiceImp();
		FYPServiceImp fypServiceImp = new FYPServiceImp();

		// declare the class
		String[] supervisor = uploadFYPForm.getSupervisor();
		Topic topic = new Topic();
		ArrayList<Teacher> teacherlist = new ArrayList<Teacher>();
		for (int i = 0; i < supervisor.length; i++) {
			Teacher t = teachersServiceImp.getUniqueTeacherByName(supervisor[i]);
			teacherlist.add(t);
		}

		// fetch the data from the form to the topic object
		topic.setTitle(uploadFYPForm.getTitle());
		topic.setCredit(Integer.parseInt(uploadFYPForm.getCredit()));

		topic.setDescription(uploadFYPForm.getDescription());
		if ("individual".equals(uploadFYPForm.getIndividual())) {
			topic.setIndividual(true);
			topic.setNumOfStudent(Integer.parseInt("1"));
		} else {
			topic.setIndividual(false);
			topic.setNumOfStudent(Integer.parseInt(uploadFYPForm.getNumOfStu()));
		}
		// save to database
		boolean success = fypServiceImp.uploadTopic(teacherlist, topic);
		
		if (success) {
			request.setAttribute("operationInfo", "upload topic success");
		} else {
			request.setAttribute("operationInfo", "fail");
		}
		//set a default observer
		ObsTopic obsTopic=new ObsTopic();
		obsTopic.setObserver(teacherlist.get(0));
		obsTopic.setTopic(topic);
		fypServiceImp.saveObject(obsTopic);
		return mapping.findForward("uploadok");
	}
}