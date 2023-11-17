package com.spring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.noticeDTO;

@Mapper
public interface noticeDAO {
	
	public void noticeInsert(noticeDTO dto);

	public List<noticeDTO> noticeList(noticeDTO dto);

	public int noticeCount(noticeDTO dto);

	public void deleteNotice(String[] delData);

	
}
