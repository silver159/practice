package com.spring.controller.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.dto.CarDTO;
import com.spring.dto.CarInfoDTO;
import com.spring.service.KeywordService;


@Controller
public class IndexController {
	
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	@Autowired 
	KeywordService service;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model) {
		logger.info("프로젝트 시작");
		
		Map<String, ArrayList<CarInfoDTO>> keywordList = service.getkeywordList();
//		System.out.println(keywordList);
		
		model.addAttribute("keywordList", keywordList);
		
		return "index";
	}
	
}
