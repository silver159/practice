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

<<<<<<< HEAD
	void carkeywordInsert(Map<String, Object> data);
=======
	void keywordInsert(Map<String, Object> data);
>>>>>>> 1767c68b4d55deb42bf382b31ea9e065f6b4b58d

	ArrayList<CarInfoDTO> getkeywordCarList(String name);

	ArrayList<KeywordDTO> getkeywordList();

<<<<<<< HEAD
	void keywordDelete(HashMap<String, Object> data);

	void keywordInsert(KeywordDTO keywordDTO);

	void keywordUpdate(HashMap<String, String> data);

=======
>>>>>>> 1767c68b4d55deb42bf382b31ea9e065f6b4b58d

}
