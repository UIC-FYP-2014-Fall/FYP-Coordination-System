package com.uic.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class SystemUtil {
	/**
	 * @author Sam
	 * @description load FYP system configuration properties
	 * @category Util
	 * @
	 */
	
	private static InputStream fis = null;
	private static String password = "";
	static{
		Properties pp = new Properties();
		try {
			fis=SystemUtil.class.getClassLoader().getResourceAsStream("FYP-system.properties");
			pp.load(fis);
			password = pp.getProperty("DefaultTeacherPassword");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public static String getDefaultTeacherPassword(){
		return password;
	}
	

}
