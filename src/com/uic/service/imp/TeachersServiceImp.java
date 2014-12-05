package com.uic.service.imp;

import java.util.List;

import com.uic.domain.Student;
import com.uic.domain.Teacher;
import com.uic.service.inter.TeachersServiceInter;
import com.uic.util.HibernateUtil;
import com.uic.util.PropertiesHelper;

public class TeachersServiceImp extends BaseServiceImp implements TeachersServiceInter{

	@Override
	public List<Teacher> getTeachers() {
		// TODO Auto-generated method stub
		String hql = "from Teacher";
		try{
			List<Teacher> list = getListObject(hql, null);
			return list;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public Teacher getUniqueTeacherByName(String name) {
		// TODO Auto-generated method stub
		String hql="from Teacher where name=?";
		String[] parameters={name};
		try {
			Teacher t=(Teacher) getUniqueObject(hql, parameters);
			return t;
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}
	}
	
	public Teacher getUniqueTeacherById(String id) {
		// TODO Auto-generated method stub
		String hql="from Teacher where id=?";
		String[] parameters={id};
		try {
			Teacher t=(Teacher) getUniqueObject(hql, parameters);
			return t;
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}
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
		PropertiesHelper ph = new PropertiesHelper("/WEB-INF/config/FYP-system.properties");
		String hql = "update Teacher set password=? where id=?";
		String[] parameters={ph.getProperties("DefaultTeacherPassword"),id};
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

	@Override
	public boolean saveQuota(String id, String quota) {
		// TODO Auto-generated method stub
		String hql = "update Teacher set quota=? where id=?";
		String[] parameters={quota,id};
		try {
			HibernateUtil.executeUpdateOpenInView(hql, parameters);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	@Override
	public boolean saveWorkload(String id, String workload) {
		// TODO Auto-generated method stub
		String hql = "update Teacher set workload=? where id=?";
		String[] parameters={workload,id};
		try {
			HibernateUtil.executeUpdateOpenInView(hql, parameters);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}
}
