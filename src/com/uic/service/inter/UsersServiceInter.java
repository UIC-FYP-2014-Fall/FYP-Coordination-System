package com.uic.service.inter;

import com.uic.domain.Users;



public interface UsersServiceInter {
	
	public Object checkUser(Users user);
	
	public Object checkUser(String username, String type);

}
