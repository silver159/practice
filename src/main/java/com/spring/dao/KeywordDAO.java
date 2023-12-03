package com.spring.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.spring.dto.CarDTO;
import com.spring.dto.CarInfoDTO;
import com.spring.dto.CarParam;
import com.spring.dto.KeywordDTO;
import com.spring.dto.RentalDTO;
import com.spring.dto.repleDTO;

@Mapper
public interface KeywordDAO {

	List<String> keywordOpstion();

	void keywordInsert(Map<String, Object> data);

	ArrayList<CarInfoDTO> getkeywordCarList(String name);

	ArrayList<KeywordDTO> getkeywordList();


}
