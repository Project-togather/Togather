package com.kh.spring.interest.controller;

import java.util.ArrayList;

import org.apache.ibatis.javassist.expr.NewArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.spring.club.model.vo.Club;
import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.common.template.Pagination;
import com.kh.spring.feed.model.vo.Feed;
import com.kh.spring.interest.model.service.SearchServiceImpl;

@Controller
public class SearchController {
	
	@Autowired
	private SearchServiceImpl sService;

	@RequestMapping(value = "list.so")
	public ModelAndView selectSocialingList(@RequestParam(value="cpage", defaultValue = "1") int currentPage, ModelAndView mv) {
		
		// System.out.println(currentPage);
		int listCount = sService.selectSocialingListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 9);
		
		ArrayList<Club> list = sService.selectSocialingList(pi);
		
		
		// System.out.println(pi);
		// System.out.println(list);
		
		mv.addObject("pi", pi);
		mv.addObject("list", list);
		mv.setViewName("search/searchSocialingPage");
		
		return mv;
	}
	
	@RequestMapping(value = "feed.li")
	public String ssfsdfw() {
		return "search/searchFeedPage";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "list.fe", produces = "application/json; charset=utf-8;")
	public String ajaxSelectFeedList() {
		
		ArrayList<Feed> list = sService.selectFeedList();
		
		System.out.println(new Gson().toJson(list));
		
		return new Gson().toJson(list);
				
	}
	
}
