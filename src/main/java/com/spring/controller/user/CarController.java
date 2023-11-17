package com.spring.controller.user;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.dto.CarDTO;
import com.spring.dto.CarList;
import com.spring.dto.CarParam;
import com.spring.dto.RentalDTO;
import com.spring.dto.memberDTO;
import com.spring.service.CarService;
import com.spring.service.RentalService;

@Controller
public class CarController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(CarController.class);
	
	@Autowired 
	CarService service;
	
	@Autowired
	CarList carList;
	
	@Autowired
	CarDTO carDTO;

	@Autowired
	RentalDTO rentalDTO;
	
	
//	carList 페이지 이동
	@RequestMapping(value = "/car/carList", method = RequestMethod.GET)
	public String test(Model model) {
		System.out.println("car의 carList");
		
		return "user/carList";
	}

	
//	차량 1개의 정보를 가져온다.
	@RequestMapping(value = "/car/article", method = RequestMethod.POST)
	public String article(Model model, CarDTO carDTO) {
		System.out.println("Rental의 article");
		
		
		Date rentalDate = new Date();
		Date dueDate = new Date();
		dueDate.setDate(dueDate.getDate() + 1);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		model.addAttribute("rentalDate", sdf.format(rentalDate));
		model.addAttribute("dueDate", sdf.format(dueDate));
		
		
		carDTO = service.selectByCarIdx(carDTO.getCar_idx());
		model.addAttribute("car", carDTO);
		
		return "user/carArticle";
	}
	
//	차량 검색
	@RequestMapping(value = "/car/search", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> search(Model model, @RequestBody CarParam carParam) {
		System.out.println("Rental의 search");
		
		System.out.println(carParam);
		carList = service.mainSearchCar(carParam);
		
		Map<String, String> map = new HashMap<String, String>();

		try {
			ObjectMapper objectMapper = new ObjectMapper();
			String jsonString = objectMapper.writeValueAsString(carList);
			map.put("result", "success");
			map.put("carList", jsonString);
		} catch (Exception e) { }
		
		return map;
	}

	
	
}