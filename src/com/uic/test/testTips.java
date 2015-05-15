package com.uic.test;

import com.uic.service.imp.AssessItemServiceImp;
import com.uic.service.inter.AssessItemServiceInter;

public class testTips {
	
	public static void main(String[] args) {
		/*String str="  ";
		System.out.println(str.trim().equals(""));*/
		AssessItemServiceInter ass = new AssessItemServiceImp();
		System.out.println(ass.totalPercent());

	}
}
