package com.spring.webSocket;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.spring.dto.chatList;
import com.spring.service.chatService;

@Controller
public class WebSocketController {
	
	private static final Logger logger = LoggerFactory.getLogger(WebSocketController.class);
	
	@Autowired
	public chatService service;
	
	// 채팅방 메시지 목록 불러오기
	@RequestMapping(value = "/user/messageList.do", method = RequestMethod.GET)
	public void messageList(HttpServletResponse response, String id) throws JsonIOException, IOException {
		logger.info("UserWebsocketController의 messageList()");
		logger.info(id);
		Gson gson = new GsonBuilder().create();
		
		// chatList 가져오기		
		List<chatList> list = service.chatList(id);
		
		response.setContentType("applicaion/json; charset=UTF-8");
		// json 문자열로 변환
		gson.toJson(list, response.getWriter());
	}
	
	@RequestMapping(value = "/admin/adminChat.do", method = RequestMethod.GET)
	public String adminChat(HttpServletRequest request) {
		logger.info("UserWebsocketController의 adminChat()");
		
		return "admin/adminChat";
	}
	
}
