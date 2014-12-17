package com.uic.domain;

public class TeacherState {
	
	private Integer tid;
	private String name;
	private String email;
	private String state;
	private Integer numOfsupervisor;
	private Integer numOfobserver;
	private String workload;
	
	
	public String getWorkload() {
		return workload;
	}
	public void setWorkload(String workload) {
		this.workload = workload;
	}
	public Integer getNumOfsupervisor() {
		return numOfsupervisor;
	}
	public void setNumOfsupervisor(Integer numOfsupervisor) {
		this.numOfsupervisor = numOfsupervisor;
	}
	public Integer getNumOfobserver() {
		return numOfobserver;
	}
	public void setNumOfobserver(Integer numOfobserver) {
		this.numOfobserver = numOfobserver;
	}
	public Integer getTid() {
		return tid;
	}
	public void setTid(Integer tid) {
		this.tid = tid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}

}
