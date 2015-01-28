package com.omg.dto;

import java.sql.Date;

public class Studys {
	
	private int studyNum;
	private String studyName;
	private int memberCnt;
	private String writer;
	private String studyday;
	 
	private String userId;
	private String employeeId;
	private String name;
	private String teamName;
	private String departmentName;
	
	private int joincnt;
	private int insert_ck;
	
	private Date supplydate;
	private Date startDate;
	
	private String techName;
	
 
	
	
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public String getTechName() {
		return techName;
	}
	public void setTechName(String techName) {
		this.techName = techName;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getSupplydate() {
		return supplydate;
	}
	public void setSupplydate(Date supplydate) {
		this.supplydate = supplydate;
	}
	public int getInsert_ck() {
		return insert_ck;
	}
	public void setInsert_ck(int insert_ck) {
		this.insert_ck = insert_ck;
	}
	public int getJoincnt() {
		return joincnt;
	}
	public void setJoincnt(int joincnt) {
		this.joincnt = joincnt;
	}
	public String getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getStudyNum() {
		return studyNum;
	}
	public void setStudyNum(int studyNum) {
		this.studyNum = studyNum;
	}
	public String getStudyName() {
		return studyName;
	}
	public void setStudyName(String studyName) {
		this.studyName = studyName;
	}
	public int getMemberCnt() {
		return memberCnt;
	}
	public void setMemberCnt(int memberCnt) {
		this.memberCnt = memberCnt;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getStudyday() {
		return studyday;
	}
	public void setStudyday(String studyday) {
		this.studyday = studyday;
	}
	

	
}
