package com.uic.domain;

import java.util.Set;

/**
 * Student entity. @author MyEclipse Persistence Tools
 */

public class Student implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String sid;
	private String password;
	private String name;
	private String email;
	private String telephone;
	private String sex;
	private String program;

	private Set<Timeslot> timeslot;
	private Set<StuTopic> stuTopic;
	private Set<Stuexaminer> stuExaminer;
	private Set<StudentGrade> studentGrade;
	// Constructors

	public Set<StudentGrade> getStudentGrade() {
		return studentGrade;
	}

	public void setStudentGrade(Set<StudentGrade> studentGrade) {
		this.studentGrade = studentGrade;
	}

	public Set<Stuexaminer> getStuExaminer() {
		return stuExaminer;
	}

	public void setStuExaminer(Set<Stuexaminer> stuExaminer) {
		this.stuExaminer = stuExaminer;
	}

	public Set<StuTopic> getStuTopic() {
		return stuTopic;
	}

	public void setStuTopic(Set<StuTopic> stuTopic) {
		this.stuTopic = stuTopic;
	}

	public Set<Timeslot> getTimeslot() {
		return timeslot;
	}

	public void setTimeslot(Set<Timeslot> timeslot) {
		this.timeslot = timeslot;
	}

	/** default constructor */
	public Student() {
	}

	/** full constructor */
	public Student(String sid, String password, String name, String email,
			String telephone, String sex, String program) {
		this.sid = sid;
		this.password = password;
		this.name = name;
		this.email = email;
		this.telephone = telephone;
		this.sex = sex;
		this.program = program;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getSid() {
		return this.sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelephone() {
		return this.telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getProgram() {
		return this.program;
	}

	public void setProgram(String program) {
		this.program = program;
	}

}