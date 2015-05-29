package com.uic.test;

import java.util.ArrayList;
import java.util.List;

import com.uic.domain.Gradelevel;
import com.uic.service.imp.AssessItemServiceImp;
import com.uic.service.imp.GradeLevelServiceImp;
import com.uic.service.inter.AssessItemServiceInter;
import com.uic.service.inter.GradeLevelServiceInter;
import com.uic.util.BaseUtil;

public class testTips {
	
	public static void main(String[] args) {
		/*String str="  ";
		System.out.println(str.trim().equals(""));*/
		/*AssessItemServiceInter ass = new AssessItemServiceImp();
		System.out.println(ass.totalPercent());*/
		/*GradeLevelServiceInter g = new GradeLevelServiceImp();
		List<Gradelevel> al = g.getGradeLevels();
		for(int i=0;i<al.size();i++){
			System.out.println(al.get(i).getGradeLevel());
		}*/
		System.out.println(BaseUtil.covertScore("B"));

	}
}
