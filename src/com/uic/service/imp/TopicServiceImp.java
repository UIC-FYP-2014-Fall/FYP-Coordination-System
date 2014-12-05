package com.uic.service.imp;

import com.uic.domain.Teacher;
import com.uic.service.inter.TopicServiceInter;

public class TopicServiceImp extends BaseServiceImp implements TopicServiceInter{

	@Override
	public Teacher getTeacher(String tid) {
		// TODO Auto-generated method stub
		Teacher teacher = new Teacher();
		String hql = "from TeaTopic where topic.fid=?";
		String[] parameters={tid};
		try {
			teacher = (Teacher)getUniqueObject(hql, parameters);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}

}
