package com.uic.domain;

/**
 * Stutopic entity. @author MyEclipse Persistence Tools
 */

public class Stutopic implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;
	private Student student;
	private Topic topic;

	// Constructors

	/** default constructor */
	public Stutopic() {
	}

	/** full constructor */
	public Stutopic(Student student, Topic topic) {
		this.student = student;
		this.topic = topic;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Student getStudent() {
		return this.student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Topic getTopic() {
		return this.topic;
	}

	public void setTopic(Topic topic) {
		this.topic = topic;
	}

}