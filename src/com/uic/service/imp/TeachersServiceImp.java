package com.uic.service.imp;

import java.util.List;

import com.uic.domain.Teacher;
import com.uic.service.inter.TeachersServiceInter;
import com.uic.util.HibernateUtil;

public class TeachersServiceImp extends BaseServiceImp implements TeachersServiceInter{

	@Override
	public List<Teacher> getTeachers() {
		// TODO Auto-generated method stub
		String hql = "from Teacher";
		@SuppressWarnings("unchecked")
		List<Teacher> list = HibernateUtil.executeQueryOpenInView(hql, null);
		return list;
	}


}
