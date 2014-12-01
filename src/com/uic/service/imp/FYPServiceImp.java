package com.uic.service.imp;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.uic.domain.ObsTopic;
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

	public boolean uploadTopic(ArrayList<Teacher> teacher, Topic topic) {
		HibernateUtil.save(topic);
		for (int i = 0; i < teacher.size(); i++) {
			TeaTopic teaTopic = new TeaTopic();
			teaTopic.setTeacher(teacher.get(i));
			teaTopic.setTopic(topic);
			HibernateUtil.save(teaTopic);
		}
		return true;
	}

	public boolean setObserver(Teacher observer, Topic topic) {
		//first check if exit
		String hql="from ObsTopic where topic_id=?";
		String[] parameters={topic.getFid().toString()};
		ObsTopic check = (ObsTopic) HibernateUtil.uniqueQueryOpenInView(hql, parameters);
		if (check==null){
			ObsTopic obsTopic = new ObsTopic();
			obsTopic.setObserver(observer);
			obsTopic.setTopic(topic);
			HibernateUtil.save(obsTopic);
			return true;
		}else{
			hql="update ObsTopic set observer_id=? where topic_id=?";
			String[] para={observer.getId().toString(),topic.getFid().toString()};
			HibernateUtil.executeUpdate(hql, para);
			return true;
		}
	}

	public boolean updateEditTopic(ArrayList<Teacher> teacher, Topic topic) {
		for (int i = 0; i < teacher.size(); i++) {
			TeaTopic teaTopic = new TeaTopic();
			teaTopic.setTeacher(teacher.get(i));
			teaTopic.setTopic(topic);
			HibernateUtil.save(teaTopic);
		}
		return true;
	}

	public boolean updatetTopic(Topic topic) {
		Session session = HibernateUtil.openSession();
		Transaction tx = session.beginTransaction();
		session.update(topic);
		tx.commit();
		session.close();
		return true;
	}

	public boolean CheckIfTeaTopicExit(String topicId, String teacherId) {
		String hql = "from TeaTopic where topic_id=? and teacher_id=?";
		String[] parameters = { topicId, teacherId };
		TeaTopic teaTopic = (TeaTopic) HibernateUtil.uniqueQueryOpenInView(hql,
				parameters);
		if (teaTopic == null) {
			return false;
		} else {
			return true;
		}
	}

	public boolean deleteTopic(Topic topic) {
		// delete the topic
		Session session = HibernateUtil.openSession();
		Transaction tx = session.beginTransaction();
		session.delete(topic);
		tx.commit();
		session.close();
		return true;
	}

	@Override
	public List<TeaTopic> getTeaTopic(String teacherId) {
		// TODO Auto-generated method stub
		String hql = "from TeaTopic where teacher_id=?";
		String[] parameters = { teacherId };
		@SuppressWarnings("unchecked")
		List<TeaTopic> list = HibernateUtil.executeQueryOpenInView(hql,
				parameters);
		return list;
	}
	
	public List<ObsTopic> getObsTopicByTopicId(String topicId) {
		String hql = "from ObsTopic where topic_id=?";
		String[] parameters = { topicId };
		@SuppressWarnings("unchecked")
		List<ObsTopic> list = HibernateUtil.executeQueryOpenInView(hql,
				parameters);
		return list;
	}
	public Topic getUniqueTopic(String topicId) {
		// TODO Auto-generated method stub
		String hql = "from Topic where fid=?";
		String[] parameters = { topicId };
		Topic topic = (Topic) HibernateUtil.uniqueQuery(hql, parameters);
		return topic;
	}

	public List<TeaTopic> getTeaTopicByTopicId(String id) {
		String hql = "from TeaTopic where topic_id=?";
		String[] parameters = { id };
		@SuppressWarnings("unchecked")
		List<TeaTopic> list = HibernateUtil.executeQueryOpenInView(hql,
				parameters);
		return list;
	}

	public void deleteTeaTopic(String topicId, String teacherId) {
		String hql = "delete from TeaTopic where topic_id=? and teacher_id=?";
		String[] parameters = { topicId, teacherId };
		HibernateUtil.executeUpdate(hql, parameters);
	}
}
