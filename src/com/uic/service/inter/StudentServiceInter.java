
package com.uic.service.inter;

import java.util.ArrayList;

import com.uic.domain.Student;
import com.uic.domain.Teacher;

public interface StudentServiceInter extends BaseInterface{
	public Teacher getObserver(Student student);
	public ArrayList<Teacher> getSupervisor(Student student);
	public boolean checkTopicState(String sid);
	public boolean checkExaminerState(String sid);
	public boolean checkPretimeState(String sid);

}

