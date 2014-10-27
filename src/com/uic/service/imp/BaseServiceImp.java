package com.uic.service.imp;

import java.util.List;

import com.uic.service.inter.BaseInterface;
import com.uic.util.HibernateUtil;

public abstract class BaseServiceImp implements BaseInterface{

	@SuppressWarnings("unchecked")
	@Override
	public List<Object> getListObject(String hql, String[] parameters) {
		// TODO Auto-generated method stub
		List<Object> list = null;
		try {
			list = HibernateUtil.executeQueryOpenInView(hql, parameters);
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException(e.getMessage());
		}
		return list;
	}

	@Override
	public Object getUniqueObject(String hql, String[] parameters) {
		// TODO Auto-generated method stub
		Object obj = null;
		try {
			obj = HibernateUtil.uniqueQueryOpenInView(hql, parameters);
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException(e.getMessage());
		}
		return obj;
	}

}
