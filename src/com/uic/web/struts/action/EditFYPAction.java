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

import com.uic.domain.TeaTopic;
import com.uic.domain.Teacher;
import com.uic.domain.Topic;
import com.uic.service.imp.FYPServiceImp;
import com.uic.service.imp.TeachersServiceImp;
import com.uic.web.struts.form.EditFYPForm;

import java.util.ArrayList;
import java.util.List;

/**
 * MyEclipse Struts Creation date: 11-25-2014
 * 
 * XDoclet definition:
 * 
 * @struts.action path="/editFYP" name="editFYPForm" parameter="flag"
 *                scope="request" validate="true"
 * @struts.action-forward name="editOk"
 *                        path="/WEB-INF/logined/Teacher/topicList.jsp"
 */
public class EditFYPAction extends DispatchAction {
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
	public ActionForward editFYP(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		EditFYPForm editFYPForm = (EditFYPForm) form;// TODO Auto-generated
														// method stub

		// fetch all data from the form
		String fid = editFYPForm.getFid();
		String title = editFYPForm.getTitle();
		String individual = editFYPForm.getIndividual();
		String credit = editFYPForm.getCredit();
		String numOfStu = editFYPForm.getNumOfStu();
		String description = editFYPForm.getDescription();
		String[] supervisor = editFYPForm.getSupervisor();

		// set up the data service.
		TeachersServiceImp teachersServiceImp = new TeachersServiceImp();
		FYPServiceImp fypServiceImp = new FYPServiceImp();

		Topic topic = fypServiceImp.getUniqueTopic(fid);

		// 1. check if supervior modified?
		ArrayList<Teacher> teacherList = new ArrayList<Teacher>();
		ArrayList<Teacher> teacherNeedToUpdate = new ArrayList<Teacher>();
		ArrayList<Teacher> teacherNeedToDelete = new ArrayList<Teacher>();
		ArrayList<Teacher> teacherAlreadyExit = new ArrayList<Teacher>();
		ArrayList<Integer> update=new ArrayList<Integer>();
		ArrayList<Integer> delete=new ArrayList<Integer>();
		
		// assign teacher object to the array list
		for (int i = 0; i < supervisor.length; i++) {
			Teacher t = teachersServiceImp.getUniqueTeacher(supervisor[i]);
			teacherList.add(t);
		}
		//get the teacher in the database.
		List<TeaTopic> teaTopic = fypServiceImp.getTeaTopicByTopicId(fid);
		
		// classify which teacher need to update or remove.

		for(int i =0;i<teacherList.size();i++){
			for(int j=0;j<teaTopic.size();j++){
				if(teacherList.get(i).getId()==teaTopic.get(j).getTeacher().getId()){
					teacherAlreadyExit.add(teacherList.get(i));
					System.out.println("Already exit add");
					delete.add(new Integer(j));//teaTopic.get(j).getTeacher().setName("remove");
					update.add(new Integer(i));//teacherList.get(i).setName("remove");
				}
			}
		}
		
		//System.out.println("update array:"+update.size());
		//System.out.println("delete array:"+delete.size());
		
		for(int index =0;index<teacherList.size();index++){
			if(update.contains(new Integer(index))){
				
			}else{
				System.out.println("need to update add");
				teacherNeedToUpdate.add(teacherList.get(index));
			}
		}
		
		for(int index =0;index<teaTopic.size();index++){
			if(delete.contains(new Integer(index))){
				
			}else{
				System.out.println("need to delete add");
				teacherNeedToDelete.add(teaTopic.get(index).getTeacher());
			}
		}
		//System.out.println("need update:"+teacherNeedToUpdate.size());
		//System.out.println("need delete:"+teacherNeedToDelete.size());
		//System.out.println("exit:"+teacherAlreadyExit.size());
		
		teacherList.clear();
		teaTopic.clear();
		
		
		//prepare the new topic object
		topic.setTitle(title);
		topic.setCredit(Integer.parseInt(credit));
		topic.setNumOfStudent(Integer.parseInt(numOfStu));
		if (individual.equals("individual")) {
			topic.setIndividual(true);
		} else {
			topic.setIndividual(false);
		}
		topic.setDescription(description);
		System.out.println(title + " " + credit + " " + numOfStu + " "
				+ individual + " " + description);
		//update the fyp topic
		if (fypServiceImp.updatetTopic(topic)) {
			System.out.println("update topic success");
		}
		//delete the relationship between teacher and topic
		if(teacherNeedToDelete.size()>0){
			for(int i =0;i<teacherNeedToDelete.size();i++){
				System.out.println("delete teatopic");
				fypServiceImp.deleteTeaTopic(fid, teacherNeedToDelete.get(i).getId().toString());
			}
		}
		
		//add the new relationship
		if(teacherNeedToUpdate.size()>0){
			System.out.println("update teatopic");
			fypServiceImp.updateEditTopic(teacherNeedToUpdate,topic);
		}
		request.setAttribute("operationInfo", "edit topic success");
		return mapping.findForward("editOk");
	}
}