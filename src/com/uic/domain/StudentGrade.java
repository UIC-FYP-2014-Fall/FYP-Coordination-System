package com.uic.domain;

public class StudentGrade implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String totalScore;
	private String totalLetterGrade;
	private Student student;
	private AssessItem assessItemGrade;
	private String supervisorGrade;
	private String observerGrade;
	private String examinerGrade;
	private String averageGrade;

	public String getAverageGrade() {
		return averageGrade;
	}

	public void setAverageGrade(String averageGrade) {
		this.averageGrade = averageGrade;
	}

	public AssessItem getAssessItemGrade() {
		return assessItemGrade;
	}

	public void setAssessItemGrade(AssessItem assessItemGrade) {
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
