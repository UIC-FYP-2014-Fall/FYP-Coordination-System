package com.uic.service.imp;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import com.uic.domain.ObsTopic;
import com.uic.domain.Student;
import com.uic.domain.Stutopic;
import com.uic.domain.TeaTopic;
import com.uic.domain.Teacher;
import com.uic.domain.Topic;
import com.uic.service.inter.FYPServiceInter;
import com.uic.util.HibernateUtil;

@SuppressWarnings("unchecked")
public class FYPServiceImp extends BaseServiceImp implements FYPServiceInter {
	@Override
	public List<Topic> getTopic(String teacherName) {
		// TODO Auto-generated method stub
		String hql = "from Topic";
		try {
			List<Topic> list = getListObject(hql, null);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public boolean uploadTopic(ArrayList<Teacher> teacher, Topic topic) {
		boolean flag = true;
		try {
			saveObject(topic);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Can not save the topic.");
			flag = false;
			return flag;
		}
		for (int i = 0; i < teacher.size(); i++) {
			TeaTopic teaTopic = new TeaTopic();
			teaTopic.setTeacher(teacher.get(i));
			teaTopic.setTopic(topic);
			try {
				saveObject(teaTopic);
			} catch (Exception e) {
				System.out.println("Can not save the teaTopic.");
				e.printStackTrace();
				flag = false;
				return flag;
			}
		}
		return flag;
	}

	public boolean setObserver(Teacher observer, Topic topic) {
		// first check if exit
		String hql = "from ObsTopic where topic_id=?";
		String[] parameters = { topic.getFid().toString() };
		ObsTopic check = (ObsTopic) getUniqueObject(hql, parameters);
		if (check == null) {
			ObsTopic obsTopic = new ObsTopic();
			obsTopic.setObserver(observer);
			obsTopic.setTopic(topic);
			try {
				saveObject(obsTopic);
			} catch (Exception e) {
				System.out.println("Can not update the observer");
				e.printStackTrace();
				return false;
			}
			return true;
		} else {
			hql = "update ObsTopic set observer_id=? where topic_id=?";
			String[] para = { observer.getId().toString(),
					topic.getFid().toString() };
			try {
				updateObject(hql, para);
			} catch (Exception e) {
				System.out.println("Can not update the observer");
				e.printStackTrace();
				return false;
			}
			return true;
		}
	}

	public boolean updateEditTopic(ArrayList<Teacher> teacher, Topic topic) {
		for (int i = 0; i < teacher.size(); i++) {
			TeaTopic teaTopic = new TeaTopic();
			teaTopic.setTeacher(teacher.get(i));
			teaTopic.setTopic(topic);
			try {
				saveObject(teaTopic);
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}
		}
		return true;
	}

	public boolean updatetTopic(Topic topic) {
		Session session = HibernateUtil.getCurrentSession();
		try {
			session.update(topic);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public boolean CheckIfTeaTopicExit(String topicId, String teacherId) {
		String hql = "from TeaTopic where topic_id=? and teacher_id=?";
		String[] parameters = { topicId, teacherId };
		TeaTopic teaTopic = (TeaTopic) getUniqueObject(hql, parameters);
		if (teaTopic == null) {
			return false;
		} else {
			return true;
		}
	}

	public boolean deleteTopic(Topic topic) {
		// delete the topic
		Session session = HibernateUtil.getCurrentSession();
		try {
			session.delete(topic);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public List<TeaTopic> getTeaTopic(String teacherId) {
		// TODO Auto-generated method stub
		String hql = "from TeaTopic where teacher_id=?";
		String[] parameters = { teacherId };
		try {
			List<TeaTopic> list = getListObject(hql, parameters);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public List<ObsTopic> getObsTopicByTopicId(String topicId) {
		String hql = "from ObsTopic where topic_id=?";
		String[] parameters = { topicId };
		try {
			List<ObsTopic> list = (List<ObsTopic>) getListObject(hql,
					parameters);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public Topic getUniqueTopic(String topicId) {
		// TODO Auto-generated method stub
		String hql = "from Topic where fid=?";
		String[] parameters = { topicId };
		try {
			Topic topic = (Topic) getUniqueObject(hql, parameters);
			return topic;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public List<TeaTopic> getTeaTopicByTopicId(String id) {
		String hql = "from TeaTopic where topic_id=?";
		String[] parameters = { id };
		try {
			List<TeaTopic> list = (List<TeaTopic>) getListObject(hql,
					parameters);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public void deleteTeaTopic(String topicId, String teacherId) {
		String hql = "delete from TeaTopic where topic_id=? and teacher_id=?";
		String[] parameters = { topicId, teacherId };
		HibernateUtil.executeUpdate(hql, parameters);
	}

	public ObsTopic refreshObsTopic(ObsTopic obsTopic) {
		obsTopic = (ObsTopic) HibernateUtil.refreshObj(obsTopic);
		try {
			return obsTopic;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<Stutopic> getStutopicByStudent(Student student) {
		// TODO Auto-generated method stub
		String hql = "from Stutopic where sid=?";
		String[] parameters = { student.getId().toString() };
		try {
			List<Stutopic> stutopic = (List<Stutopic>) getListObject(hql,
					parameters);
			return stutopic;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	public boolean deleteTopic(String topicId) {
		System.out.println(topicId);
		String hql = "delete from TeaTopic where topic_id=?";
		String hql2 = "delete from Topic where fid=?";
		//String hql3 = "delete from ObsTopic where topic_id=?";
		String[] parameters = { topicId };
		boolean flag = false;
		try {
			if (updateObject(hql, parameters)) {
				if (updateObject(hql2, parameters)) {
					return true;
				} else {
					return false;
				}
			}

			return false;
			// flag = updateObject(hql3,parameters);
		} catch (Exception e) {
			e.printStackTrace();
			return flag;
		}
	}

}
