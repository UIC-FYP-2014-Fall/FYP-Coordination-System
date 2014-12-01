package com.uic.service.inter;

import java.util.List;

import com.uic.domain.Teacher;
import com.uic.domain.Timeslot;

public interface TimetableServiceInter extends BaseInterface{
	public boolean checkIfTimetableExit(Teacher teacher);
	public boolean updateTimetable(Teacher teacher,String timeslot);
	public boolean cancelAvailableSlot(Teacher teacher,String timeslot);
	public List<String> getTimtableOfOneTeacher(Teacher teacher);
}
