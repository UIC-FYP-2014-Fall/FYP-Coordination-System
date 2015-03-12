package com.uic.service.inter;

import com.uic.domain.Student;

public interface ExcelServiceInter extends BaseInterface{
	
	public boolean deletePreData();
	
	public boolean insertExcel(Student student);

}
