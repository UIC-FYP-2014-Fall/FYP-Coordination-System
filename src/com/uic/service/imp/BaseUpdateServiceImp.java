package com.uic.service.imp;
import com.uic.service.inter.BaseUpdateServiceInter;
import com.uic.util.HibernateUtil;

public class BaseUpdateServiceImp implements BaseUpdateServiceInter {

	@Override
	public void update(String hql, String[] parameters) {
		// TODO Auto-generated method stub
		try {
			HibernateUtil.executeUpdateOpenInView(hql, parameters);
		} catch (Exception e) {
			// TODO: handle exception		
			throw new RuntimeException(e.getMessage());
		}
	}

}
