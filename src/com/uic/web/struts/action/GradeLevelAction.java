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

import com.uic.service.imp.GradeLevelServiceImp;
import com.uic.service.inter.GradeLevelServiceInter;
import com.uic.web.struts.form.GradeLevelForm;

/** 
 * MyEclipse Struts
 * Creation date: 05-16-2015
 * 
 * XDoclet definition:
 * @struts.action parameter="flag"
 */
public class GradeLevelAction extends DispatchAction {
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
	public ActionForward goGradeLevelUi(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		if (request.getSession().getAttribute("role").equals("coordinator")) {
			
			GradeLevelServiceInter gradeLevelService = new GradeLevelServiceImp();
			request.setAttribute("gradeLevelList", gradeLevelService.getGradeLevels());
			return mapping.findForward("goGradeLevelUi");
		} else {
			request.setAttribute("msg", "ERROR: Permission denied.");
			return mapping.findForward("goLogin");
		}
	}
	
	public ActionForward saveGradelevel(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		if (request.getSession().getAttribute("role").equals("coordinator")) {
			GradeLevelForm gradeLevelForm = new GradeLevelForm();
			String ids[] = request.getParameterValues("GradeLevel_id");
			String percents[] = request.getParameterValues("GradeLevel_percent");
			//System.out.println(ids.length);
			gradeLevelForm.setGradeLevel_id(ids);
			gradeLevelForm.setGradeLevel_percent(percents);
			GradeLevelServiceInter gradeLevelService = new GradeLevelServiceImp();
			//validate form
			if(validateForm(gradeLevelForm)){
				// update gradelevel
				//String[] ids = gradeLevelForm.getGradeLevel_id();
				//String[] percents = gradeLevelForm.getGradeLevel_percent();
				boolean flag = true;
				
				for(int i=0;i<ids.length;i++){
					try {
						gradeLevelService.updateGradeLevel(ids[i], percents[i]);
					} catch (Exception e) {
						// TODO: handle exception
						flag = false;
						break;
					}
				}
				
				if(flag){
					request.setAttribute("SaveGradeLevelOperation", "success");
				}else{
					request.setAttribute("SaveGradeLevelOperation", "error");
					request.setAttribute("ErrorInfo", "Failed: save the grade level data into database!");
				}
				
			}else{
				request.setAttribute("SaveGradeLevelOperation", "error");
				request.setAttribute("ErrorInfo", "Failed: Form Validation!");
			}
			return new ActionForward("/gradeLevel.do?flag=goGradeLevelUi");
		} else {
			request.setAttribute("msg", "ERROR: Permission denied.");
			return mapping.findForward("goLogin");
		}
	}
	
	private boolean validateForm(GradeLevelForm gradeLevelForm){
		// 1. validate null
		String[] ids = gradeLevelForm.getGradeLevel_id();
		String[] percent = gradeLevelForm.getGradeLevel_percent();
		//System.out.println(ids.length);
		
		if(ids.length==percent.length){
			for(int i=0;i<ids.length;i++){
				if(ids[i].trim().equals("")||Integer.parseInt(percent[i])<0||Integer.parseInt(percent[i])>100){
					return false;
				}
			}
			return true;
		}
		return false;
	}
	
	
}