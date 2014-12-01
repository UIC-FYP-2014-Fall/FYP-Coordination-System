/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.uic.web.struts.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.registry.infomodel.Slot;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.uic.domain.Teacher;
import com.uic.domain.Timeslot;
import com.uic.service.imp.TimetableServiceImp;
import com.uic.web.struts.form.TimeslotForm;

/**
 * MyEclipse Struts Creation date: 11-30-2014
 * 
 * XDoclet definition:
 * 
 * @struts.action path="/timetable" name="timeslotForm" parameter="flag"
 *                scope="request" validate="true"
 */
public class TimetableAction extends DispatchAction {
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
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		TimeslotForm timeslotForm = (TimeslotForm) form;// TODO Auto-generated
														// method stub
		Teacher curTeacher = (Teacher) request.getSession().getAttribute(
				"teacherinfo");
		TimetableServiceImp timetableService = new TimetableServiceImp();
		String weeks = (String) request.getSession().getAttribute("numOfWeek");
		String[] timeslots = timeslotForm.getTimeslot();
		ArrayList<String> timeslotsArrayList = new ArrayList<String>();
		for (int i = 0; i < timeslots.length; i++) {
			timeslotsArrayList.add(timeslots[i]);
		}
		
		
		if (timetableService.checkIfTimetableExit(curTeacher)) {
			//table exit: update the current table
			for (int week = 1; week <= Integer.parseInt(weeks); week++) {
				for (int time = 1; time < 8; time++) {
					for (int day = 1; day <= 5; day++) {
						//only update the new select date
						String tempslot = week + "," + day + "," + time;
						if (timeslotsArrayList.contains(tempslot)) {
							boolean flag = timetableService.updateTimetable(curTeacher, tempslot);
							System.out.println("update available true "+tempslot);
						}else{
							boolean flag= timetableService.cancelAvailableSlot(curTeacher, tempslot);
							System.out.println("update available false "+tempslot);
						}
					}
				}
			}
		}else{
			//table not exit: intert a new table 
			for (int week = 1; week <= Integer.parseInt(weeks); week++) {
				for (int time = 1; time < 8; time++) {
					for (int day = 1; day <= 5; day++) {
						// 如果和返回结果匹配，就收入数据库，availabel=true
						// else availabel =false
						String tempslot = week + "," + day + "," + time;
						if (timeslotsArrayList.contains(tempslot)) {
							Timeslot timeslot = new Timeslot();
							timeslot.setWeek(String.valueOf(week));
							timeslot.setDay(String.valueOf(day));
							timeslot.setTime(String.valueOf(time));
							timeslot.setSelected(false);
							timeslot.setAvailable(true);
							timeslot.setTeacher(curTeacher);
							boolean flag = timetableService.saveObject(timeslot);
						} else {
							Timeslot timeslot = new Timeslot();
							timeslot.setWeek(String.valueOf(week));
							timeslot.setDay(String.valueOf(day));
							timeslot.setTime(String.valueOf(time));
							timeslot.setSelected(false);
							timeslot.setAvailable(false);
							timeslot.setTeacher(curTeacher);
							boolean flag =timetableService.saveObject(timeslot);
						}
					}
				}
			}
		}
		return mapping.findForward("goTeacherPageControl_timetable");
	}
}