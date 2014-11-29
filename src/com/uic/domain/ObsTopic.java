package com.uic.domain;

import java.io.Serializable;

public class ObsTopic implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Teacher observer;
	private Topic topic;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Teacher getObserver() {
		return observer;
	}
	public void setObserver(Teacher observer) {
		this.observer = observer;
	}
	public Topic getTopic() {
		return topic;
	}
	public void setTopic(Topic topic) {
		this.topic = topic;
	}
	

}
