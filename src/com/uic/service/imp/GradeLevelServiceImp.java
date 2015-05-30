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
	public boolean updateStudentGrade(String role, String studentGradeList, String studentID) {
		// TODO Auto-generated method stub
		String hql =null;
		if(role.equals("supervisor")){
			hql = "update StudentGrade set supervisorGrade=? where student_id=?";
		}else if(role.equals("observer")){
			hql = "update StudentGrade set observerGrade=? where student_id=?";
		}else if(role.equals("examiner")){
			hql = "update StudentGrade set examinerGrade=? where student_id=?";
		}
		
		String[] parameters = {studentGradeList,studentID};
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
		String hql="from StudentGrade where averageGrade is not null order by totalScore desc";
		try{
			List<StudentGrade> studentGrades = getListObject(hql,null);
			return studentGrades;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	

	@Override
	public boolean checkIfallTeachersHaveMarkTheGrade(String studentID) {
		// TODO Auto-generated method stub
		List<StudentGrade> studentGrade = getStudentGrade(studentID);
		if(studentGrade.get(0).getSupervisorGrade()!=null){
			if(studentGrade.get(0).getExaminerGrade()!=null){
				if(studentGrade.get(0).getObserverGrade()!=null){
					return true;
				}
			}
		}
		return false;
	}

	@Override
	public List<Gradelevel> getValidGradeLevels() {
		String hql = "from Gradelevel where percent!='0'";
		try{
			List<Gradelevel> list = getListObject(hql, null);
			return list;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	

}
