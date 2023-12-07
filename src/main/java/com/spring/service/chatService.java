package com.spring.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.chatDAO;
import com.spring.dto.chatDTO;
import com.spring.dto.chatList;

@Service
public class chatService {
	
	private static final Logger logger = LoggerFactory.getLogger(chatService.class);
	
	@Autowired
<<<<<<< HEAD
	chatDAO dao;
	

	public List<chatDTO> chatList(chatDTO dto) {
		List<chatDTO> chatList = dao.chatList(dto);
		logger.info("chatService의 chatList()");
//		System.out.println(chatList);
		return chatList;
	}
=======
	private chatDAO dao;
>>>>>>> 1767c68b4d55deb42bf382b31ea9e065f6b4b58d
	
	public boolean insertChat(chatDTO chat) {
		
		logger.info("chatService의 insertChat()");
		return dao.insertChat(chat);
	}
<<<<<<< HEAD
=======

	public List<chatList> chatList(String id) {
		
		logger.info("chatService의 chatList()");
		return dao.chatList(id);
	}
>>>>>>> 1767c68b4d55deb42bf382b31ea9e065f6b4b58d
	
}
