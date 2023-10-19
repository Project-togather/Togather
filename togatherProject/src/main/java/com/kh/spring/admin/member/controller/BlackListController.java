package com.kh.spring.admin.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.admin.member.model.service.AdminServiceImpl;
import com.kh.spring.admin.member.model.vo.BlackList;
import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.common.template.Pagination;
import com.kh.spring.member.model.vo.Member;

@Controller
public class BlackListController {
	@Autowired
	private AdminServiceImpl Aservice;

			//블랙리스트 페이지 이동
			@RequestMapping("blacklist.bo")
			public ModelAndView blacklistPage(@RequestParam(value="cpage",defaultValue = "1") int currentPage,ModelAndView mv) {
				int  blackMemCount = Aservice.selectBlackListCount();
				
				PageInfo pi = Pagination.getPageInfo(blackMemCount, currentPage, 10, 10);
				//화면 리스트용 메서드
				
				ArrayList<BlackList> list = Aservice.selectBlackList(pi);
				
				if(list.size()>0) {
					mv.addObject("pi",pi).addObject("list",list).setViewName("admin/member/blacklist");
					
				}else {
					mv.addObject("pi",pi).addObject("list",list).setViewName("admin/member/blacklist");
					//mv.addObject("errorMsg", "블랙리스트조회실패");  
					//mv.setViewName("common/errorPage");
				}
				
				return mv;
			}
			
			//블랙리스트 아이디 체크
			@ResponseBody
			@RequestMapping ("idCheck.bl")
			public String idCheck(String checkId){
				int count = Aservice.idCheck(checkId);
				
				  if(count > 0) {
					  return "NNNNN"; 
				  }else{
					  return "NNNNY";
				  }
			}
				  
			//블랙리스트 추가하기
			@RequestMapping("insert.bl")
			public String insertblacklist(String userId,HttpSession session,Model model) {
				int result = Aservice.insertblackList(userId);
				
				if(result>0) {
					session.setAttribute("alertMsg", "성공적으로 블랙리스트가 등록되었습니다.");
					return "redirect:blacklist.bo";
				}else {
					model.addAttribute("errorMsg","블랙리스트 등록에 실패했습니다.");
					return "common/errorPage";
					
				}
			}
			
			@RequestMapping("black.de")
			public String updateBlackList(String memId,Model model,HttpSession session) {
				
				int result = Aservice.updateBlackList(memId);
				
				if(result>0) {
					session.setAttribute("alertMsg", "성공적으로 블랙리스트 해제되었습니다.");
					return "redirect:blacklist.bo";
				}else {
					model.addAttribute("errorMsg","블랙리스트 해제에 실패했습니다.");
					return "common/errorPage";
				}
			}

}
