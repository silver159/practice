package com.spring.controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.dto.CarDTO;
import com.spring.dto.CarInfoDTO;
import com.spring.dto.CarInfoList;
import com.spring.dto.CarList;
import com.spring.dto.CarParam;
import com.spring.dto.userDTO;
import com.spring.service.CarService;
import com.spring.service.KeywordService;
import com.spring.service.RentalService;
import com.spring.service.adminUserService;

@Controller
public class adminKeywordController {

	private static final Logger logger = LoggerFactory.getLogger(adminKeywordController.class);

	@Autowired
	KeywordService service;
	@Autowired
	CarList carList;
	@Autowired
	CarInfoList infoList;	
	
	
	@RequestMapping(value = "/adminkeyword/keywordOpstion", method = RequestMethod.POST)
	@ResponseBody 
	public Map<String, String> userInsert() {
		List<String> keywordList = service.keywordOpstion();
		
		System.out.println(keywordList);
		Map<String, String> map = new HashMap<String, String>();
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			String keywordListString = objectMapper.writeValueAsString(keywordList);
			map.put("result", "success");
			map.put("keywordList", keywordListString);
		} catch (Exception e) { }
		
		return map;
	}
	@RequestMapping(value = "/adminkeyword/keywordInsert", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> keywordInsert(@RequestBody Map<String, Object> data) {
		System.out.println(data);
		service.keywordInsert(data);
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("result", "success");
		
		return map;
	}
	
}
