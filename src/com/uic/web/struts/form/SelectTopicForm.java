/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.uic.web.struts.form;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/** 
 * MyEclipse Struts
 * Creation date: 12-15-2014
 * 
 * XDoclet definition:
 * @struts.form name="selectTopicForm"
 */
public class SelectTopicForm extends ActionForm {
	/*
	 * Generated fields
	 */

	/** teamMenber property */
	private String topicId;
	public String getTopicId() {
		return topicId;
	}

	public void setTopicId(String topicId) {
		this.topicId = topicId;
	}

	private String[] member;

	/*
	 * Generated Methods
	 */

	/** 
	 * Method validate
	 * @param mapping
	 * @param request
	 * @return ActionErrors
	 */
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	/** 
	 * Method reset
	 * @param mapping
	 * @param request
	 */
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		// TODO Auto-generated method stub
	}

	/** 
	 * Returns the teamMenber.
	 * @return String
	 */
	public String[] getMember() {
		return member;
	}

	/** 
	 * Set the teamMenber.
	 * @param teamMenber The teamMenber to set
	 */
	public void setMember(String[] member) {
		this.member = member;
	}
}