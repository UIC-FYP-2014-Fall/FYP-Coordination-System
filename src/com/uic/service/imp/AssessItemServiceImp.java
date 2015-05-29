package com.uic.service.imp;

import java.util.List;

import com.uic.domain.AssessItem;
import com.uic.service.inter.AssessItemServiceInter;
import com.uic.util.HibernateUtil;
import com.uic.web.struts.form.AssessItemForm;

public class AssessItemServiceImp extends BaseServiceImp implements AssessItemServiceInter {

	@Override
	public boolean validateAssessItemForm(AssessItemForm assessItemForm) {
		// TODO Auto-generated method stub
		// get data
		String assessName = assessItemForm.getAssessName();
		short percent = assessItemForm.getPercentage();
		String[] teacherType = assessItemForm.getTeacherType();
		
		//System.out.println(assessName);
		//System.out.println(percent);
		//System.out.println(teacherType.length);
		// 1. check whether is null data and data type is correct
		// 2. check assess name exist
		if (!assessName.trim().equals("") && checkAssessName(assessName)) {
			//System.out.println("Ok 1!");
			// 3. check percentage
			if (percent > 0 && percent < 100 && teacherType!=null) {
				//System.out.println("Ok 2!");					
					for (int i = 0; i < teacherType.length; i++) {
						//System.out.println(teacherType[i]);
						if (!teacherType[i].equals("supervisor")&&!teacherType[i].equals("examiner")&&!teacherType[i].equals("observer")) {
							return false;
						}
					}
					return true;
			} else {
				return false;
			}
		}
		return false;
	}
	
	public boolean validateUpdateAssessItemForm(AssessItemForm assessItemForm) {
		// TODO Auto-generated method stub
		// get data
		short percent = assessItemForm.getPercentage();
		String[] teacherType = assessItemForm.getTeacherType();
		
		// check percentage
		if (percent > 0 && percent < 100) {
			// System.out.println("Ok 2!");
			if (teacherType!=null) {
				for (int i = 0; i < teacherType.length; i++) {
					// System.out.println(teacherType[i]);
					if (!teacherType[i].equals("supervisor")
							&& !teacherType[i].equals("examiner")
							&& !teacherType[i].equals("observer")) {
						return false;
					}
				}
				return true;
			} else {
				return false;
			}

		} else {
			return false;
		}
	}

	/**
	 * check assess name
	 * 
	 * @param name
	 * @return true name isn't exist
	 */
	private boolean checkAssessName(String name) {
		boolean flag = false;
		String hql = "from AssessItem where name=?";
		String[] parameters = { name };
		try {
			Object obj = getUniqueObject(hql, parameters);
			if (obj == null) {
				flag = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		//System.out.println(flag);
		return flag;
	}

	@Override
	public List<AssessItem> getAssessItems() {
		// TODO Auto-generated method stub
		String hql = "from AssessItem order by name";
		try{
			List<AssessItem> list = getListObject(hql, null);
			return list;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}

	
	@Override
	public List<AssessItem> getAssessItems(String role) {
		// TODO Auto-generated method stub
		String hql=null;
		if(role.equals("supervisor")){
			hql = "from AssessItem where supervisor=1 order by name";
		}else if(role.equals("observer")){
			hql = "from AssessItem where observer=1 order by name";
		}else if(role.equals("examiner")){
			hql = "from AssessItem where examiner=1 order by name";
		}
		try{
			List<AssessItem> list = getListObject(hql, null);
			return list;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}

	}
	
	
	@Override
	public boolean deleteAssessItem(String assessItemId) {
		// TODO Auto-generated method stub
		String hql = "delete AssessItem where id=?";
		String[] parameters={assessItemId};
		try {
			HibernateUtil.executeUpdateOpenInView(hql, parameters);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	@Override
	public boolean updateAssessItem(AssessItemForm assessItemForm) {
		// TODO Auto-generated method stub
		String id = assessItemForm.getAssessId();
		String percent = assessItemForm.getPercentage()+"";
		String[] teacherType = assessItemForm.getTeacherType();
		
		String supervisor="0";
		String observer="0";
		String examiner="0";
		
		for(int i=0;i<teacherType.length;i++){
			if(teacherType[i].equals("supervisor")){
				supervisor="1";
			}
			
			if(teacherType[i].equals("examiner")){
				examiner="1";
			}
			
			if(teacherType[i].equals("observer")){
				observer="1";
			}
		}
		
		String hql = "update AssessItem set percent=?,supervisor=?,observer=?,examiner=? where id=?";
		String[] parameters={percent,supervisor,observer,examiner,id};
		try {
			HibernateUtil.executeUpdateOpenInView(hql, parameters);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	@Override
	public int totalPercent() {
		// TODO Auto-generated method stub
		int res = 0;
		String hql = "select sum(percent) from AssessItem";
		try{
			res = new Long((long)getUniqueObject(hql, null)).intValue();
		}catch(Exception e){
			e.printStackTrace();
		}
		return res;
	}

	

}
