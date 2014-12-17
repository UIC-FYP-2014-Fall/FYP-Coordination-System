package com.uic.domain;

import java.util.Set;

/**
 * Teacher entity. @author MyEclipse Persistence Tools
 */

public class Teacher implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String account;
	private String password;
	private String name;
	private String email;
	private String phone;
	private String quota;
	private String workload;

	private Set<TeaTopic> teaTopic;
	private Set<ObsTopic> obsTopic;
	private Set<Timeslot> timeslot;
	private Set<Stuexaminer> stuExaminer;

	// Constructors

	public Set<Stuexaminer> getStuExaminer() {
		return stuExaminer;
	}

	public void setStuExaminer(Set<Stuexaminer> stuExaminer) {
		this.stuExaminer = stuExaminer;
	}

	public String getWorkload() {
		return workload;
	}

	public Set<Timeslot> getTimeslot() {
		return timeslot;
	}

	public void setTimeslot(Set<Timeslot> timeslot) {
		this.timeslot = timeslot;
	}

	public Set<ObsTopic> getObsTopic() {
		return obsTopic;
	}

	public void setObsTopic(Set<ObsTopic> obsTopic) {
		this.obsTopic = obsTopic;
	}

	public void setWorkload(String workload) {
		this.workload = workload;
	}

	public String getQuota() {
		return quota;
	}

	public void setQuota(String quota) {
		this.quota = quota;
	}

	public Set<TeaTopic> getTeaTopic() {
		return teaTopic;
	}

	public void setTeaTopic(Set<TeaTopic> teaTopic) {
		this.teaTopic = teaTopic;
	}

	/** default constructor */
	public Teacher() {
	}

	/** full constructor */
	/*
	 * public Teacher(String account, String password, String name, String
	 * email, String phone) { this.account = account; this.password = password;
	 * this.name = name; this.email = email; this.phone = phone; }
	 */

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAccount() {
		return this.account;
	}

	public void setAccount(String account) {
		this.account = account;
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

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

}