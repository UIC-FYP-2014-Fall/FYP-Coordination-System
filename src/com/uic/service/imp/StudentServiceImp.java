package com.uic.service.imp;


import com.uic.domain.Teacher;
import com.uic.domain.Topic;
import com.uic.service.inter.StudentServiceInter;

public class StudentServiceImp extends BaseServiceImp implements StudentServiceInter{

	@Override
	public boolean checkTopicState(String sid) {
		// TODO Auto-generated method stub
		boolean flag = false;
		String hql = "from Stutopic where student.sid=?";
		String[] parameters={sid};
		try {
			Object obj = getUniqueObject(hql, parameters);
			if(obj!=null){
				flag = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean checkExaminerState(String sid) {
		// TODO Auto-generated method stub
		boolean flag = false;
		String hql = "from Stuexaminer where student.sid=?";
		String[] parameters={sid};
		try {
			Object obj = getUniqueObject(hql, parameters);
			if(obj!=null){
				flag = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean checkPretimeState(String sid) {
		// TODO Auto-generated method stub
		boolean flag = false;
		String hql = "from Timeslot where student.sid=?";
		String[] parameters={sid};
		try {
			Object obj = getUniqueObject(hql, parameters);
			if(obj!=null){
				flag = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public Topic getStudentTopic(String sid) {
		// TODO Auto-generated method stub
		Topic topic = new Topic();
		String hql = "from Stutopic where student.sid=?";
		String[] parameters={sid};
		try {
			topic = (Topic)getUniqueObject(hql, parameters);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return topic;
	}

	@Override
	public Teacher getSupervisor(String sid) {
		// TODO Auto-generated method stub
		Teacher teacher = new Teacher();
		String hql = "select t.teacher from TeaTopic as t, Stutopic as s where s.topic.fid=t.topic.fid and s.student.sid=?";
		String[] parameters={sid};
		try {
			teacher = (Teacher)getUniqueObject(hql, parameters);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return teacher;
	}

	@Override
	public Teacher getObserver(String sid) {
		// TODO Auto-generated method stub
		Teacher teacher = new Teacher();
		String hql = "select o.observer from ObsTopic as o, Stutopic as s where s.topic.fid=o.topic.fid and s.student.sid=?";
		String[] parameters={sid};
		try {
			teacher = (Teacher)getUniqueObject(hql, parameters);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return teacher;
	}

	@Override
	public Teacher getExaminer(String sid) {
		// TODO Auto-generated method stub
		Teacher teacher = new Teacher();
		String hql = "select teacher from Stuexaminer where student.sid=?";
		String[] parameters={sid};
		try {
			teacher = (Teacher)getUniqueObject(hql, parameters);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return teacher;
	}
	

	

}
