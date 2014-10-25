package com.uic.service.imp;

import java.util.List;


import com.uic.domain.Message;
import com.uic.domain.Users;
import com.uic.service.inter.MessagesServiceInter;
import com.uic.util.HibernateUtil;

public class MessagesServiceImp extends BaseServiceImp implements MessagesServiceInter{

	@SuppressWarnings("unchecked")
	@Override
	public List<Message> getMessages(Users user) {
		// TODO Auto-generated method stub
		String hql = "from Message where receiver=? or receiver='all' order by date desc";
		String[] parameters={user.getType()};
		List<Message> list = HibernateUtil.executeQueryOpenInView(hql, parameters);
		return list;
	}

	@Override
	public List<Message> getMessages(Users user, int pageNow, int pageSize) {
		// TODO Auto-generated method stub
		String hql = "from Message where receiver=? or receiver='all' order by date desc";
		String[] parameters={user.getType()};
		@SuppressWarnings("unchecked")
		List<Message> list = HibernateUtil.executeQueryByPageOpenInView(hql, parameters, pageSize, pageNow);
		return list;
	}

	@Override
	public int getPageCount(Users user, int pageSize) {
		// TODO Auto-generated method stub
		String hql = "select count(*) from Message where receiver=? or receiver='all'";
		String[] parameters={user.getType()};
		int rowCount=Integer.parseInt(HibernateUtil.uniqueQueryOpenInView(hql, parameters).toString());
		return (rowCount-1)/pageSize+1;
	}

	@Override
	public boolean saveMessage(Message message) {
		// TODO Auto-generated method stub
		try {
			HibernateUtil.save(message);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

}
