package com.spring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.chatDTO;
import com.spring.dto.chatList;

@Mapper
public interface chatDAO {
	
	List<chatList> chatList(String id);

	boolean insertChat(chatDTO chat);
	
}
