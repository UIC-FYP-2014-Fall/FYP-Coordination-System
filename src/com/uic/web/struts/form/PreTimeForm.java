/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.uic.web.struts.form;

import org.apache.struts.action.ActionForm;

/**
 * MyEclipse Struts Creation date: 10-31-2014
 * 
 * XDoclet definition:
 * 
 * @struts.form name="preTimeForm"
 */
public class PreTimeForm extends ActionForm {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String startDate;
	private String startTime;
	private String endDate;
	private String endTime;

	private String CT_startDate;
	private String CT_startTime;
	private String CT_endDate;
	private String CT_endTime;
	
	private String CE_startDate;
	private String CE_startTime;
	private String CE_endDate;
	private String CE_endTime;
	
	private String CP_startDate;
	private String CP_startTime;
	private String CP_endDate;
	private String CP_endTime;
	
	
	
	

	public String getCP_startDate() {
		return CP_startDate;
	}

	public void setCP_startDate(String cP_startDate) {
		CP_startDate = cP_startDate;
	}

	public String getCP_startTime() {
		return CP_startTime;
	}

	public void setCP_startTime(String cP_startTime) {
		CP_startTime = cP_startTime;
	}

	public String getCP_endDate() {
		return CP_endDate;
	}

	public void setCP_endDate(String cP_endDate) {
		CP_endDate = cP_endDate;
	}

	public String getCP_endTime() {
		return CP_endTime;
	}

	public void setCP_endTime(String cP_endTime) {
		CP_endTime = cP_endTime;
	}

	public String getCE_startDate() {
		return CE_startDate;
	}

	public void setCE_startDate(String cE_startDate) {
		CE_startDate = cE_startDate;
	}

	public String getCE_startTime() {
		return CE_startTime;
	}

	public void setCE_startTime(String cE_startTime) {
		CE_startTime = cE_startTime;
	}

	public String getCE_endDate() {
		return CE_endDate;
	}

	public void setCE_endDate(String cE_endDate) {
		CE_endDate = cE_endDate;
	}

	public String getCE_endTime() {
		return CE_endTime;
	}

	public void setCE_endTime(String cE_endTime) {
		CE_endTime = cE_endTime;
	}

	public String getCT_startDate() {
		return CT_startDate;
	}

	public void setCT_startDate(String cT_startDate) {
		CT_startDate = cT_startDate;
	}

	public String getCT_startTime() {
		return CT_startTime;
	}

	public void setCT_startTime(String cT_startTime) {
		CT_startTime = cT_startTime;
	}

	public String getCT_endDate() {
		return CT_endDate;
	}

	public void setCT_endDate(String cT_endDate) {
		CT_endDate = cT_endDate;
	}

	public String getCT_endTime() {
		return CT_endTime;
	}

	public void setCT_endTime(String cT_endTime) {
		CT_endTime = cT_endTime;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

}