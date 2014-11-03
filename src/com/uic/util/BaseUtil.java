package com.uic.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class BaseUtil {
	
	/**
	 * @author Sam
	 * @description input string convert to java.util.date
	 * @param dateStr
	 * @return java.util.date
	 */
	public static java.util.Date StringConvertDate(String dateStr){
		Date date = new Date();
		DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			date = sdf.parse(dateStr);
			//System.out.println(date.toString());
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException(e.getMessage());
		}
		return date;
	}

}
