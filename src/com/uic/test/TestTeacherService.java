package com.uic.test;

import com.uic.service.imp.TeachersServiceImp;
import com.uic.service.inter.TeachersServiceInter;

public class TestTeacherService {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		TeachersServiceInter teacherSerivceInter = new TeachersServiceImp();
		int count = teacherSerivceInter.getCountObserver("1");
		System.out.println(count);
		

	}

}
