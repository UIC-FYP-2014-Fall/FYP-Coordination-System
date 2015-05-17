package com.uic.service.inter;

import java.util.List;

import com.uic.domain.Gradelevel;
import com.uic.web.struts.form.GradeLevelForm;


public interface GradeLevelServiceInter extends BaseInterface{
	
	public List<Gradelevel> getGradeLevels();
	
	public boolean updateGradeLevel(String id, String percent);
	//public boolean updateGradeLevel(GradeLevelForm gradeLevelForm);
	

}
