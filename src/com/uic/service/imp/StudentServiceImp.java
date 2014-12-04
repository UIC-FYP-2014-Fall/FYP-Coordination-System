package com.uic.service.imp;

import com.uic.service.inter.StudentServiceInter;

public class StudentServiceImp extends BaseServiceImp implements StudentServiceInter{

	@Override
	public boolean checkTopicState(String sid) {
		// TODO Auto-generated method stub
		boolean flag = false;
		String hql = "from Stutopic where student.sid=?";
		String[] parameters={sid};
		try {
			Object obj = getUniqueObject(hql, parameters);
			if(obj!=null){
				flag = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean checkExaminerState(String sid) {
		// TODO Auto-generated method stub
		boolean flag = false;
		String hql = "from Stuexaminer where student.sid=?";
		String[] parameters={sid};
		try {
			Object obj = getUniqueObject(hql, parameters);
			if(obj!=null){
				flag = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean checkPretimeState(String sid) {
		// TODO Auto-generated method stub
		boolean flag = false;
		String hql = "from Timeslot where student.sid=?";
		String[] parameters={sid};
		try {
			Object obj = getUniqueObject(hql, parameters);
			if(obj!=null){
				flag = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return flag;
	}

}
