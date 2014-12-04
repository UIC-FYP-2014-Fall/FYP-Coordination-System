package com.uic.domain;

/**
 * Stuexaminer entity. @author MyEclipse Persistence Tools
 */

public class Stuexaminer implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private Student student;
	private Teacher teacher;

	// Constructors

	/** default constructor */
	public Stuexaminer() {
	}

	/** full constructor */
	public Stuexaminer(Student student, Teacher teacher) {
		this.student = student;
		this.teacher = teacher;
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

	public Teacher getTeacher() {
		return this.teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

}