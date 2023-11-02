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
import com.google.gson.JsonObject;
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
	
	
	// 검색 화면
	@RequestMapping(value = "search.li")
	public String searchKeywordList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage,
									@RequestParam(value = "keyword", required = true) String keyword,
									@RequestParam(value = "options", required = false) String options,
									@RequestParam(value = "sorting", required = false) String sorting,
									@RequestParam(value = "category", required = false) String category,
									@RequestParam(value = "hiddenDate", required = false) String hiddenDate, Model model) {
	    	
		System.out.println(currentPage);
		
		
		// 검색 결과 총 개수
	    int listCount = sService.searchListCount(keyword, options, sorting, category, hiddenDate);
	    
	    PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 9);
	    
	    ArrayList<Club> list = sService.searchList(keyword, options, sorting, category, hiddenDate, pi);
	    ArrayList<Attachment> alist = sService.searchImageList(keyword, options, sorting, category, hiddenDate, pi);
	    
	    
	    model.addAttribute("keyword", keyword);
	    model.addAttribute("options", options);
	    model.addAttribute("sorting", sorting);
	    model.addAttribute("category", category);
	    model.addAttribute("dateValue", hiddenDate);
	    
	    model.addAttribute("pi", pi);
        model.addAttribute("list", list);
        model.addAttribute("alist", alist);
	    
	    
        System.out.println("pi :" + pi);
        System.out.println("키워드 :" + keyword);
        System.out.println("날짜 :" + hiddenDate);
        System.out.println("유형 :" + options);
        System.out.println("정렬 :" + sorting);
        System.out.println("카테고리 :" + category);
        System.out.println("검색 결과: " + list);
        System.out.println("검색 사진 :" + alist);
        
	    

	    return "search/searchPage2";
	}


	
	
	
	
	// ajax 피드 화면
	@RequestMapping("list.al")
	public String ajaxSelectAllPage() {
		
		return "search/searchPage";
	}
	
	
	
	/* 피드 */
	@ResponseBody
	@RequestMapping(value = "getList.fe", produces = "application/json; charset=utf-8;")
	public String ajaxSelectFeedList() {
		
	    ArrayList<Feed> list = sService.selectFeedList();
	    
	    // 이미지 피드 목록을 가져옴
	    ArrayList<Attachment> alist = sService.selectImageFeedList();
	    
	    ArrayList<Member> mlist = sService.selectImageMemberFeedList();
	    
	    System.out.println(list);
	    System.out.println(alist);
	    System.out.println(mlist);
	    
	    // list와 alist를 JSON으로 변환하여 반환
	    Gson gson = new Gson();
	    JsonObject jsonObject = new JsonObject();
	    jsonObject.add("list", gson.toJsonTree(list));
	    jsonObject.add("alist", gson.toJsonTree(alist));
	    jsonObject.add("mlist", gson.toJsonTree(mlist));

	    return jsonObject.toString();
	}
	
	/* 피드 무한 스크롤 */
	@ResponseBody
	@RequestMapping(value = "getMoreFeeds.fe", produces = "application/json; charset=utf-8;")
	public String ajaxMoreSelectFeedList(@RequestParam("page") int page) {
	    // 페이지 번호를 이용하여 페이징 처리를 하고 더 많은 피드를 가져옵니다.
	    int itemsPerPage = 10; // 한 페이지에 표시할 아이템 수
	    int startIndex = (page - 1) * itemsPerPage; // 시작 아이템 인덱스
	    
	    System.out.println(itemsPerPage);
	    System.out.println(startIndex);

	    ArrayList<Feed> moreList = sService.selectMoreFeedList(startIndex, itemsPerPage);
	    
	    // 이미지 피드 목록을 가져옴
	    ArrayList<Attachment> moreAlist = sService.selectMoreImageFeedList(startIndex, itemsPerPage);
	    
	    ArrayList<Member> mlist = sService.selectMoreImageMemberFeedList(startIndex, itemsPerPage);
	    
	    System.out.println(moreList);
	    System.out.println(moreAlist);
	    System.out.println(mlist);
	    
	    // moreList와 moreAlist를 JSON으로 변환하여 반환
	    Gson gson = new Gson();
	    JsonObject jsonObject = new JsonObject();
	    jsonObject.add("list", gson.toJsonTree(moreList));
	    jsonObject.add("alist", gson.toJsonTree(moreAlist));
	    jsonObject.add("mlist", gson.toJsonTree(mlist));

	    return jsonObject.toString();
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
	
	

