package com.uic.service.imp;

import com.uic.service.inter.ChangePwdServiceInter;

public class ChangePwdServiceImp extends BaseUpdateServiceImp implements
		ChangePwdServiceInter {

	@Override
	public void changePwd(String userID, String password) {
		// TODO Auto-generated method stub
		String hql = "update Teacher set password=? where id=?";
		String[] parameters={password,userID};
		update(hql,parameters);
	}
}
