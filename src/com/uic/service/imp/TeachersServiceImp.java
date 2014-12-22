package com.uic.service.imp;

import java.util.List;

import com.uic.domain.TeaTopic;
import com.uic.domain.Teacher;
import com.uic.service.inter.TeachersServiceInter;
import com.uic.util.HibernateUtil;
import com.uic.util.PropertiesHelper;

public class TeachersServiceImp extends BaseServiceImp implements TeachersServiceInter{

	@Override
	public List<Teacher> getTeachers() {
		// TODO Auto-generated method stub
		String hql = "from Teacher";
		try{
			List<Teacher> list = getListObject(hql, null);
			return list;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public boolean checkTeacherHasQuota(String topicId, String NumOfPeople){
		FYPServiceImp fypService = new FYPServiceImp();
		boolean flag = false;
		try{
			List<TeaTopic> teaTopic = fypService.getTeaTopicByTopicId(topicId);
			for(int i=0;i<teaTopic.size();i++){
				if(Integer.parseInt(teaTopic.get(i).getTeacher().getQuotaLeft())>=Integer.parseInt(NumOfPeople)){
					System.out.println("11");
					flag=true;
				}else{
					System.out.println("22");
					flag=false;
					return flag;
				}
			}
			return flag;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
		
	}
	
	@Override
	public Teacher getUniqueTeacherByName(String name) {
		// TODO Auto-generated method stub
		String hql="from Teacher where name=?";
		String[] parameters={name};
		try {
			Teacher t=(Teacher) getUniqueObject(hql, parameters);
			return t;
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}
	}
	
	public Teacher getUniqueTeacherById(String id) {
		// TODO Auto-generated method stub
		String hql="from Teacher where id=?";
		String[] parameters={id};
		try {
			Teacher t=(Teacher) getUniqueObject(hql, parameters);
			return t;
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}
	}

	@Override
	public boolean deleteTeacher(String id) {
		// TODO Auto-generated method stub
		String hql = "delete Teacher where id=?";
		String[] parameters={id};
		try {
			HibernateUtil.executeUpdateOpenInView(hql, parameters);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	@Override
	public boolean resetTeacher(String id) {
		// TODO Auto-generated method stub
		PropertiesHelper ph = new PropertiesHelper("/WEB-INF/config/FYP-system.properties");
		String hql = "update Teacher set password=? where id=?";
		String[] parameters={ph.getProperties("DefaultTeacherPassword"),id};
		try {
			HibernateUtil.executeUpdateOpenInView(hql, parameters);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	@Override
	public boolean checkAccount(String account) {
		// TODO Auto-generated method stub
		boolean flag = false;
		String hql = "from Teacher where account=?";
		String[] parameters={account};
		try {
			Object obj = getUniqueObject(hql, parameters);
			if(obj==null){
				flag = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean saveQuota(String id, String quota) {
		// TODO Auto-generated method stub
		String hql = "update Teacher set quota=?,quotaleft=? where id=?";
		String[] parameters={quota,quota,id};
		try {
			HibernateUtil.executeUpdateOpenInView(hql, parameters);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	@Override
	public boolean saveWorkload(String id, String workload) {
		// TODO Auto-generated method stub
		String hql = "update Teacher set workload=? where id=?";
		String[] parameters={workload,id};
		try {
			HibernateUtil.executeUpdateOpenInView(hql, parameters);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}


	@Override
	public Integer getWorkload(String id) {
		// TODO Auto-generated method stub
		Integer count = 0;
		String hql = "select count(*) from Stuexaminer where teacher.id = ?";
		String[] parameters={id};
		try{
			count=Integer.parseInt(HibernateUtil.uniqueQueryOpenInView(hql, parameters).toString());
		}catch(Exception e){
			e.printStackTrace();
		}
		return count;
	}

	public boolean minusTeacherQuotaLeft(String topicId){
		FYPServiceImp fypService = new FYPServiceImp();
		boolean flag= false;
		List<TeaTopic> teaTopic = fypService.getTeaTopicByTopicId(topicId);
		String hql="update Teacher set quotaLeft=? where id=?";
		Integer numberOfPeople = teaTopic.get(0).getTopic().getNumOfStudent();
		String[] parameters={"",""};
		for(int i = 0;i<teaTopic.size();i++){
			String quotaLeft = teaTopic.get(i).getTeacher().getQuotaLeft();
			Integer quotaLeft2=Integer.parseInt(quotaLeft)-numberOfPeople;
			String newQuotaLeft=quotaLeft2.toString();
			System.out.println("quota left "+quotaLeft);
			System.out.println("numberOfPeople "+numberOfPeople);
			System.out.println("new quota left "+newQuotaLeft);
			parameters[0]=newQuotaLeft;
			parameters[1]=teaTopic.get(i).getTeacher().getId().toString();
			flag = updateObject(hql,parameters);
		}
		return flag;
	}
	public boolean addTeacherQuotaLeft(String topicId){
		FYPServiceImp fypService = new FYPServiceImp();
		boolean flag= false;
		List<TeaTopic> teaTopic = fypService.getTeaTopicByTopicId(topicId);
		String hql="update Teacher set quotaLeft=? where id=?";
		Integer numberOfPeople = teaTopic.get(0).getTopic().getNumOfStudent();
		String[] parameters={"",""};
		for(int i = 0;i<teaTopic.size();i++){
			String quotaLeft = teaTopic.get(i).getTeacher().getQuotaLeft();
			Integer quotaLeft2=Integer.parseInt(quotaLeft)+numberOfPeople;
			String newQuotaLeft=quotaLeft2.toString();
			parameters[0]=newQuotaLeft;
			parameters[1]=teaTopic.get(i).getTeacher().getId().toString();
			flag = updateObject(hql,parameters);
		}
		return flag;
	}


	@Override
	public Integer getCountSupervisor(String id) {
		// TODO Auto-generated method stub
		Integer count = 0;
		String hql = "select count(*) from TeaTopic as t, StuTopic as s where s.topic.fid=t.topic.fid and t.teacher.id=?";
		String[] parameters={id};
		try{
			count=Integer.parseInt(HibernateUtil.uniqueQueryOpenInView(hql, parameters).toString());
		}catch(Exception e){
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public Integer getCountObserver(String id) {
		// TODO Auto-generated method stub
		Integer count = 0;
		String hql = "select count(*) from ObsTopic as o, StuTopic as s where s.topic.fid=o.topic.fid and o.observer.id=?";
		String[] parameters={id};
		try{
			count=Integer.parseInt(HibernateUtil.uniqueQueryOpenInView(hql, parameters).toString());
		}catch(Exception e){
			e.printStackTrace();
		}
		return count;
	}


}
