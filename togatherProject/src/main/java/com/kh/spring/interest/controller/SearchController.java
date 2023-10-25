package com.kh.spring.interest.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.collections4.map.HashedMap;
import org.apache.ibatis.javassist.expr.NewArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import com.kh.spring.member.model.vo.Member;

import oracle.net.aso.s;


@Controller
public class SearchController {
	
	@Autowired
	private SearchServiceImpl sService;
	
	
	// 페이지 화면
	@RequestMapping(value = "list.se")
	public ModelAndView searchPageList(@RequestParam(value="cpage", defaultValue = "1") int currentPage, ModelAndView mv) {
		
		int listCount = sService.selectClassAllListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 9);
		ArrayList<Club> list = sService.selectClassAllList(pi);
		
		// System.out.println(pi);
		// System.out.println(list);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("search/searchPage2");
		
		
		return mv;
	}
	
	// 검색 화면
	@RequestMapping(value = "search.li")
	public String searchKeywordList(@RequestParam(value="cpage", defaultValue = "1") int currentPage, 
									@RequestParam(value = "keyword", required = false) String keyword,
									@RequestParam(value = "condition", required = false) String condition, Model model) {
	
		
		int searchCount = sService.searchKeywordListCount();
		
		PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, 10, 9);
		
		ArrayList<Club> searchResult = sService.searchKeywordList(pi, keyword, condition);
		
		return "search/searchPage2";
	}
	
	
	/*
	// 소셜링
	@ResponseBody
	@RequestMapping(value = "getList.so", produces = "application/json; charset=utf-8;")
	public String ajaxSelectSocialingList(Club c,
	    @RequestParam(value = "cpage", defaultValue = "1", required = false) int currentPage,
	    @RequestParam(value = "pageSize", defaultValue = "10", required = false) int pageSize) {
		
	    
	    int listCount = sService.selectSocialingListCount();
	    PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageSize, 9);
	    ArrayList<Club> list = sService.selectSocialingList(pi);
	    
	    
	    Map<String, Object> response = new HashMap<>();
	    response.put("list", list); // 페이징된 목록
	    response.put("pageInfo", pi); // 페이지 정보
	    
	    // Gson을 사용하여 Map을 JSON 문자열로 변환하여 반환
	    Gson gson = new Gson();
	    String jsonResponse = gson.toJson(response);
	    
	    return jsonResponse;
	}
	
	
	// 소셜링 검색
	
	
	// 클럽
	@ResponseBody
	@RequestMapping(value = "getList.cl", produces = "application/json; charset=utf-8;")
	public String ajaxSelectClubList(Club c,
		    @RequestParam(value = "cpage", defaultValue = "1", required = false) int currentPage,
		    @RequestParam(value = "pageSize", defaultValue = "10", required = false) int pageSize) {
		
			int listCount = sService.selectClubListCount();
			
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageSize, 9);
			
			ArrayList<Club> list = sService.selectClubList(pi);
			
			Map<String, Object> response = new HashMap<>();
			
			 response.put("list", list);
			 response.put("pageInfo", pi);
			 
			
			Gson gson = new Gson();
		    String jsonResponse = gson.toJson(response);
			    
			return jsonResponse;
			
			
	}
	
	
		// 챌린지
		@ResponseBody
		@RequestMapping(value = "getList.ch", produces = "application/json; charset=utf-8;")
		public String ajaxSelectChallengeList(Club c,
			    @RequestParam(value = "cpage", defaultValue = "1", required = false) int currentPage,
			    @RequestParam(value = "pageSize", defaultValue = "10", required = false) int pageSize) {
			
				int listCount = sService.selectChallengeListCount();
				
				PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageSize, 9);
				
				ArrayList<Club> list = sService.selectChallengeList(pi);
				
				Map<String, Object> response = new HashMap<>();
				
				 response.put("list", list);
				 response.put("pageInfo", pi);
				 
				
				Gson gson = new Gson();
			    String jsonResponse = gson.toJson(response);
				    
				return jsonResponse;
				
				
		}
		*/
		
	
	
	/*
	@ResponseBody
	@RequestMapping(value = "getList.cl", produces = "application/json; charset=utf-8;")
	public String ajaxSelectClassList(Club c,
		    @RequestParam(value = "cpage", defaultValue = "1", required = false) int currentPage,
		    @RequestParam(value = "pageSize", defaultValue = "10", required = false) int pageSize) {
		
			int listCount = sService.searchClassListCount();
			
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageSize, 9);
			
			ArrayList<Club> list = sService.searchClassList(pi);
			
			Map<String, Object> response = new HashMap<>();
			
			 response.put("list", list); // 페이징된 목록
			 response.put("pageInfo", pi); // 페이지 정보
			 
			// Gson을 사용하여 Map을 JSON 문자열로 변환하여 반환
			Gson gson = new Gson();
		    String jsonResponse = gson.toJson(response);
		    
		    System.out.println(response);
			    
			return jsonResponse;
	}
	*/
	

	/* 피드 */
	@ResponseBody
	@RequestMapping(value = "getList.fe", produces = "application/json; charset=utf-8;")
	public String ajaxSelectFeedList() {
		
		ArrayList<Feed> list = sService.selectFeedList();
		
		// System.out.println(new Gson().toJson(list));
		
		return new Gson().toJson(list);
				
	}
	
	
	/* 멤버 */
	@ResponseBody
	@RequestMapping(value = "getList.me", produces = "application/json; charset=utf-8;")
	public String ajaxSelectMemberList() {
		
		ArrayList<Member> list = sService.selectMemberList();
		
		System.out.println(list);
		
		return new Gson().toJson(list);
		
	}
	
}
