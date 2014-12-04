package com.uic.service.imp;

import java.util.ArrayList;
import java.util.List;

import com.uic.domain.ObsTopic;
import com.uic.domain.Student;
import com.uic.domain.Stutopic;
import com.uic.domain.TeaTopic;
import com.uic.domain.Teacher;
import com.uic.service.inter.StudentServiceInter;

public class StudentServiceImp extends BaseServiceImp implements StudentServiceInter{
	@Override
	public Teacher getObserver(Student student) {
		// TODO Auto-generated method stub
		FYPServiceImp fypService = new FYPServiceImp();
		List<Stutopic> stutopic = fypService.getStutopicByStudent(student);
		List<ObsTopic> obsTopic = fypService.getObsTopicByTopicId(stutopic.get(0).getTopic().getFid().toString());
		return obsTopic.get(0).getObserver();
	}

	@Override
	public ArrayList<Teacher> getSupervisor(Student student) {
		// TODO Auto-generated method stub
		FYPServiceImp fypService = new FYPServiceImp();
		List<Stutopic> stutopic = fypService.getStutopicByStudent(student);
		List<TeaTopic> teaTopic = fypService.getTeaTopicByTopicId(stutopic.get(0).getTopic().getFid().toString());
		ArrayList<Teacher> supervisors=new ArrayList<Teacher>();
		for(int i = 0;i<teaTopic.size();i++){
			supervisors.add(teaTopic.get(i).getTeacher());
		}
		return supervisors;
	}

}
