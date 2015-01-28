package com.omg.dto;

import java.util.Date;

public class Comments {
	private int commentsNum;
	private int freeboardNum;
	private String commentsWriter;
	private String commentsWriterName;
	private String commentsContent;
	private Date commentsCredate;
	public int getCommentsNum() {
		return commentsNum;
	}
	public void setCommentsNum(int commentsNum) {
		this.commentsNum = commentsNum;
	}
	public int getFreeboardNum() {
		return freeboardNum;
	}
	public void setFreeboardNum(int freeboardNum) {
		this.freeboardNum = freeboardNum;
	}
	public String getCommentsWriter() {
		return commentsWriter;
	}
	public void setCommentsWriter(String commentsWriter) {
		this.commentsWriter = commentsWriter;
	}
	public String getCommentsContent() {
		return commentsContent;
	}
	public void setCommentsContent(String commentsContent) {
		this.commentsContent = commentsContent;
	}
	public Date getCommentsCredate() {
		return commentsCredate;
	}
	public void setCommentsCredate(Date commentsCredate) {
		this.commentsCredate = commentsCredate;
	}
	public String getCommentsWriterName() {
		return commentsWriterName;
	}
	public void setCommentsWriterName(String commentsWriterName) {
		this.commentsWriterName = commentsWriterName;
	}
	
	
}
