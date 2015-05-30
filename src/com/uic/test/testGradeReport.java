package com.uic.test;

import java.util.ArrayList;
import java.util.List;

import com.uic.domain.AssessItem;
import com.uic.domain.Gradelevel;
import com.uic.domain.StudentGrade;
import com.uic.service.imp.AssessItemServiceImp;
import com.uic.service.imp.GradeLevelServiceImp;
import com.uic.service.inter.AssessItemServiceInter;
import com.uic.service.inter.GradeLevelServiceInter;

public class testGradeReport {

	public static void main(String[] args) {
		// test generate grade report
		GradeLevelServiceInter gradeService = new GradeLevelServiceImp();
		
		List<StudentGrade> studentGradeList = gradeService.getValidStudentGrade();
		
		//System.out.println(studentGradeList.get(0).getAverageGrade());
		// get grade record from database
		String str = studentGradeList.get(0).getAverageGrade();
		//String str="5,4.00;16,3.78;10,2.50;14,3.00;9,3.50;15,3.33;12,3.11;8,3.44;13,3.00;";
		// remove the last ';'
		char lastChar = str.charAt(str.length()-1);
		
		if(lastChar==';'){
			// remove
			str=str.substring(0,str.length()-1);
		}
		System.out.println(str);
		// split grade record
		String[] tmp = str.split(";");
		List<AssessItem> assessItemList = new ArrayList<>();
		AssessItemServiceInter assessItemService = new AssessItemServiceImp();
		
		for(int i=0; i<tmp.length;i++){
			String tmp2[] = tmp[i].split(",");
			AssessItem assessItem = assessItemService.getAssessItemById(tmp2[0]);
			assessItem.setGrade(tmp2[1]);
			assessItemList.add(assessItem);
		}
		
		System.out.println(assessItemList.size());

	}

}
