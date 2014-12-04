package com.uic.test;

import com.uic.service.imp.StudentServiceImp;
import com.uic.service.inter.StudentServiceInter;

public class testStudentService {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		StudentServiceInter stu = new StudentServiceImp();
		if (stu.checkExaminerState("123")) {
			System.out.println("True");
		} else {
			System.out.println("false");

		}

	}

}
