package com.uic.service.inter;

import java.util.List;

import com.uic.domain.Gradelevel;
import com.uic.domain.StudentGrade;

/**
 * GradeLevelServiceInter include Gradelevel table and StudentGrade table
 * This interface name has a problem.
 * @author lenovo
 *
 */
public interface GradeLevelServiceInter extends BaseInterface{
	
	public List<Gradelevel> getGradeLevels();
	
	public boolean updateGradeLevel(String id, String percent);
	//public boolean updateGradeLevel(GradeLevelForm gradeLevelForm);
	
	/*
	 * StudentGrade
	 */
	public List<StudentGrade> getStudentGrade(String sid);

	public boolean saveStudentGrade(StudentGrade studentGrade);
	
	public boolean updateStudentGrade(String role, String studentGradeList, String studentID);
	
	public boolean checkIfallTeachersHaveMarkTheGrade(String studentID);
	
	/*
	 * Generate student grade report
	 */
	public List<StudentGrade> getValidStudentGrade();
	
	

	
}
