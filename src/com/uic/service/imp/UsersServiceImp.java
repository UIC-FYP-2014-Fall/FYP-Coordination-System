package com.uic.service.imp;

import com.uic.domain.Users;
import com.uic.service.inter.UsersServiceInter;

public class UsersServiceImp extends BaseServiceImp implements UsersServiceInter{

	@Override
	public Object checkUser(Users user) {
		// TODO Auto-generated method stub
		Object obj = null;
		if(user.getType().equals("student")){
			String hql = "from Student where sid=? and password=?";
			String parameters[]={user.getUsername(),user.getPassword()};
			obj = getUniqueObject(hql, parameters);
		}
		else if(user.getType().equals("teacher")){
			String hql = "from Teacher where account=? and password=?";
			String parameters[]={user.getUsername(),user.getPassword()};
			obj = getUniqueObject(hql, parameters);
		}
		else if(user.getType().equals("coordinator")){
			String hql = "from Coordinator where account=? and password=?";
			String parameters[]={user.getUsername(),user.getPassword()};
			obj = getUniqueObject(hql, parameters);
		}
		return obj;
		
		
	}

	@Override
	public Object checkUser(String username, String type) {
		// TODO Auto-generated method stub
		Object obj = null;
		if(type.equals("student")){
			String hql = "from Student where sid=?";
			String parameters[]={username};
			obj = getUniqueObject(hql, parameters);
		}else if(type.equals("teacher")){
			String hql = "from Teacher where account=?";
			String parameters[]={username};
			obj = getUniqueObject(hql, parameters);
		}else if(type.equals("coordinator")){
			String hql = "from Coordinator where account=?";
			String parameters[]={username};
			obj = getUniqueObject(hql, parameters);
		}
		return obj;
	}

}
