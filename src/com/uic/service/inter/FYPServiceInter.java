package com.uic.service.inter;

import java.util.ArrayList;
import java.util.List;
import com.uic.domain.StuTopic;
import com.uic.domain.Student;
import com.uic.domain.TeaTopic;
import com.uic.domain.Teacher;
import com.uic.domain.Topic;

public interface FYPServiceInter extends BaseInterface{
	public boolean uploadTopic(ArrayList<Teacher> teacher, Topic topic);
	public List<TeaTopic> getTeaTopic(String teacherID);
    public List<TeaTopic> getTeaTopicByTopicId(String id);
	List<StuTopic> getStuTopicByStudent(Student student);
}
