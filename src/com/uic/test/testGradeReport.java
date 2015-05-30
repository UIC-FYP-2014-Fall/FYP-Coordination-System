package com.uic.test;

import java.util.ArrayList;
import java.util.List;

import com.uic.domain.AssessItem;
import com.uic.service.imp.AssessItemServiceImp;
import com.uic.service.inter.AssessItemServiceInter;

public class testGradeReport {

	public static void main(String[] args) {
		// test generate grade report
		// get grade record from database
		String str="5,A;8,A;9,A;10,A;12,A;13,A;14,A;15,A;16,A;";
		// remove the last ';'
		char lastChar = str.charAt(str.length()-1);
		
		if(lastChar==';'){
			// remove
			str=str.substring(0,str.length()-1);
		}
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

	}

}
