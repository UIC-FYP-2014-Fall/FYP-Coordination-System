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
	private String grade;
	private AssessItem assessItemGrade;
	
	

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

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

}
