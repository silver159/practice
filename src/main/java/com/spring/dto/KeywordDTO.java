package com.spring.dto;


public class KeywordDTO extends CarInfoDTO {
	
	private int keyword_idx;
	private int name;
	
	public int getKeyword_idx() {
		return keyword_idx;
	}
	public void setKeyword_idx(int keyword_idx) {
		this.keyword_idx = keyword_idx;
	}
	public int getName() {
		return name;
	}
	public void setName(int name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "KeywordDTO [keyword_idx=" + keyword_idx + ", name=" + name + "]";
	}
	
	
}
