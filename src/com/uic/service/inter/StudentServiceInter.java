package com.uic.service.inter;

import com.uic.domain.Teacher;
import com.uic.domain.Topic;

import java.util.ArrayList;
import java.util.List;

import com.uic.domain.Student;

public interface StudentServiceInter extends BaseInterface {

	public Teacher getObserver(Student student);

	public ArrayList<Teacher> getSupervisor(Student student);

	public boolean checkTopicState(String sid);

	public boolean checkExaminerState(String sid);

	public boolean checkPretimeState(String sid);

	public Topic getStudentTopic(String sid);
	
	public List<Teacher> getSupervisor(String sid); // return supervisor

	public Teacher getObserver(String sid);

	public Teacher getExaminer(String sid);
	
	public Student getStudentById(String sid);
	
	public boolean updateExaminer(String sid, String tid);
	
	public String getStudentPreTime(String week, String day, String time);

}
