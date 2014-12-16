package com.uic.domain;

import java.util.Set;



/**
 * Topic entity. @author MyEclipse Persistence Tools
 */

public class Topic implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer fid;
	private String title;
	private Integer credit;
	private Boolean individual;
	private Integer numOfStudent;
	private String description;
	private Boolean isfull;
	public Boolean getIsfull() {
		return isfull;
	}

	public void setIsfull(Boolean isfull) {
		this.isfull = isfull;
	}

	private Set<TeaTopic> teaTopic;
	private Set<ObsTopic> obsTopic;
	private Set<StuTopic> stuTopic;
	// Constructors


	public Set<ObsTopic> getObsTopic() {
		return obsTopic;
	}

	public void setObsTopic(Set<ObsTopic> obsTopic) {
		this.obsTopic = obsTopic;
	}

	/** default constructor */
	public Topic() {
	}

	/** full constructor */
	public Topic(String title, Integer credit, Boolean individual,
			Integer numOfStudent, String description) {
		this.title = title;
		this.credit = credit;
		this.individual = individual;
		this.numOfStudent = numOfStudent;
		this.description = description;
	}

	// Property accessors

	public Set<TeaTopic> getTeaTopic() {
		return teaTopic;
	}

	public void setTeaTopic(Set<TeaTopic> teaTopic) {
		this.teaTopic = teaTopic;
	}

	public Integer getFid() {
		return this.fid;
	}

	public void setFid(Integer fid) {
		this.fid = fid;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getCredit() {
		return this.credit;
	}

	public void setCredit(Integer credit) {
		this.credit = credit;
	}

	public Boolean getIndividual() {
		return this.individual;
	}

	public void setIndividual(Boolean individual) {
		this.individual = individual;
	}

	public Integer getNumOfStudent() {
		return this.numOfStudent;
	}

	public void setNumOfStudent(Integer numOfStudent) {
		this.numOfStudent = numOfStudent;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}