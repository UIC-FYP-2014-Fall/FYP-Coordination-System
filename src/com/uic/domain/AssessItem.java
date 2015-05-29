package com.uic.domain;

import java.sql.Timestamp;

/**
 * Assessitem entity. @author MyEclipse Persistence Tools
 */

public class AssessItem implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String name;
	private Short percent;
	private String supervisor;
	private String observer;
	private String examiner;
	private String grade;
	private float score;

	// Constructors

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public float getScore() {
		return score;
	}

	public void setScore(float score) {
		this.score = score;
	}

	/** default constructor */
	public AssessItem() {
	}

	/** full constructor */
	public AssessItem(String name, Short percent, String supervisor,
			String observer, String examiner, Timestamp insertDate,
			Timestamp updateDate) {
		this.name = name;
		this.percent = percent;
		this.supervisor = supervisor;
		this.observer = observer;
		this.examiner = examiner;

	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Short getPercent() {
		return this.percent;
	}

	public void setPercent(Short percent) {
		this.percent = percent;
	}

	public String getSupervisor() {
		return this.supervisor;
	}

	public void setSupervisor(String supervisor) {
		this.supervisor = supervisor;
	}

	public String getObserver() {
		return this.observer;
	}

	public void setObserver(String observer) {
		this.observer = observer;
	}

	public String getExaminer() {
		return this.examiner;
	}

	public void setExaminer(String examiner) {
		this.examiner = examiner;
	}

}