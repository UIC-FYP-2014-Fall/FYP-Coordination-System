package com.uic.service.inter;

import java.util.List;

import com.uic.domain.Teacher;

public interface TeachersServiceInter extends BaseInterface{
	
	public List<Teacher> getTeachers();
	
	public boolean deleteTeacher(String id);
	
	public boolean resetTeacher(String id);
	
	public boolean checkAccount(String account);
	

}
