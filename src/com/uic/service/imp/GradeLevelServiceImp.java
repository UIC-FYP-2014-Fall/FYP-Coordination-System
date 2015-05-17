package com.uic.service.imp;

import java.util.List;

import com.uic.domain.Gradelevel;
import com.uic.service.inter.GradeLevelServiceInter;
import com.uic.util.HibernateUtil;

public class GradeLevelServiceImp extends BaseServiceImp implements GradeLevelServiceInter{

	@Override
	public List<Gradelevel> getGradeLevels() {
		// TODO Auto-generated method stub
		if(!validateGradeLevelCount()){
			initGradeLevel();
		}
		String hql = "from Gradelevel";
		try{
			List<Gradelevel> list = getListObject(hql, null);
			return list;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 
	 * @return
	 */
	private boolean validateGradeLevelCount(){
		boolean flag = false;
		String hql = "select count(*) from Gradelevel";
		int res = new Long((long)getUniqueObject(hql, null)).intValue();
		if(res!=0){
			flag=true;
		}
		return flag;
	}
	
	private boolean initGradeLevel(){
		String[] gradelevel = {"A","A-","B+","B","B-","C+","C","C-","D","E","F"};
		for(int i=0;i<gradelevel.length;i++){
			Gradelevel grade = new Gradelevel();
			grade.setGradeLevel(gradelevel[i]);
			grade.setPercent((short)0);
			try {
				saveObject(grade);
			} catch (Exception e) {
				// TODO: handle exception
				return false;
			}
		}
		return true;
	}

	@Override
	public boolean updateGradeLevel(String id, String percent) {
		// TODO Auto-generated method stub
		String hql = "update Gradelevel set percent=? where id=?";
		String[] parameters={percent,id};
		try {
			HibernateUtil.executeUpdateOpenInView(hql, parameters);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}
	
	

}
