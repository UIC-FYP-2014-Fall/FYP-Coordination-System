package com.uic.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import org.joda.time.DateTime;
import org.joda.time.Weeks;

public class BaseUtil {
	
	/**
	 * @author Sam
	 * @description input string convert to java.util.date
	 * @param dateStr
	 * @return java.util.date
	 */
	public static Date StringConvertDate(String dateStr){
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
	/**
	 * Returns a string of non-repetition.
	 * @return 
	 */
	public static String uuid() {
		return UUID.randomUUID().toString().replace("-", "").toUpperCase();
	}
	
	public static boolean todayIsInPeriod(String startTime,String endTime){
		Date curDate=new Date();
		Date startDate= BaseUtil.StringConvertDate(startTime);
		Date endDate = BaseUtil.StringConvertDate(endTime);
		if(curDate.after(startDate)&&curDate.before(endDate)){
			return true;
		}else{
			return false;
		}
	}
	
	public static boolean todayIsAfter(String time){
		Date curDate=new Date();
		Date dateTime= BaseUtil.StringConvertDate(time);
		if(curDate.after(dateTime)){
			return true;
		}else{
			return false;
		}
	}
	
	public static boolean todayIsBefore(String time){
		Date curDate=new Date();
		Date dateTime= BaseUtil.StringConvertDate(time);
		if(curDate.before(dateTime)){
			return true;
		}else{
			return false;
		}
	}
	
	public static String getNumOfWeekBetweenTwoDate(String startTime,String endTime){
		Date startDate=StringConvertDate(startTime);
		Date endDate=StringConvertDate(endTime);
		DateTime start = new DateTime(startDate);
	    DateTime end = new DateTime(endDate);
	    DateTime finalStart = start.dayOfWeek().withMinimumValue();
	    DateTime finalEnd   = end.dayOfWeek().withMaximumValue(); 
		int weeks = Weeks.weeksBetween(finalStart, finalEnd).getWeeks();
		return String.valueOf(weeks+1);
	}
	
	public static String getDayOfWeek(String date){
		Date d = StringConvertDate(date);
		DateTime dt=new DateTime(d);
		return String.valueOf(dt.getDayOfWeek());
	}
	
	public static ArrayList<String> getEveryWeekStartAndEndDay(String startTime, String endTime){
		ArrayList<String> timeTableTime = new ArrayList<String>();
		Date startDate=StringConvertDate(startTime);
		DateTime start = new DateTime(startDate);
	    start = start.dayOfWeek().withMinimumValue();
	    DateTime end=start.dayOfWeek().withMaximumValue();
	    SimpleDateFormat sdf = new SimpleDateFormat("MM.dd");
	    String numOfWeek=getNumOfWeekBetweenTwoDate(startTime,endTime);
	    for(int i =0;i<Integer.parseInt(numOfWeek);i++){
	    	String str1 = sdf.format(start.toDate());
	    	String str2 = sdf.format(end.toDate());
	    	timeTableTime.add(str1+" - "+str2);
	    	start = start.plusWeeks(1);
	    	start = start.dayOfWeek().withMinimumValue();
		    end=start.dayOfWeek().withMaximumValue();
	    }
		return timeTableTime;
	}
	
	public static DateTime getStartWeekDate(String time){
		Date startDate=StringConvertDate(time);
		DateTime startWeekDate = new DateTime(startDate);
		startWeekDate = startWeekDate.dayOfWeek().withMinimumValue();
		return startWeekDate;
	}
}
