package com.uic.domain;

/**
 * Gradelevel entity. @author MyEclipse Persistence Tools
 */

public class Gradelevel implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String gradeLevel;
	private Short percent;

	// Constructors

	/** default constructor */
	public Gradelevel() {
	}

	/** minimal constructor */
	public Gradelevel(String gradeLevel) {
		this.gradeLevel = gradeLevel;
	}

	/** full constructor */
	public Gradelevel(String gradeLevel, Short percent) {
		this.gradeLevel = gradeLevel;
		this.percent = percent;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getGradeLevel() {
		return this.gradeLevel;
	}

	public void setGradeLevel(String gradeLevel) {
		this.gradeLevel = gradeLevel;
	}

	public Short getPercent() {
		return this.percent;
	}

	public void setPercent(Short percent) {
		this.percent = percent;
	}

}