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
                           @RequestParam(value = "dateValue", required = false) String dateValue,
                           @RequestParam(value = "onoff", required = false) String onoff,
                           @RequestParam(value = "selectedAddress", required = false) String selectedAddress, Model model) {
          
      System.out.println(currentPage);
      
      
      // 검색 결과 총 개수
       int listCount = sService.searchListCount(keyword, options, sorting, category, dateValue, onoff, selectedAddress);
       
       PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 9);
       
       ArrayList<Club> list = sService.searchList(keyword, options, sorting, category, dateValue, onoff, selectedAddress, pi);
       ArrayList<Attachment> alist = sService.searchImageList(keyword, options, sorting, category, dateValue, onoff, selectedAddress, pi);
       
       
       model.addAttribute("keyword", keyword);
       model.addAttribute("options", options);
       model.addAttribute("sorting", sorting);
       model.addAttribute("category", category);
       model.addAttribute("dateValue", dateValue);
       model.addAttribute("onoff", onoff);
       model.addAttribute("selectedAddress", selectedAddress);
       
       model.addAttribute("pi", pi);
       model.addAttribute("list", list);
       model.addAttribute("alist", alist);
       
       
        System.out.println("pi :" + pi);
        System.out.println("키워드 :" + keyword);
        System.out.println("날짜 :" + dateValue);
        System.out.println("유형 :" + options);
        System.out.println("정렬 :" + sorting);
        System.out.println("카테고리 :" + category);
        System.out.println("온오프 :" + onoff);
        System.out.println("장소 :" + selectedAddress);
        System.out.println("검색 결과: " + list);
        System.out.println("검색 사진 :" + alist);
        
       

       return "search/searchPage2";
   }


   
   
   
   
   // ajax 화면
   @RequestMapping("list.al")
   public String ajaxSelectAllPage() {
      
      return "search/searchPage";
   }
   
   
   
   /* 멤버 */
   @ResponseBody
   @RequestMapping(value = "getList.me", produces = "application/json; charset=utf-8;")
   public String ajaxSelectMemberList() {
      
      ArrayList<Member> list = sService.selectMemberList();
      ArrayList<Attachment> alist = sService.selectImageMemberList();
      
      System.out.println(list);
      System.out.println(alist);
      
      Gson gson = new Gson();
       JsonObject jsonObject = new JsonObject();
       jsonObject.add("list", gson.toJsonTree(list));
       jsonObject.add("alist", gson.toJsonTree(alist));
      
       return jsonObject.toString();
      
   }
   
}
   
   
