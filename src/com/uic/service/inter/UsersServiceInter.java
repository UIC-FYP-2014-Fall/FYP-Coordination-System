package com.uic.service.inter;

import com.uic.domain.Users;



public interface UsersServiceInter extends BaseInterface{
	
	public Object checkUser(Users user);
	
	public Object checkUser(String username, String type);
	
	public boolean changePwd(String role, String newPwd, String id);

}
