package com.spring.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.CarDAO;
import com.spring.dao.RentalDAO;
import com.spring.dao.memberDAO;
import com.spring.dto.CarDTO;
import com.spring.dto.CarList;
import com.spring.dto.CarParam;
import com.spring.dto.RentalDTO;
import com.spring.dto.memberDTO;
import com.spring.dto.repleDTO;

@Service
public class RentalService {
	
	@Autowired
	RentalDAO dao;
	
	@Autowired
	CarDTO carDTO;
	
	@Autowired
	CarList carList;

	public void rentalInsert(CarParam carParam) {
		System.out.println("RentalService의 rentalInsert");
		
		dao.rentalInsert(carParam);
	}

	public void carUpdate(int car_idx, String status, String member_id) {
		System.out.println("RentalService의 carUpdate");
		
		carDTO.setCar_idx(car_idx);
		carDTO.setStatus(status);
		RentalDTO dto = new RentalDTO();
		
		dao.carUpdate(carDTO);
	}

	public ArrayList<RentalDTO> getRentalList() {
		System.out.println("RentalService의 carUpdate");
		
		return dao.getRentalList();
	}

	public int income(String period) {
		System.out.println("RentalService의 income");
		
		return dao.income(period);
	}

	public List<Map<String, Integer>> incomeList() {
		return dao.incomeList();
	}
	
	
	
	
}
