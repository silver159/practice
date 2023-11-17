package com.spring.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.CarDTO;
import com.spring.dto.CarInfoDTO;
import com.spring.dto.CarParam;
import com.spring.dto.RentalDTO;
import com.spring.dto.repleDTO;

@Mapper
public interface RentalDAO {

	ArrayList<RentalDTO> getRentalList();

	void rentalInsert(CarParam carParam);

	void carUpdate(CarDTO carDTO);

	int income(String period);

	List<Map<String, Integer>> incomeList();
}
