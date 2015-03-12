package com.uic.service.imp;

import com.uic.domain.Student;
import com.uic.service.inter.ExcelServiceInter;
import com.uic.util.HibernateUtil;

public class ExcelServiceImp extends BaseServiceImp implements ExcelServiceInter {

	@Override
	public boolean deletePreData() {
		// TODO Auto-generated method stub
		boolean flag = false;
		String hql = "delete from Student";
		try {
			HibernateUtil.executeUpdateOpenInView(hql, null);
			flag = true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean insertExcel(Student student) {
		// TODO Auto-generated method stub
		boolean flag=false;		
		try{
			saveObject(student);
			flag=true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return flag;
	}

}
