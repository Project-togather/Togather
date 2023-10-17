package com.kh.spring.interest.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.club.model.vo.Club;
import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.common.template.Pagination;
/*import com.kh.spring.interest.model.service.SearchServiceImpl;*/

@Controller
public class SearchController {
	/*
	@Autowired
	private SearchServiceImpl sService;

	@RequestMapping(value = "search.so")
	public ModelAndView selectSocialingList(@RequestParam(value="cpage", defaultValue = "1") int currentPage, ModelAndView mv) {
		
		// System.out.println(currentPage);
		int listCount = sService.selectSocialingListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Club> list = sService.selectSocialingList(pi);
		
		
		System.out.println(pi);
		System.out.println(list);
		
		mv.addObject("pi", pi);
		mv.addObject("list", list);
		mv.setViewName("search/searchSocialingPage");
		
		return mv;
	}
	*/
}
