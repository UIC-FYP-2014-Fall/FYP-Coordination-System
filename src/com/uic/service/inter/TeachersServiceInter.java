package com.uic.service.inter;

import java.util.ArrayList;
import java.util.List;

import com.uic.domain.Student;
import com.uic.domain.Teacher;

public interface TeachersServiceInter extends BaseInterface{
	public Teacher getUniqueTeacherByName(String name);
	
	public List<Teacher> getTeachers();
	
	public boolean deleteTeacher(String id);
	
	public boolean resetTeacher(String id);
	
	public boolean checkAccount(String account);
	
	public boolean saveQuota(String id, String quota);
	
	public boolean saveWorkload(String id, String workload);
	
	public Integer getWorkload(String id);
	
	public Integer getCountSupervisor(String id);
	
	public Integer getCountObserver(String id);
	
	public Teacher getUniqueTeacherById(String id);

	public ArrayList<Student> getSuperviseStudentList(String id);
	
	public ArrayList<Student> getObservateStudentList(String id);
	
	public ArrayList<Student> getExmineStudentList(String id);
}
