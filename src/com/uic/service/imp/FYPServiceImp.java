package com.uic.service.imp;

import java.util.ArrayList;
import java.util.List;

import com.uic.domain.TeaTopic;
import com.uic.domain.Teacher;
import com.uic.domain.Topic;
import com.uic.service.inter.FYPServiceInter;
import com.uic.util.HibernateUtil;

public class FYPServiceImp extends BaseServiceImp implements FYPServiceInter {
	@Override
	public List<Topic> getTopic(String teacherName) {
		// TODO Auto-generated method stub
		String hql = "from Topic";
		@SuppressWarnings("unchecked")
		List<Topic> list = HibernateUtil.executeQueryOpenInView(hql, null);
		return list;
	}
	
	public boolean uploadTopic(ArrayList<Teacher> teacher, Topic topic){
		HibernateUtil.save(topic);
		for(int i=0;i<teacher.size();i++){
			TeaTopic teaTopic= new TeaTopic();
			teaTopic.setTeacher(teacher.get(i));
			teaTopic.setTopic(topic);
			HibernateUtil.save(teaTopic);
		}
		return true;
	}
	
	public boolean updatetTopic(ArrayList<Teacher> teacher, Topic topic){
		//update the topic and teatopic
		return true;
	}
	
	public boolean deleteTopic(ArrayList<Teacher> teacher, Topic topic){
		//delete the topic and teatopic
		return true;
	}
	@Override
	public List<TeaTopic> getTeaTopic(String teacherID) {
		// TODO Auto-generated method stub
		String hql = "from TeaTopic where teacher_id=?";
		String[] parameters={teacherID};
		@SuppressWarnings("unchecked")
		List<TeaTopic> list = HibernateUtil.executeQueryOpenInView(hql, parameters);
		return list;
	}
	
	 public List<TeaTopic> getTeaTopicByTopicId(String id){
		 String hql = "from TeaTopic where topic_id=?";
			String[] parameters={id};
			@SuppressWarnings("unchecked")
			List<TeaTopic> list = HibernateUtil.executeQueryOpenInView(hql, parameters);
			return list;
	 }
}
