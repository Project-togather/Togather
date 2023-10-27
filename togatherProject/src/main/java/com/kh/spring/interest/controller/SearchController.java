package com.kh.spring.interest.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.map.HashedMap;
import org.apache.ibatis.javassist.expr.NewArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.spring.attachment.model.vo.Attachment;
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
	
	// 이미지 경로 저장
	public String saveAllFile(MultipartFile upfile, HttpSession session) {
		String originName = upfile.getOriginalFilename(); 
		
		String currentTime = new SimpleDateFormat("yyyyMMDDHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000); 
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String updateName = currentTime + ranNum + ext; 
		
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
			try {
				upfile.transferTo(new File(savePath + updateName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
		return updateName;
	}
	
	
	// 페이지 화면
	@RequestMapping(value = "list.se")
	public ModelAndView searchPageList(@RequestParam(value="cpage", defaultValue = "1") int currentPage, HttpServletRequest request , HttpSession session, ModelAndView mv) {
		
		int listCount = sService.selectClassAllListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 9);
		
		ArrayList<Club> list = sService.selectClassAllList(pi);
		
		ArrayList<Attachment> alist =sService.selectImageAllList(pi); 
		
		
		
		// System.out.println(pi);
		System.out.println(list);
		System.out.println(alist);
		
		
		
		mv.addObject("pi", pi).addObject("list", list).addObject("alist", alist).setViewName("search/searchPage2");
		
		
		return mv;
	}
	
	
	
	// 검색 화면
	@RequestMapping(value = "search.li")
	public String searchKeywordList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage,
	                                @RequestParam(value = "keyword", required = false) String keyword,
	                                @RequestParam(value = "options", required = false) String options, Model model) {
	    // 검색 결과의 총 개수를 가져오는 메소드
	    int searchCount = sService.searchKeywordListCount(keyword);
	    
	    // 필터(옵션) 결과의 총 개수를 가져오는 메소드
	    // int filterCount = sService.searchFilterListCount(keyword, options);
	    
	    
	    

	    if (searchCount == 0) {
	    	
	        // 검색 결과가 없을 때 알림 메시지를 설정
	        model.addAttribute("errorMessage", "검색 결과가 없습니다.");
	        
	    } else {
	    	
	        // 페이지 정보 계산
	        PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, 10, 9);
	        // PageInfo fpi = Pagination.getPageInfo(filterCount, currentPage, 10, 9);

	        // 검색 결과 가져오는 메소드
	        ArrayList<Club> list = sService.searchKeywordList(keyword, pi);
	        ArrayList<Attachment> alist =sService.selectImageSearchList(keyword, pi);
	        
	        // 필터(옵션) 결과를 가져오는 메소드
	        // ArrayList<Club> flist = sService.searchFilterList(keyword, pi, options);
	        // ArrayList<Attachment> falist =sService.selectFilterImageSearchList(keyword, pi, options);
	        

	        // Model을 사용하여 데이터 전달
	        model.addAttribute("pi", pi);
	        model.addAttribute("list", list);
	        model.addAttribute("alist", alist);
	        
	        // 필터 처리 부분
	        // model.addAttribute("fpi", fpi);
	        // model.addAttribute("flist", flist);
	        // model.addAttribute("falist", falist);
	        
	        
	    }
	    

	    model.addAttribute("keyword", keyword);

	    return "search/searchPage2";
	}
	
	
	
	
	// 상세 조회
	
	
	
	
	// ajax 피드 화면
	@RequestMapping("list.al")
	public String ajaxSelectAllPage() {
		
		return "search/searchPage";
	}
	
	
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
	
	/*
	@RequestMapping(value = "search.li")
    public String searchAndFilterList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage,
                                      @RequestParam(value = "keyword", required = true) String keyword,
                                      @RequestParam(value = "filter", required = false) String filter, Model model) {

        // 검색 결과의 총 개수를 가져오는 메소드
        int searchCount = sService.searchKeywordListCount(keyword);

        if (searchCount == 0) {
            // 검색 결과가 없을 때 알림 메시지를 설정
            model.addAttribute("errorMessage", "검색 결과가 없습니다.");
        } else {
            // 페이지 정보 계산
            PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, 10, 9);

            // 검색 결과 가져오는 메소드
            ArrayList<Club> list = sService.searchKeywordList(keyword, pi);

            // 필터링 처리
            if (filter != null && !filter.isEmpty()) {
            	
                ArrayList<Club> filteredList = new ArrayList<>();
                
                for (Club club : list) {
                	
                    if (club.getFilterProperty().equals(filter)) { // 필터 조건을 정확히 지정하세요.
                    	
                        filteredList.add(club);
                    }
                }
                
                model.addAttribute("list", filteredList);
                
            } else {
            	
                // 필터링 조건이 주어지지 않은 경우, 원래 검색 결과를 사용
                model.addAttribute("list", list);
            }

            // Model을 사용하여 데이터 전달
            model.addAttribute("pi", pi);
        }

        model.addAttribute("keyword", keyword);

        return "search/searchPage2";
    }
	*/
	
	

