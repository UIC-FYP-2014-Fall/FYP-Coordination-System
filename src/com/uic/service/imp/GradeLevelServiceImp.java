package com.uic.service.imp;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.uic.domain.Gradelevel;
import com.uic.domain.Student;
import com.uic.domain.StudentGrade;
import com.uic.service.inter.GradeLevelServiceInter;
import com.uic.service.inter.StudentServiceInter;
import com.uic.util.HibernateUtil;

public class GradeLevelServiceImp extends BaseServiceImp implements GradeLevelServiceInter{

	@Override
	public List<Gradelevel> getGradeLevels() {
		// TODO Auto-generated method stub
		if(!validateGradeLevelCount()){
			initGradeLevel();
		}
		String hql = "from Gradelevel";
		try{
			List<Gradelevel> list = getListObject(hql, null);
			return list;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 
	 * @return
	 */
	private boolean validateGradeLevelCount(){
		boolean flag = false;
		String hql = "select count(*) from Gradelevel";
		int res = new Long((long)getUniqueObject(hql, null)).intValue();
		if(res!=0){
			flag=true;
		}
		return flag;
	}
	
	private boolean initGradeLevel(){
		String[] gradelevel = {"A","A-","B+","B","B-","C+","C","C-","D","E","F"};
		for(int i=0;i<gradelevel.length;i++){
			Gradelevel grade = new Gradelevel();
			grade.setGradeLevel(gradelevel[i]);
			grade.setPercent((short)0);
			try {
				saveObject(grade);
			} catch (Exception e) {
				// TODO: handle exception
				return false;
			}
		}
		return true;
	}

	@Override
	public boolean updateGradeLevel(String id, String percent) {
		// TODO Auto-generated method stub
		String hql = "update Gradelevel set percent=? where id=?";
		String[] parameters={percent,id};
		try {
			HibernateUtil.executeUpdateOpenInView(hql, parameters);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	@Override
	public List<StudentGrade> getStudentGrade(String sid) {
		// TODO Auto-generated method stub
		String hql="from StudentGrade where student.id = ?";
		String[] parameters = {sid};
		try{
			List<StudentGrade> studentGrades = getListObject(hql,parameters);
			return studentGrades;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		
	}

	@Override
	public boolean saveStudentGrade(StudentGrade studentGrade) {
		// TODO Auto-generated method stub
		try{
			saveObject(studentGrade);
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean updateStudentGrade(String studentGradeList, String totalScore, String studentID) {
		// TODO Auto-generated method stub
		String hql = "update StudentGrade set grade=?, totalScore=? where student_id=?";
		String[] parameters = {studentGradeList,totalScore,studentID};
		try{
			updateObject(hql,parameters);
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * Valid student grade mean three different role teachers give the student grade
	 * 
	 * @return List<StudentGrade>
	 */
	@Override
	public List<StudentGrade> getValidStudentGrade() {
		
		// 1. get the students who have been graded by three teachers
		List<StudentGrade> validateStudent = getValidStudent();
		List<Integer> validateStudentId = getValidStudentId();
		
		StudentServiceImp studentService = new StudentServiceImp();
		
		HashMap<String, Student> studentMap = new HashMap<>();
		for(int i=0;i<validateStudentId.size();i++){
			
		}
		
		// 2. repackage these students
		List<StudentGrade> newStudentGrade = new ArrayList<>();
		
		
		
		// student(id, name)
		// Assessment Item grade (assessItem)
		// total score
		// letter grade => gradelevel decided
		for(int i=0;i<validateStudentId.size();i++){
			StudentGrade stu = new StudentGrade();
			stu.setStudent(studentService.getUniqueStudent(validateStudentId.get(i)+""));
			//stu.setAssessItemGrade();
			
			//stu.setTotalScore();
			//stu.setTotalLetterGrade();
			
			newStudentGrade.add(stu);
		}
		return null;
	}
	
	private String studentGrade(String student_id){
		String str = null;
		List<StudentGrade> list = getStudentGrade(student_id);
		
		for(int i=0;i<list.size();i++){
			
		}
		
		return str;
	}
	
	//private 
	
	private List<StudentGrade> getValidStudent(){
		String hql="from StudentGrade WHERE student.id in (SELECT student.id from StudentGrade GROUP BY student.id HAVING COUNT(*)=3)";
		try{
			List<StudentGrade> validStudentGrade = getListObject(hql,null);
			return validStudentGrade;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	private List<Integer> getValidStudentId(){
		String hql = "SELECT student.id from StudentGrade GROUP BY student.id HAVING COUNT(*)=3";
		try{
			List<Integer> validStudentGradeId = getListObject(hql,null);
			return validStudentGradeId;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	

}
