package com.uic.service.inter;

import java.util.List;

import com.uic.domain.Message;
import com.uic.domain.Users;

public interface MessagesServiceInter {
	
	public List<Message> getMessages(Users user);
	
	public List<Message> getMessages(Users user, int pageNow, int pageSize);
	
	public int getPageCount(Users user, int pageSize);
	
	public boolean saveMessage(Message message);

}
