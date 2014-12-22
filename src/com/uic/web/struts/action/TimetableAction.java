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
import com.uic.domain.Teacher;
import com.uic.domain.Timeslot;
import com.uic.service.imp.TimetableServiceImp;
import com.uic.util.BaseUtil;
import com.uic.util.PropertiesHelper;
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
	public ActionForward timetableUi(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		if (request.getSession().getAttribute("role").equals("teacher")) {
			PropertiesHelper ph = new PropertiesHelper(
					"/WEB-INF/config/FYP-system.properties");
			String selectPreTimeStart = ph.getProperties("ChooseExaminersEndDateTime");
			String selectPreTimeEnd = ph.getProperties("ChoosePresentationStartDateTime");
			String timetablePeriod = selectPreTimeStart+" to "+selectPreTimeEnd;
			if (selectPreTimeStart != null && selectPreTimeEnd != null) {
				if(BaseUtil.todayIsInPeriod(selectPreTimeStart, selectPreTimeEnd)){
					String preStart = ph.getProperties("PreStartDateTime");
					String preEnd = ph.getProperties("PreEndDateTime");
					String numOfWeek = BaseUtil.getNumOfWeekBetweenTwoDate(preStart,preEnd);
					String beginWeekDay = BaseUtil.getDayOfWeek(preStart);
					String endWeekDay = BaseUtil.getDayOfWeek(preEnd);
					ArrayList<String> timeTableTime = BaseUtil.getEveryWeekStartAndEndDay(preStart, preEnd);
					TimetableServiceImp timetableService = new TimetableServiceImp();
					Teacher teacher = (Teacher) request.getSession().getAttribute(
							"teacherinfo");
					List<String> timeslots = timetableService
							.getTimtableOfOneTeacher(teacher);
					for(int i =0;i<timeTableTime.size();i++){
						System.out.println(timeTableTime.get(i));
					}
					request.setAttribute("timeTableTime", timeTableTime);
					request.setAttribute("timetablePeriod", timetablePeriod);
					request.setAttribute("timetableStart", "true");
					request.setAttribute("numOfWeek", numOfWeek);
					request.setAttribute("timeslots", timeslots);
					request.setAttribute("beginWeekDay", beginWeekDay);
					request.setAttribute("endWeekDay", endWeekDay);
					return mapping.findForward("timetableUi");
				}else{
					request.setAttribute("timetablePeriod", timetablePeriod);
					request.setAttribute("timetableStart", "false");
					return mapping.findForward("timetableUi");
				}
			} else {
				request.setAttribute("timetablePeriod", timetablePeriod);
				request.setAttribute("timetableStart", "false");
				return mapping.findForward("timetableUi");
			}
		} else {
			request.setAttribute("msg", "ERROR: Permission denied.");
			return mapping.findForward("goLogin");
		}
	}

	public ActionForward updateTimetable(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
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
		boolean flag = false;
		if (timetableService.checkIfTimetableExit(curTeacher)) {
			// table exit: update the current table
			for (int week = 1; week <= Integer.parseInt(weeks); week++) {
				for (int time = 1; time < 8; time++) {
					for (int day = 1; day <= 5; day++) {
						// only update the new select date
						String tempslot = week + "," + day + "," + time;
						if (timeslotsArrayList.contains(tempslot)) {
							flag = timetableService.updateTimetable(
									curTeacher, tempslot);
						} else {
							flag = timetableService
									.cancelAvailableSlot(curTeacher, tempslot);
						}
					}
				}
			}
		} else {
			// table not exit: insert a new table
			for (int week = 1; week <= Integer.parseInt(weeks); week++) {
				for (int time = 1; time < 8; time++) {
					for (int day = 1; day <= 5; day++) {
						// availabel=true
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
							flag = timetableService
									.saveObject(timeslot);
						} else {
							Timeslot timeslot = new Timeslot();
							timeslot.setWeek(String.valueOf(week));
							timeslot.setDay(String.valueOf(day));
							timeslot.setTime(String.valueOf(time));
							timeslot.setSelected(false);
							timeslot.setAvailable(false);
							timeslot.setTeacher(curTeacher);
							flag = timetableService
									.saveObject(timeslot);
						}
					}
				}
			}
		}
		if(flag){
			request.setAttribute("ifUpdateTableSuccess", "true");
			request.setAttribute("updateTableInfo", "The new timetable is updated.");
		}else{
			request.setAttribute("ifUpdateTableSuccess", "false");
			request.setAttribute("updateTableInfo", "Update operation failed.");
		}
		return mapping.findForward("updateTimetable");
	}
}