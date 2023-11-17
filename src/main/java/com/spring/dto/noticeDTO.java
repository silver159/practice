package com.spring.dto;

import java.sql.Date;


public class noticeDTO {
	
	private int idx;
	private String name;
	private String subject;
	private String contents;
	private Date regdate;
	private Date updatedate;
	private int hit;
	
	private int currentPage;

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public Date getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	@Override
	public String toString() {
		return "noticeDTO [idx=" + idx + ", name=" + name + ", subject=" + subject + ", contents=" + contents
				+ ", regdate=" + regdate + ", updatedate=" + updatedate + ", hit=" + hit + ", currentPage="
				+ currentPage + "]";
	}

	   public String queryString() {
		      StringBuilder sb = new StringBuilder();
		      
		      
		      if (name != null) {
		         sb.append("&name=" + name);
		      }
		      
		      if (subject != null) {
		         sb.append("&subject=" + subject);
		      }
		      
		      return sb.toString();
		   }

}
