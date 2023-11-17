package com.spring.dto;

import java.sql.Date;

public class questionDTO {
	
	private int idx;
	private String type;
	private String title;
	private String contents;
	private String userid;
	private String answer;
	private Date regdate;
	private Date updatedate;
	
	private int currentPage;
	
	private String name;
	private String email;
	private String phone;
	
	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
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

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "questionDTO [idx=" + idx + ", type=" + type + ", title=" + title + ", contents=" + contents
				+ ", userid=" + userid + ", answer=" + answer + ", regdate=" + regdate + ", updatedate=" + updatedate
				+ ", currentPage=" + currentPage + ", name=" + name + ", email=" + email + ", phone=" + phone + "]";
	}
	
 	public String queryString() {
		StringBuilder sb = new StringBuilder();
		if (userid != null) {
			sb.append("&userid=" + userid);
		}
		return sb.toString();
	}
}
