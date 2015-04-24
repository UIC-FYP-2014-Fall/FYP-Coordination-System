package com.uic.service.inter;

public interface TimeType {
/**
 * define the system time distribution
 */
	String system_close = "0";
	//String upload_topic = "1";
	String view_topic = "2"; // need start and end time
	String choose_topic = "3";
	String topic_to_examiner_choose = "4"; // need start and end time
	String choose_examiner = "5";
	String examiner_to_pretime_choose = "6"; // need start and end time
	String choose_pretime = "7";
	String system_done = "8";
	//String upload_after_no_topic_choose = "9";
	String topic_choose_after_no_examiner = "10";
	String examiner_after_no_pretime = "11";

}
