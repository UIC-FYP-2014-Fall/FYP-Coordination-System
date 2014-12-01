package com.uic.service.imp;

import java.util.ArrayList;
import java.util.List;

import com.uic.domain.Teacher;
import com.uic.domain.Timeslot;
import com.uic.service.inter.TimetableServiceInter;

public class TimetableServiceImp  extends BaseServiceImp implements TimetableServiceInter {
	public boolean checkIfTimetableExit(Teacher teacher) {
		String teacherId=teacher.getId().toString();
		String hql="from Timeslot where teacher_id=?";
		String[] parameters={teacherId};
		System.out.println("ddd"+teacherId);
		List<Object> timeslotList=getListObject(hql,parameters);
		System.out.print("timeslotList "+timeslotList.size());
		if(timeslotList.size()!=0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean updateTimetable(Teacher teacher, String timeslot) {
		// TODO Auto-generated method stub
		String hql="update Timeslot set available=1 where week=? and day=? and time=? and teacher_id=?";
		String[] tempslot=timeslot.split(",");
		String[] parameters={tempslot[0],tempslot[1],tempslot[2],teacher.getId().toString()};
		boolean flag=updateObject(hql,parameters);
		return flag;
	}

	@Override
	public boolean cancelAvailableSlot(Teacher teacher, String timeslot) {
		// TODO Auto-generated method stub
		String hql="update Timeslot set available=0 where week=? and day=? and time=? and teacher_id=?";
		String[] tempslot=timeslot.split(",");
		String[] parameters={tempslot[0],tempslot[1],tempslot[2],teacher.getId().toString()};
		boolean flag=updateObject(hql,parameters);
		return flag;
	}

	@Override
	public ArrayList<String> getTimtableOfOneTeacher(Teacher teacher) {
		// TODO Auto-generated method stub
		String hql="from Timeslot where teacher_id=? and available=1";
		String[] parameters={teacher.getId().toString()};
		List<Timeslot> list= (List<Timeslot>)getListObject(hql,parameters);
		ArrayList<String> timeslotList=new ArrayList<String>();

		for(int i =0;i<list.size();i++){
			String temp;
			Timeslot timeslot=list.get(i);
			temp=timeslot.getWeek()+","+timeslot.getDay()+","+timeslot.getTime();
			timeslotList.add(temp);
		}
		return timeslotList;
	}
	
}
