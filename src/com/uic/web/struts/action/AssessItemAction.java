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

import com.uic.domain.AssessItem;
import com.uic.service.imp.AssessItemServiceImp;
import com.uic.service.inter.AssessItemServiceInter;
import com.uic.web.struts.form.AssessItemForm;

/**
 * MyEclipse Struts Creation date: 05-11-2015
 * 
 * XDoclet definition:
 * 
 * @struts.action path="/assessItem" name="assessItemForm" parameter="flag"
 *                scope="request"
 */
public class AssessItemAction extends DispatchAction {
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
	public ActionForward goAssessItemUi(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		if (request.getSession().getAttribute("role").equals("coordinator")) {
			AssessItemServiceInter assessItemService = new AssessItemServiceImp();
			request.setAttribute("assessItemList", assessItemService.getAssessItems());
			if(assessItemService.totalPercent()<100){
				request.setAttribute("addAvailable", "true");
			}else{
				request.setAttribute("addAvailable", "false");
			}
			request.setAttribute("totalPercent", assessItemService.totalPercent());
			// check the system status return ${LockInfo}
			
			return mapping.findForward("goAssessItemUi");
		} else {
			request.setAttribute("msg", "ERROR: Permission denied.");
			return mapping.findForward("goLogin");
		}
	}

	/**
	 * add assess item
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward add(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		if (request.getSession().getAttribute("role").equals("coordinator")) {
			// get form data
			AssessItemForm assessItemForm = (AssessItemForm) form;
			AssessItemServiceInter assessItemService = new AssessItemServiceImp();
			// validate form data
			if(assessItemService.validateAssessItemForm(assessItemForm)&&assessItemService.totalPercent()<100){
				// package data
				AssessItem assessItem = new AssessItem();
				assessItem.setName(assessItemForm.getAssessName());
				assessItem.setPercent(assessItemForm.getPercentage());
				String[] teacherType = assessItemForm.getTeacherType();
				String supervisor="0";
				String observer="0";
				String examiner="0";
				
				for(int i=0;i<teacherType.length;i++){
					if(teacherType[i].equals("supervisor")){
						supervisor="1";
					}
					
					if(teacherType[i].equals("examiner")){
						examiner="1";
					}
					
					if(teacherType[i].equals("observer")){
						observer="1";
					}
				}
				
				assessItem.setSupervisor(supervisor);
				assessItem.setObserver(observer);
				assessItem.setExaminer(examiner);
				
				if (assessItemService.saveObject(assessItem)) {
					request.setAttribute("AssessItemOperation", "success");
				} else {
					request.setAttribute("AssessItemOperation", "error");
				}				
				
			}else{
				request.setAttribute("AssessItemOperation", "error");
				request.setAttribute("ErrorInfo", "Operation failed: add a new assessment item! Please check the assessment item form and try again.");
			}
			return new ActionForward("/assessItem.do?flag=goAssessItemUi");
		} else {
			request.setAttribute("msg", "ERROR: Permission denied.");
			return mapping.findForward("goLogin");
		}
	}
	
	public ActionForward delete(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		if (request.getSession().getAttribute("role").equals("coordinator")) {
			
			String aid = request.getParameter("aid");
			AssessItemServiceInter assessItemService = new AssessItemServiceImp();
			if(assessItemService.deleteAssessItem(aid)){
				request.setAttribute("AssessItemOperation", "success");
			}else{
				request.setAttribute("AssessItemOperation", "error");
			}
			return new ActionForward("/assessItem.do?flag=goAssessItemUi");
		} else {
			request.setAttribute("msg", "ERROR: Permission denied.");
			return mapping.findForward("goLogin");
		}
	}
	
	public ActionForward edit(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		if (request.getSession().getAttribute("role").equals("coordinator")) {
			
			AssessItemForm assessItemForm = (AssessItemForm) form;
			
			AssessItemServiceInter assessItemService = new AssessItemServiceImp();
			// validate form data
			if(assessItemService.validateUpdateAssessItemForm(assessItemForm)){
				if (assessItemService.updateAssessItem(assessItemForm)) {
					request.setAttribute("AssessItemOperation", "success");
				} else {
					request.setAttribute("AssessItemOperation", "error");
				}
			}else{
				request.setAttribute("AssessItemOperation", "error");
				request.setAttribute("ErrorInfo", "Operation failed: update the assessment item! Please check the assessment item form and try again.");
			}
			return new ActionForward("/assessItem.do?flag=goAssessItemUi");
		} else {
			request.setAttribute("msg", "ERROR: Permission denied.");
			return mapping.findForward("goLogin");
		}
	}
}