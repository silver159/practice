package com.spring.webSocket;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class WebSocketController {
	
	private static final Logger logger = LoggerFactory.getLogger(WebSocketController.class);
	
	@RequestMapping(value = "/user/userChat.do", method = RequestMethod.GET)
	public String userChat(HttpServletRequest request) {
		logger.info("UserWebsocketController의 userchat()");
		
		return "user/userChat";
	}
	
	@RequestMapping(value = "/user/userChat2.do", method = RequestMethod.GET)
	public String userChat2(HttpServletRequest request) {
		logger.info("UserWebsocketController의 userchat()");
		
		return "user/userChat2";
	}
	
	@RequestMapping(value = "/admin/adminChat.do", method = RequestMethod.GET)
	public String adminChat(HttpServletRequest request) {
		logger.info("UserWebsocketController의 adminChat()");
		
		return "admin/adminChat";
	}
	
	@RequestMapping(value = "/admin/adminChat2.do", method = RequestMethod.GET)
	public String adminChat2(HttpServletRequest request) {
		logger.info("UserWebsocketController의 adminChat()");
		
		return "admin/adminChat2";
	}
}
