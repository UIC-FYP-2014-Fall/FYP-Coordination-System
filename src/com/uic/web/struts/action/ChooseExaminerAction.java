/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.uic.web.struts.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.uic.domain.Student;
import com.uic.domain.Stuexaminer;
import com.uic.domain.Teacher;
import com.uic.domain.TeacherState;
import com.uic.domain.Time;
import com.uic.service.imp.StudentServiceImp;
import com.uic.service.imp.TeachersServiceImp;
import com.uic.service.inter.StudentServiceInter;
import com.uic.service.inter.TeacherStateType;
import com.uic.service.inter.TeachersServiceInter;
import com.uic.service.inter.TimeType;
import com.uic.util.TimeChecker;

/**
 * MyEclipse Struts Creation date: 12-03-2014
 * 
 * XDoclet definition:
 * 
 * @struts.action parameter="flag"
 */
public class ChooseExaminerAction extends DispatchAction {
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
	public ActionForward goChooseExaminer(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		if (request.getSession().getAttribute("role").equals("student")) {
			
			// get the student information
			Student stu = (Student) request.getSession().getAttribute("studentinfo");
			StudentServiceInter studentSericeInter = new StudentServiceImp();

			// check whether student can choose examiner

			// student has chosen a examiner
			if (studentSericeInter.checkExaminerState(stu.getSid())) {

				Teacher examiner = studentSericeInter.getExaminer(stu.getSid());
				// student has chosen examiner
				request.setAttribute("chooseExaminer", "true");
				// System.out.println(TimeChecker.timeCheck().getType());

				// display the examiner who has been chosen by the student
				if (TimeChecker.timeCheck().getType().equals(TimeType.choose_examiner)) {
					// student can change examiner
					request.setAttribute("chooseExaminerTime", "true");

					// ready data for the student reselect a examiner
					Integer isExaminer = examiner.getId();
					//System.out.println(isExaminer);
					
					// get the student supervisors
					List<Teacher> supervisor = studentSericeInter.getSupervisor(stu.getSid());
					HashMap<Integer, Teacher> hm = new HashMap<>();

					for (int i = 0; i < supervisor.size(); i++) {
						hm.put(supervisor.get(i).getId(), supervisor.get(i));
					}
					
					// get the student observer
					Teacher observer = studentSericeInter.getObserver(stu
							.getSid());
					Integer observerId = observer.getId();

					// rewrap the teacher list which will add state
					List<TeacherState> teacherStateList = new ArrayList<TeacherState>();

					TeachersServiceInter teachersServiceInter = new TeachersServiceImp();
					List<Teacher> listTeacher = teachersServiceInter.getTeachers();
					// loop the teacher list to add the new list,
					// teacherStateList.
					for (Teacher t : listTeacher) {

						TeacherState ts = new TeacherState();
						ts.setTid(t.getId());
						ts.setName(t.getName());
						ts.setEmail(t.getEmail());

						if (hm.containsKey(t.getId())) {
							continue;
						} else if (t.getId().equals(observerId)) {
							continue;
						} else if (t.getId().equals(isExaminer)) {
							ts.setState(TeacherStateType.selected);
							teacherStateList.add(ts);
							continue;
						} else {
							if (teachersServiceInter.getWorkload(t.getId().toString()) < Integer.parseInt(t.getWorkload())) {
								ts.setState(TeacherStateType.can_select);
							} else {
								ts.setState(TeacherStateType.full);
							}
							teacherStateList.add(ts);
						}

					}
					request.setAttribute("teacherList", teacherStateList);

				} else {
					// student only view examiner
					request.setAttribute("chooseExaminerTime", "false");
					// System.out.println("chooseExaminerTime----false");
				}

				request.setAttribute("StudentExaminer", examiner.getName());
			} else {
				// student has not choose a examiner yet
				request.setAttribute("chooseExaminer", "false");
				// check now time whether should choose examiner
				if (TimeChecker.timeCheck().getType().equals(TimeType.choose_examiner)) {

					request.setAttribute("chooseExaminerTime", "true");

					// get student supervisor
					List<Teacher> supervisor = studentSericeInter
							.getSupervisor(stu.getSid());
					// ArrayList<Integer> supervisorId = new ArrayList<>();

					HashMap<Integer, Teacher> hm = new HashMap<>();

					for (int i = 0; i < supervisor.size(); i++) {
						hm.put(supervisor.get(i).getId(), supervisor.get(i));
					}

					Teacher observer = studentSericeInter.getObserver(stu.getSid());
					Integer observerId = observer.getId();

					// rewrap the teacher list which will add state
					List<TeacherState> teacherStateList = new ArrayList<TeacherState>();

					TeachersServiceInter teachersServiceInter = new TeachersServiceImp();
					List<Teacher> listTeacher = teachersServiceInter
							.getTeachers();
					// loop the teacher list to add the new list,
					// teacherStateList.
					for (Teacher t : listTeacher) {

						TeacherState ts = new TeacherState();

						if (hm.containsKey(t.getId())) {
							continue;
						} else if (t.getId().equals(observerId)) {
							continue;
						} else {
							ts.setTid(t.getId());
							ts.setName(t.getName());
							ts.setEmail(t.getEmail());
							if (teachersServiceInter.getWorkload(t.getId().toString()) < Integer.parseInt(t.getWorkload())) {
								ts.setState(TeacherStateType.can_select);
							} else {
								ts.setState(TeacherStateType.full);
							}
							teacherStateList.add(ts);
						}

					}
					request.setAttribute("teacherList", teacherStateList);

				} else {
					request.setAttribute("chooseExaminerTime", "false");
				}
			}

			// System.out.println(TimeChecker.timeCheck().getType());

			return mapping.findForward("goChooseExaminerUi");
		} else {
			request.setAttribute("msg", "ERROR: Permission denied.");
			return mapping.findForward("goLogin");
		}
	}

