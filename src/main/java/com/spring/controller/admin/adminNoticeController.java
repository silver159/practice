package com.spring.controller.admin;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.common.paging;
import com.spring.dto.noticeDTO;
import com.spring.service.noticeService;


@Controller
public class adminNoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(adminNoticeController.class);
	
	@Autowired 
	noticeService noticeService;

	@RequestMapping(value = "/admin/notice.do", method = RequestMethod.GET)
	public String notice(Model model, noticeDTO dto, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
//		logger.info("공지");
		dto.setCurrentPage((currentPage-1) * 10);
		List<noticeDTO> list = noticeService.noticeList(dto);
		
//		int totalCount = noticeService.noticeCount(dto);
		model.addAttribute("list", list);
//		model.addAttribute("totalCount", totalCount);
		model.addAttribute("paging", new paging(0, currentPage, 10, dto.queryString()).getPage());
		// 페이징 작업때문에 넣은거에요 
		
		return "admin/notice";
	}
	
	@RequestMapping(value = "/admin/noticeInsert.do", method = RequestMethod.POST)
	public String noticeInsert(HttpServletRequest request, HttpServletResponse response, Model model, noticeDTO dto) {
		logger.info("{}noticeInsert", dto);
		noticeService.noticeInsert(dto);
		
		return "redirect:/admin/notice.do";
	}
	
	@RequestMapping(value = "/admin/noticeDelete.do", method = RequestMethod.DELETE)
	@ResponseBody 
	public Map<String, String> noticeDelete(Model model, @RequestBody String delIds) {
//		System.out.println("여까진옴");
		String[] delData = delIds.split(",");
		noticeService.deleteNotice(delData);
		
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		map.put("message", "삭제완료");
		
		return map;
	}
}
