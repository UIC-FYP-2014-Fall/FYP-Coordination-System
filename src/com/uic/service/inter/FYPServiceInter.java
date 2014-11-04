package com.uic.service.inter;

import java.util.List;

import com.uic.domain.Student;
import com.uic.domain.Teacher;
import com.uic.domain.Topic;

public interface FYPServiceInter extends BaseInterface{
	public List<Topic> getTopic(String teacherName);
	public boolean uploadTopic(Topic topic,Teacher teacher, Student student);
}
