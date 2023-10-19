package com.kh.spring.interest.controller;

import java.util.ArrayList;
import java.util.Map;

import org.apache.commons.collections4.map.HashedMap;
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

	@RequestMapping(value = "search.li")
	public String searchPageList() {
		return "search/searchPage";
	}
	
	@ResponseBody
	@RequestMapping(value = "getList.so", produces = "application/json; charset=utf-8;")
	public String selectSocialingList(Club c, @RequestParam(value="cpage", defaultValue = "1", required = false) int currentPage) {
		
		int listCount = sService.selectSocialingListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 9);
		
		ArrayList<Club> list = sService.selectSocialingList(pi);
		
		return new Gson().toJson(list, pi);
	}
	
	
	
	

	
	@ResponseBody
	@RequestMapping(value = "getList.fe", produces = "application/json; charset=utf-8;")
	public String ajaxSelectFeedList() {
		
		ArrayList<Feed> list = sService.selectFeedList();
		
		// System.out.println(new Gson().toJson(list));
		
		return new Gson().toJson(list);
				
	}
	
	
	
	
}
