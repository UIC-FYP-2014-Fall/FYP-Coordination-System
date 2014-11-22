package com.uic.service.inter;

import java.util.List;

import com.uic.domain.Teacher;

public interface TeachersServiceInter extends BaseInterface{
	public Teacher getUniqueTeacher(String name);
	
	public List<Teacher> getTeachers();
	
	public boolean deleteTeacher(String id);
	
	public boolean resetTeacher(String id);
	
	public boolean checkAccount(String account);
	
	public boolean saveQuota(String id, String quota);
	
	public boolean saveWorkload(String id, String workload);
	

}
