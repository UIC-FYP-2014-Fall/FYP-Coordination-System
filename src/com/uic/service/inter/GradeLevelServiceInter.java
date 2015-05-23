package com.uic.service.inter;

import java.util.List;

import com.uic.domain.Gradelevel;
import com.uic.domain.StudentGrade;


public interface GradeLevelServiceInter extends BaseInterface{
	
	public List<Gradelevel> getGradeLevels();
	
	public boolean updateGradeLevel(String id, String percent);
	//public boolean updateGradeLevel(GradeLevelForm gradeLevelForm);
	
	public List<StudentGrade>  getStudentGrade(String sid);

	public boolean saveStudentGrade(StudentGrade studentGrade);
	
	public boolean updateStudentGrade(String studentGradeList, String totalScore, String studentID);
}
