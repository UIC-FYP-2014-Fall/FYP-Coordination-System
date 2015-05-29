package com.uic.domain;
public class StudentGrade implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String totalScore;
	private Student student;
	private String supervisorGrade;
	private String observerGrade;
	private String examinerGrade;
	
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
