package com.omg.dto;

import java.sql.Date;

public class FreeBoard {
	private int freeboardNum;
	private String title;
	private String content;
	private String writer;
	private Date credate;
	private String writerName;
	private int count;//조회수

	public int getFreeboardNum() {
		return freeboardNum;
	}

	public void setFreeboardNum(int freeboardNum) {
		this.freeboardNum = freeboardNum;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}


	

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getWriterName() {
		return writerName;
	}

	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}

	public Date getCredate() {
		return credate;
	}

	public void setCredate(Date credate) {
		this.credate = credate;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
}