	public ActionForward chooseExaminer(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		if (request.getSession().getAttribute("role").equals("student")) {

			String examinerId = request.getParameter("tid");
			//System.out.println(examinerId);

			Time time = new Time();
			// check now time located situation
			time = TimeChecker.timeCheck();

			if (examinerId.trim() != null && time.getType().equals(TimeType.choose_examiner)) {

				StudentServiceInter studentSericeInter = new StudentServiceImp();
				TeachersServiceInter teacherServiceInter = new TeachersServiceImp();
				
				Student stu = (Student) request.getSession().getAttribute("studentinfo");
				
				// the student has chosen a examiner
				// update the student's examiner
				if (studentSericeInter.checkExaminerState(stu.getSid())) {
					//update
					if(studentSericeInter.updateExaminer(stu.getId().toString(), examinerId)){
						//System.out.println("true");
						request.setAttribute("studentOperation", "success");
					}else{
						request.setAttribute("studentOperation", "error");
					}

				}else{
					Teacher examiner = teacherServiceInter.getUniqueTeacherById(examinerId);

					Stuexaminer stuExaminer = new Stuexaminer();
					stuExaminer.setStudent(stu);
					stuExaminer.setTeacher(examiner);
					// add the examiner for the student
					if (studentSericeInter.saveObject(stuExaminer)) {
						request.setAttribute("studentOperation", "success");
					} else {
						request.setAttribute("studentOperation", "error");
					}
				}

			} else {
				request.setAttribute("studentOperation", "error");
				request.setAttribute("ErrorInfo", "Illegal operation!");
			}
			
			//return mapping.findForward("goChooseExaminerUi");
			return new ActionForward("/chooseExaminer.do?flag=goChooseExaminer");
		} else {
			request.setAttribute("msg", "ERROR: Permission denied.");
			return mapping.findForward("goLogin");
		}
	}
}