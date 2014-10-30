package com.uic.service.inter;

import java.util.List;

public interface BaseInterface {
	
	public List<Object> getListObject(String hql, String[] parameters);
	
	public Object getUniqueObject(String hql, String[] parameters);
	
	public boolean saveObject(Object obj);
	
	public boolean updateObject(String hql, String[] parameters);

}
