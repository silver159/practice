package com.spring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.chatDTO;
import com.spring.dto.chatList;

@Mapper
public interface chatDAO {
	
<<<<<<< HEAD
	boolean insertChat(chatDTO chat);

	List<chatDTO> chatList(chatDTO dto);
=======
	List<chatList> chatList(String id);

	boolean insertChat(chatDTO chat);
>>>>>>> 1767c68b4d55deb42bf382b31ea9e065f6b4b58d
	
}
