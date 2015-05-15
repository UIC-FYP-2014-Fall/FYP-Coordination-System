package com.uic.service.inter;

import java.util.List;

import com.uic.domain.AssessItem;
import com.uic.web.struts.form.AssessItemForm;


public interface AssessItemServiceInter extends BaseInterface {
	
	public boolean validateAssessItemForm(AssessItemForm assessItemForm);
	public boolean validateUpdateAssessItemForm(AssessItemForm assessItemForm);
	
	public boolean updateAssessItem(AssessItemForm assessItemForm);
	
	public List<AssessItem> getAssessItems();
	
	public boolean deleteAssessItem(String assessItemId);
	
	public int totalPercent();

}
