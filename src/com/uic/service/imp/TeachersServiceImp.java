package com.uic.service.imp;

import java.util.List;

import com.uic.domain.Teacher;
import com.uic.service.inter.TeachersServiceInter;
import com.uic.util.HibernateUtil;
import com.uic.util.SystemUtil;

public class TeachersServiceImp extends BaseServiceImp implements TeachersServiceInter{

	@Override
	public List<Teacher> getTeachers() {
		// TODO Auto-generated method stub
		String hql = "from Teacher";
		@SuppressWarnings("unchecked")
		List<Teacher> list = HibernateUtil.executeQueryOpenInView(hql, null);
		return list;
	}

	@Override
	public boolean deleteTeacher(String id) {
		// TODO Auto-generated method stub
		String hql = "delete Teacher where id=?";
		String[] parameters={id};
		try {
			HibernateUtil.executeUpdateOpenInView(hql, parameters);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	@Override
	public boolean resetTeacher(String id) {
		// TODO Auto-generated method stub
		String hql = "update Teacher set password=? where id=?";
		String[] parameters={SystemUtil.getDefaultTeacherPassword(),id};
		try {
			HibernateUtil.executeUpdateOpenInView(hql, parameters);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	@Override
	public boolean checkAccount(String account) {
		// TODO Auto-generated method stub
		boolean flag = false;
		String hql = "from Teacher where account=?";
		String[] parameters={account};
		try {
			Object obj = getUniqueObject(hql, parameters);
			if(obj==null){
				flag = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return flag;
	}


}
