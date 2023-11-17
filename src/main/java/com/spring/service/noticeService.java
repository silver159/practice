package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dto.noticeDTO;
import com.spring.dao.noticeDAO;

@Service
public class noticeService {
	
	@Autowired
	noticeDAO dao;
	
	public void noticeInsert(noticeDTO dto) {
		System.out.println(dto+"뀨");// 필수로 체크 데이터 잘넘어가는지 
		dao.noticeInsert(dto);
	}

	public List<noticeDTO> noticeList(noticeDTO dto) {
		List<noticeDTO> noticeList = dao.noticeList(dto);
		return noticeList;
	}
	public int noticeCount(noticeDTO dto) {
		int noticeCount = dao.noticeCount(dto);
		return noticeCount;
	}

	public void deleteNotice(String[] delData) {
		dao.deleteNotice(delData);
	}

}
