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

import com.uic.domain.Teacher;
import com.uic.service.imp.TeachersServiceImp;
import com.uic.service.inter.TeachersServiceInter;
import com.uic.util.SystemUtil;
import com.uic.web.struts.form.TeacherForm;

/**
 * MyEclipse Struts Creation date: 10-19-2014
 * 
 * XDoclet definition:
 * 
 * @struts.action parameter="flag"
 */
public class GoManageAccountUiAction extends DispatchAction {
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
	public ActionForward goUi(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		if(request.getSession().getAttribute("role").equals("coordinator")){
			
			//load teacher data
			TeachersServiceInter teachersServiceInter =  new TeachersServiceImp();
			request.setAttribute("teacherList", teachersServiceInter.getTeachers());
			return mapping.findForward("goManageAccountUi");
		} else {
			request.setAttribute("msg", "ERROR: Permission denied.");
			return mapping.findForward("goLogin");
		}

	}

	public ActionForward add(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		if (request.getSession().getAttribute("role").equals("coordinator")) {

			TeacherForm teacherForm = (TeacherForm) form;

			// construct a teacher to receive info from jsp
			Teacher teacher = new Teacher();

			teacher.setAccount(teacherForm.getAccount());
			teacher.setName(teacherForm.getName());
			teacher.setEmail(teacherForm.getEmail());
			teacher.setPhone(teacherForm.getPhone());
			teacher.setPassword(SystemUtil.getDefaultTeacherPassword());

			// save the teacher
			TeachersServiceInter teachersServiceInter = new TeachersServiceImp();
			if (teachersServiceInter.saveObject(teacher)) {
				request.setAttribute("TeacherOperation", "success");
			} else {
				request.setAttribute("TeacherOperation", "error");
			}

			// TODO: handle exception

			return new ActionForward("/goManageAccountUi.do?flag=goUi");
		} else {
			request.setAttribute("msg", "ERROR: Permission denied.");
			return mapping.findForward("goLogin");
		}

	}
	public ActionForward delete(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		if (request.getSession().getAttribute("role").equals("coordinator")) {

			String tid = request.getParameter("tid");

			// delete the teacher
			TeachersServiceInter teachersServiceInter = new TeachersServiceImp();
			if (teachersServiceInter.deleteTeacher(tid)) {
				request.setAttribute("TeacherOperation", "success");
			} else {
				request.setAttribute("TeacherOperation", "error");
			}

			// TODO: handle exception

			return new ActionForward("/goManageAccountUi.do?flag=goUi");
		} else {
			request.setAttribute("msg", "ERROR: Permission denied.");
			return mapping.findForward("goLogin");
		}

	}
	public ActionForward reset(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		if (request.getSession().getAttribute("role").equals("coordinator")) {

			String tid = request.getParameter("tid");

			// reset the teacher password
			TeachersServiceInter teachersServiceInter = new TeachersServiceImp();
			if (teachersServiceInter.resetTeacher(tid)) {
				request.setAttribute("TeacherOperation", "success");
			} else {
				request.setAttribute("TeacherOperation", "error");
			}

			// TODO: handle exception

			return new ActionForward("/goManageAccountUi.do?flag=goUi");
		} else {
			request.setAttribute("msg", "ERROR: Permission denied.");
			return mapping.findForward("goLogin");
		}

	}
}
