package com.uic.service.inter;

import com.uic.domain.Teacher;
import com.uic.domain.Topic;

public interface StudentServiceInter {

	public boolean checkTopicState(String sid);

	public boolean checkExaminerState(String sid);

	public boolean checkPretimeState(String sid);

	public Topic getStudentTopic(String sid);

	public Teacher getSupervisor(String sid); //return supervisor
	
	public Teacher getObserver(String sid);
	
	public Teacher getExaminer(String sid);

}
