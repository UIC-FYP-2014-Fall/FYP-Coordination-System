package com.uic.test;

import com.uic.domain.Teacher;
import com.uic.service.imp.StudentServiceImp;
import com.uic.service.inter.StudentServiceInter;

public class testStudentService {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		StudentServiceInter stu = new StudentServiceImp();
		Teacher teacher = stu.getSupervisor("1");
		System.out.println(teacher.getName());

	}

}
