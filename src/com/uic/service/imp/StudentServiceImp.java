package com.uic.service.imp;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.joda.time.DateTime;

import com.uic.domain.ObsTopic;
import com.uic.domain.Student;
import com.uic.domain.StuTopic;
import com.uic.domain.Stuexaminer;
import com.uic.domain.TeaTopic;
import com.uic.domain.Teacher;
import com.uic.domain.Timeslot;
import com.uic.domain.Topic;
import com.uic.service.inter.StudentServiceInter;
import com.uic.service.inter.TeachersServiceInter;
import com.uic.util.BaseUtil;
import com.uic.util.PropertiesHelper;


public class StudentServiceImp extends BaseServiceImp implements
		StudentServiceInter {

	@Override
	public boolean checkTopicState(String sid) {
		// TODO Auto-generated method stub
		boolean flag = false;
		String hql = "from StuTopic where student.sid=?";
		String[] parameters = { sid };
		try {
			Object obj = getUniqueObject(hql, parameters);
			if (obj != null) {
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
		String[] parameters = { sid };
		try {
			Object obj = getUniqueObject(hql, parameters);
			if (obj != null) {
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
		String[] parameters = { sid };
		try {
			List obj = getListObject(hql, parameters);
			if (obj.size()>0) {
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
		String hql = "select s.topic from StuTopic as s where s.student.sid=?";

		String[] parameters = { sid };
		try {
			topic = (Topic) getUniqueObject(hql, parameters);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return topic;
	}

	@Override
	public List<Teacher> getSupervisor(String sid) {
		// TODO Auto-generated method stub
		List<Teacher> list = null;
		String hql = "select t.teacher from TeaTopic as t, StuTopic as s where s.topic.fid=t.topic.fid and s.student.sid=?";
		String[] parameters = { sid };
		try {
			list = getListObject(hql, parameters);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();

		}
		return list;
	}

	@Override
	public Teacher getObserver(String sid) {
		// TODO Auto-generated method stub
		Teacher teacher = new Teacher();
		String hql = "select o.observer from ObsTopic as o, StuTopic as s where s.topic.fid=o.topic.fid and s.student.sid=?";
		String[] parameters = { sid };
		try {
			teacher = (Teacher) getUniqueObject(hql, parameters);

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
		String hql = "select s.teacher from Stuexaminer as s where s.student.sid=?";
		String[] parameters = { sid };
		try {
			teacher = (Teacher) getUniqueObject(hql, parameters);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return teacher;
	}
	public List<Stuexaminer> getExaminerByTeacherId(String teacherId) {
		// TODO Auto-generated method stub
		String hql = "from Stuexaminer where teacher_id=?";
		String[] parameters = { teacherId };
		try {
			List<Stuexaminer> stuexaminerList = getListObject(hql, parameters);
			return stuexaminerList;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		
	}




	public Student getUniqueStudent(String studentId) {
		String hql = "from Student where id=?";
		String[] parameters = { studentId };
		try {
			Student student = (Student) getUniqueObject(hql, parameters);
			return student;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public ArrayList<Student> getAllStudent() {
		String hql = "from Student";
		ArrayList<Student> studentList = new ArrayList<Student>();
		try {
			studentList = (ArrayList<Student>) getListObject(hql, null);
			return studentList;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public Teacher getObserver(Student student) {
		// TODO Auto-generated method stub
		FYPServiceImp fypService = new FYPServiceImp();
		try {
			List<StuTopic> stutopic = fypService.getStuTopicByStudent(student);
			ObsTopic obsTopic = fypService.getObsTopicByTopicId(stutopic.get(0).getTopic().getFid().toString());
			return obsTopic.getObserver();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public ArrayList<Teacher> getSupervisor(Student student) {
		// TODO Auto-generated method stub
		FYPServiceImp fypService = new FYPServiceImp();
		try {
			List<StuTopic> stutopic = fypService.getStuTopicByStudent(student);
			List<TeaTopic> teaTopic = fypService.getTeaTopicByTopicId(stutopic.get(0).getTopic().getFid().toString());
			ArrayList<Teacher> supervisors = new ArrayList<Teacher>();
			for (int i = 0; i < teaTopic.size(); i++) {
				supervisors.add(teaTopic.get(i).getTeacher());
			}
			return supervisors;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}


	public boolean checkIfStudentHasChoosedTopic(String studentId) {
		String hql = "from StuTopic where student_id=?";
		String[] parameters = { studentId };
		try {
			List stuTopic = getListObject(hql, parameters);
			if (stuTopic.size() == 0) {
				return false;
			} else {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Student getStudentById(String sid) {
		// TODO Auto-generated method stub
		Student stu = new  Student();
		String hql = "from Student where sid=?";
		String[] parameters = { sid };
		try {
			stu = (Student)getUniqueObject(hql, parameters);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return stu;
	}

	@Override
	public boolean updateExaminer(String sid, String tid) {
		// TODO Auto-generated method stub
		String hql = "update Stuexaminer set teacher_id=? where student_id=?";
		String[] parameters = { tid, sid};
		try {
			updateObject(hql, parameters);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public String getStudentPreTime(String week, String day, String time) {
		// TODO Auto-generated method stub
		//get start week date
		PropertiesHelper ph = new PropertiesHelper("/WEB-INF/config/FYP-system.properties");
		String PreStartDate = ph.getProperties("PreStartDateTime");
		//String PreEndDateTime = ph.getProperties("PreEndDateTime");
		DateTime startWeekDay=BaseUtil.getStartWeekDate(PreStartDate);
		startWeekDay = startWeekDay.plusWeeks(Integer.parseInt(week)-1);
		startWeekDay = startWeekDay.plusDays(Integer.parseInt(day)-1);
		String[] timeArray={"9:00-9:30","9:30-10:00","10:00-10:30","10:30-11:00","11:00-11:30","11:30-12:00","14:00-14:30","14:30-15:00","15:00-15:30","15:30-16:00","16:00-16:30","16:30-17:00","17:00-17:30","17:30-18:00"};
		StringBuffer returnTime= new StringBuffer();
		returnTime.append(startWeekDay.getYear()+"-");
		returnTime.append(startWeekDay.getMonthOfYear()+"-");
		returnTime.append(startWeekDay.getDayOfMonth()+ " ");
		returnTime.append(timeArray[Integer.parseInt(time)-1]);
		return returnTime.toString();
	}

	@Override
	public ArrayList<Teacher> getCanChooseExaminer(String sid) {
		// TODO Auto-generated method stub
		ArrayList<Teacher> al = new ArrayList<>();
		List<Teacher> supervisor = getSupervisor(sid);
		Teacher observer = getObserver(sid);
		Integer observerId = observer.getId();
		TeachersServiceInter teachersServiceInter = new TeachersServiceImp();
		List<Teacher> listTeacher = teachersServiceInter.getTeachers();
		
		HashMap<Integer, Teacher> hm = new HashMap<>();
		
		for (int i = 0; i < supervisor.size(); i++) {
			hm.put(supervisor.get(i).getId(), supervisor.get(i));
		}
		
		for (Teacher t : listTeacher) {
			if (hm.containsKey(t.getId())) {
				continue;
			} else if (t.getId().equals(observerId)) {
				continue;
			} else {
				if (teachersServiceInter.getWorkload(t.getId().toString()) < Integer.parseInt(t.getWorkload())){
					al.add(t);
				}
			}
		}
		
		
		return al;
	}

	@Override
	public String getPreTimeByStudentId(String sid) {
		// TODO Auto-generated method stub
		String stuTime="";		
		//Student student = getStudentById(sid);
		String hql="from Timeslot where student_id=?";
		String[] parameters={sid};
		
		List<Timeslot> tl= getListObject(hql, parameters);
		Timeslot time = new Timeslot();
		if(tl.size()>0){
			time = tl.get(0);
			stuTime=getStudentPreTime(time.getWeek(), time.getDay(), time.getTime());
		}
		//System.out.println(time.getStudent().getName());
		
		
		return stuTime;
	}

	@Override
	public boolean checkObserverState(String sid) {
		// TODO Auto-generated method stub
		boolean flag = false;
		String hql = "select o.observer from ObsTopic as o, StuTopic as s where s.topic.fid=o.topic.fid and s.student.sid=?";
		String[] parameters = { sid };
		try {
			Object obj = getUniqueObject(hql, parameters);
			if (obj != null) {
				flag = true;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return flag;
	}

}
