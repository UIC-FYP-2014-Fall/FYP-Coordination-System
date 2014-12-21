package com.uic.test;

import com.uic.domain.Student;
import com.uic.domain.Stuexaminer;
import com.uic.domain.Teacher;
import com.uic.domain.Topic;
import com.uic.service.imp.StudentServiceImp;
import com.uic.service.imp.TeachersServiceImp;
import com.uic.service.inter.StudentServiceInter;
import com.uic.service.inter.TeachersServiceInter;

public class testStudentService {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		StudentServiceInter stu = new StudentServiceImp();
		//TeachersServiceInter teacherService = new TeachersServiceImp();
		//Teacher teacher = stu.getSupervisor("1");
		//System.out.println(teacher.getName());
		//Topic topic = stu.getStudentTopic("g130300035");
		//System.out.println(stu.checkTopicState("g130300035"));
		/*Stuexaminer studentExaminer = new Stuexaminer();
		
		Student student = stu.getStudentById("g130300035");
		System.out.println(student.getId());
		Teacher examiner = teacherService.getUniqueTeacherById("3");
		System.out.println(examiner.getId());
		
		studentExaminer.setStudent(student);
		studentExaminer.setTeacher(examiner);
		
		try{
			stu.saveObject(studentExaminer);
		}catch(Exception e){
			e.printStackTrace();
		}*/
		
		//stu.updateExaminer("1", "5");
		//System.out.println(t.getName());
		String time = stu.getPreTimeByStudentId("1");
		System.out.println(time);

	}

}
