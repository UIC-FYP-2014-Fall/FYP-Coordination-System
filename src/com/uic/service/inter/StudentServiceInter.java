package com.uic.service.inter;

public interface StudentServiceInter {
	
	public boolean checkTopicState(String sid);
	public boolean checkExaminerState(String sid);
	public boolean checkPretimeState(String sid);

}
