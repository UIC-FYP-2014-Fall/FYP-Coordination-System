package com.uic.test;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class testTime {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String time1 = "2014-12-1 09:00:00";
		String time2 = "2014-12-3 18:00:00";
		if(compareTime(time1, time2)){
			System.out.println("true");
		}else{
			System.out.println("false");
		}

	}
	
	public static boolean compareTime(String time1, String time2) {

		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date now = new Date();
		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();
		Calendar c3 = Calendar.getInstance();
		try {
			c1.setTime(now);
			c2.setTime(df.parse(time1));
			c3.setTime(df.parse(time2));

		} catch (ParseException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		if (c2.before(c1)&& c3.after(c1)) {
			System.out.println("true");
			return true;
		} else {
			System.out.println("false");
			return false;
		}
	}

}
