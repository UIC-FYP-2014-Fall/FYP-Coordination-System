package com.uic.test;

import org.junit.Test;

import com.uic.service.imp.ExcelServiceImp;
import com.uic.service.inter.ExcelServiceInter;

public class testExcel {

	@Test
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ExcelServiceInter excel = new ExcelServiceImp();
		if(excel.deletePreData()){
			System.out.println("Sucessful");
			
		}else{
			System.out.println("Failed!");
		}
		

	}

}
