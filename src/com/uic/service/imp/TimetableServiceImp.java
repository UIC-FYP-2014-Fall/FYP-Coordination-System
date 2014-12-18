package com.uic.service.imp;

import java.util.ArrayList;
import java.util.List;

import com.uic.domain.Student;
import com.uic.domain.Teacher;
import com.uic.domain.Timeslot;
import com.uic.service.inter.TimetableServiceInter;

public class TimetableServiceImp  extends BaseServiceImp implements TimetableServiceInter {
	public boolean checkIfTimetableExit(Teacher teacher) {
		String teacherId=teacher.getId().toString();
		String hql="from Timeslot where teacher_id=?";
		String[] parameters={teacherId};
		System.out.println("ddd"+teacherId);
		try{
			List<Object> timeslotList=getListObject(hql,parameters);
			System.out.print("timeslotList "+timeslotList.size());
			if(timeslotList.size()!=0){
				return true;
			}else{
				return false;
			}
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean updateTimetable(Teacher teacher, String timeslot) {
		// TODO Auto-generated method stub
		String hql="update Timeslot set available=1 where week=? and day=? and time=? and teacher_id=?";
		String[] tempslot=timeslot.split(",");
		String[] parameters={tempslot[0],tempslot[1],tempslot[2],teacher.getId().toString()};
		try{
			boolean flag=updateObject(hql,parameters);
			return flag;
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("Can not update the timetable in updateTimetable");
			return false;
		}
	}

	@Override
	public boolean cancelAvailableSlot(Teacher teacher, String timeslot) {
		// TODO Auto-generated method stub
		String hql="update Timeslot set available=0 where week=? and day=? and time=? and teacher_id=?";
		String[] tempslot=timeslot.split(",");
		String[] parameters={tempslot[0],tempslot[1],tempslot[2],teacher.getId().toString()};
		try{
			boolean flag=updateObject(hql,parameters);
			return flag;
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("Can not cancelAvailableSlot");
			return false;
		}
	}

	@Override
	public ArrayList<String> getTimtableOfOneTeacher(Teacher teacher) {
		// TODO Auto-generated method stub
		String hql="from Timeslot where teacher_id=? and available=1";
		String[] parameters={teacher.getId().toString()};
		try{
			List<Timeslot> list= (List<Timeslot>)getListObject(hql,parameters);
			ArrayList<String> timeslotList=new ArrayList<String>();
			for(int i =0;i<list.size();i++){
				String temp;
				Timeslot timeslot=list.get(i);
				temp=timeslot.getWeek()+","+timeslot.getDay()+","+timeslot.getTime();
				timeslotList.add(temp);
			}
			return timeslotList;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	
	public ArrayList<String> getTeacherAndObserverAvailableTime(ArrayList<Teacher> supervisor,Teacher observer){
		String hql="from Timeslot where teacher_id=? and available=1 and selected=0";
		String[] pareOfSup={supervisor.get(0).getId().toString()};
		String[] pareOfObs={observer.getId().toString()};
		try{
			List<Timeslot> obsTimeslot=(List<Timeslot>)getListObject(hql,pareOfObs);
			List<Timeslot> supTimeslot0=(List<Timeslot>)getListObject(hql,pareOfSup);
			ArrayList<String> tempTimeslotList=new ArrayList<String>();
			ArrayList<String> mergedTimeslotList=new ArrayList<String>();
			for(int i =0;i<supTimeslot0.size();i++){
				String temp;
				Timeslot timeslot=supTimeslot0.get(i);
				temp=timeslot.getWeek()+","+timeslot.getDay()+","+timeslot.getTime();
				tempTimeslotList.add(temp);
			}
			
			for(int i =1;i<supervisor.size();i++){
				pareOfSup[0]=supervisor.get(i).getId().toString();
				List<Timeslot> supTimeslot=(List<Timeslot>)getListObject(hql,pareOfSup);
				for(int j =0;j<obsTimeslot.size();j++){
					String temp;
					Timeslot timeslot=obsTimeslot.get(j);
					temp=timeslot.getWeek()+","+timeslot.getDay()+","+timeslot.getTime();
					if(tempTimeslotList.contains(temp)){
						mergedTimeslotList.add(temp);
					}else{
						//skip
					}
				}
			}
			for(int i =0;i<obsTimeslot.size();i++){
				String temp;
				Timeslot timeslot=obsTimeslot.get(i);
				temp=timeslot.getWeek()+","+timeslot.getDay()+","+timeslot.getTime();
				if(tempTimeslotList.contains(temp)){
					mergedTimeslotList.add(temp);
				}else{
					//skip
				}
			}
			return mergedTimeslotList;
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("error in getTeacherAndObserverAvailableTime");
			return null;
		}
	}
	
	public boolean checkIfTimeHaveBeenSelected(Teacher teacher,String timeslot){
		String[] tempslot=timeslot.split(",");
		String hql="from Timeslot where teacher_id=? and week=? and day=? and time=?";
		String[] parameters={teacher.getId().toString(),tempslot[0],tempslot[1],tempslot[2]};
		Timeslot time=(Timeslot) getUniqueObject(hql,parameters);
		if(time.getSelected()){
			return true;
		}else{
			return false;
		}
	}
	public boolean ifStudentAlreadySelectATime(Student student){
		String hql="from Timeslot where student_id=?";
		String[] parameters={student.getId().toString()};
		List<Timeslot> time=getListObject(hql,parameters);
		if(time.size()==0){
			return false;
		}else{
			return true;
		}
	}
	public String getStudentSelectTime(Student student){
		String hql="from Timeslot where student_id=?";
		String[] parameters={student.getId().toString()};
		List<Timeslot> time=getListObject(hql,parameters);
		String timeslot=time.get(0).getWeek()+","+time.get(0).getDay()+","+time.get(0).getTime();
		return timeslot;
	}
	public boolean studentSelectTime(Teacher teacher, Student student,String timeslot){
		String hql="update Timeslot set student_id=?, selected=1 where teacher_id=? and week=? and day=? and time=?";
		String[] tempslot=timeslot.split(",");
		String[] parameters={student.getId().toString(),teacher.getId().toString(),tempslot[0],tempslot[1],tempslot[2]};
		return updateObject(hql,parameters);
	}
	
	public void cancelStudentSelectedTime(Student student){
		String hql1="from Timeslot where student_id=?";
		String[] parameters1={student.getId().toString()};
		List<Timeslot> selectedTime=getListObject(hql1,parameters1);
		String hql2="update Timeslot set student_id=null,selected=0 where teacher_id=? and week=? and day=? and time=?";
		String[] parameters2={selectedTime.get(0).getTeacher().getId().toString(),selectedTime.get(0).getWeek(),selectedTime.get(0).getDay(),selectedTime.get(0).getTime()};
		updateObject(hql2,parameters2);
		for(int i=1;i<selectedTime.size();i++){
			parameters2[0]=selectedTime.get(i).getTeacher().getId().toString();
			parameters2[1]=selectedTime.get(i).getWeek();
			parameters2[2]=selectedTime.get(i).getDay();
			parameters2[3]=selectedTime.get(i).getTime();
			updateObject(hql2,parameters2);
		}
	}
}
