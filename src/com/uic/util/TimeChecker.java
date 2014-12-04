package com.uic.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.uic.domain.Time;
import com.uic.service.inter.TimeType;

public class TimeChecker {

	public static Time timeCheck() {
		// get time info from FYP-system.properties
		PropertiesHelper ph = new PropertiesHelper(
				"/WEB-INF/config/FYP-system.properties");
		Time returnTime = new Time();

		String state1 = ph.getProperties("UploadTopicsDateTimeState");
		String state2 = ph.getProperties("ChooseTopicDateTimeState");
		String state3 = ph.getProperties("ChooseExaminersDateTimeState");
		String state4 = ph.getProperties("PreDateTimeState");

		if (state1 != null) {
			String UTstartDateTime = ph
					.getProperties("UploadTopicsStartDateTime");
			String UTendDateTime = ph.getProperties("UploadTopicsEndDateTime");

			if (compareTime(UTstartDateTime)) {
				returnTime.setType(TimeType.system_close);
				return returnTime;
			} else {
				if (compareTime(UTstartDateTime, UTendDateTime)) {
					returnTime.setType(TimeType.upload_topic);
					returnTime.setStartTime(UTstartDateTime);
					returnTime.setEndTime(UTendDateTime);
					return returnTime;
				}
				if (state2 != null) {
					
					String CTstartDateTime = ph.getProperties("ChooseTopicStartDateTime");
					String CTendDateTime = ph.getProperties("ChooseTopicEndDateTime");
					
					if (compareTime(UTendDateTime, CTstartDateTime)) {
						returnTime.setType(TimeType.upload_to_topic_choose);
						returnTime.setStartTime(CTstartDateTime);
						returnTime.setEndTime(CTendDateTime);
						return returnTime;
					}
					
					else if (compareTime(CTstartDateTime, CTendDateTime)) {
						returnTime.setType(TimeType.choose_topic);
						returnTime.setStartTime(CTstartDateTime);
						returnTime.setEndTime(CTendDateTime);
						return returnTime;
					}
					
					if (state3 != null) {
						
						String CEstartDateTime = ph.getProperties("ChooseExaminersStartDateTime");
						String CEendDateTime = ph.getProperties("ChooseExaminersEndDateTime");
						
						if (compareTime(CTendDateTime, CEstartDateTime)) {
							returnTime.setType(TimeType.topic_to_examiner_choose);
							returnTime.setStartTime(CEstartDateTime);
							returnTime.setEndTime(CEendDateTime);
							return returnTime;
						}
						else if (compareTime(CEstartDateTime, CEendDateTime)) {
							returnTime.setType(TimeType.choose_examiner);
							returnTime.setStartTime(CEstartDateTime);
							returnTime.setEndTime(CEendDateTime);
							return returnTime;
						}
						if (state4 != null) {
							
							String PstartDateTime = ph.getProperties("PreStartDateTime");
							String PendDateTime = ph.getProperties("PreEndDateTime");
							
							if (compareTime(CEendDateTime, PstartDateTime)) {
								returnTime.setType(TimeType.examiner_to_pretime_choose);
								returnTime.setStartTime(PstartDateTime);
								returnTime.setEndTime(PendDateTime);
								return returnTime;
							}
							else if (compareTime(PstartDateTime, PendDateTime)) {
								returnTime.setType(TimeType.choose_pretime);
								returnTime.setStartTime(PstartDateTime);
								returnTime.setEndTime(PendDateTime);
								return returnTime;
							} else {
								returnTime.setType(TimeType.system_done);
								return returnTime;
							}
						} else {
							returnTime.setType(TimeType.examiner_after_no_pretime);
							return returnTime;
						}
					} else {
						returnTime.setType(TimeType.topic_choose_after_no_examiner);
						return returnTime;
					}
				} else {
					returnTime.setType(TimeType.upload_after_no_topic_choose);
					returnTime.setStartTime(UTstartDateTime);
					returnTime.setEndTime(UTendDateTime);
					return returnTime;
				}
			}
		} else {
			returnTime.setType(TimeType.system_close);
			return returnTime;
		}
	}

	/**
	 * 
	 * @param time1
	 * @param time2
	 * @return now time within time1 and time2 return true
	 */
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
		if (c2.before(c1) && c3.after(c1)) {
			// System.out.println("true");
			return true;
		} else {
			// System.out.println("false");
			return false;
		}
	}

	/**
	 * 
	 * @param time
	 * @return now time before time return true
	 */
	public static boolean compareTime(String time) {

		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date now = new Date();
		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();
		try {
			c1.setTime(now);
			c2.setTime(df.parse(time));

		} catch (ParseException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		if (c1.before(c2)) {
			// System.out.println("true");
			return true;
		} else {
			// System.out.println("false");
			return false;
		}
	}

}
