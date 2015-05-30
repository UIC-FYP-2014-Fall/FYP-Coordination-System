package com.uic.domain;

import java.util.List;

public class StudentGrade implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String totalScore;
	private String totalLetterGrade;
	private Student student;
	private List<AssessItem> assessItemGrade;
	private List<AssessItem> assessItem;
	private String supervisorGrade;
	private String observerGrade;
	private String examinerGrade;
	private String averageGrade;

	public List<AssessItem> getAssessItem() {
		return assessItem;
	}

	public void setAssessItem(List<AssessItem> assessItem) {
		this.assessItem = assessItem;
	}

	public String getAverageGrade() {
		return averageGrade;
	}

	public void setAverageGrade(String averageGrade) {
		this.averageGrade = averageGrade;
	}

	public List<AssessItem> getAssessItemGrade() {
		return assessItemGrade;
	}

	public void setAssessItemGrade(List<AssessItem> assessItemGrade) {
		this.assessItemGrade = assessItemGrade;
	}

	public String getTotalLetterGrade() {
		return totalLetterGrade;
	}

	public void setTotalLetterGrade(String totalLetterGrade) {
		this.totalLetterGrade = totalLetterGrade;
	}

	public String getSupervisorGrade() {
		return supervisorGrade;
	}

	public void setSupervisorGrade(String supervisorGrade) {
		this.supervisorGrade = supervisorGrade;
	}

	public String getObserverGrade() {
		return observerGrade;
	}

	public void setObserverGrade(String observerGrade) {
		this.observerGrade = observerGrade;
	}

	public String getExaminerGrade() {
		return examinerGrade;
	}

	public void setExaminerGrade(String examinerGrade) {
		this.examinerGrade = examinerGrade;
	}

	public String getTotalScore() {
		return totalScore;
	}

	public void setTotalScore(String totalScore) {
		this.totalScore = totalScore;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;

	}

}
