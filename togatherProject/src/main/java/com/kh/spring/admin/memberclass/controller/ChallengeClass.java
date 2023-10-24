package com.kh.spring.admin.memberclass.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.admin.member.model.service.AdminServiceImpl;
import com.kh.spring.admin.member.model.vo.BlackList;
import com.kh.spring.admin.memberclass.model.service.AdMemberClassServiceImpl;
import com.kh.spring.club.model.vo.Club;
import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.common.template.Pagination;

@Controller
public class ChallengeClass {
	
	@Autowired
	private AdMemberClassServiceImpl Mservice;
	
	//리스트
	@RequestMapping("challenge.cl")
	public ModelAndView challengeList(@RequestParam(value="cpage",defaultValue = "1") int currentPage,ModelAndView mv) {
		int challengeCount = Mservice.challengeListCount();
		
		System.out.println(challengeCount);
		
		PageInfo pi = Pagination.getPageInfo(challengeCount, currentPage, 10, 10);
		
		ArrayList<Club> list = Mservice.challengeList(pi);
		System.out.println(list);
		
		mv.addObject("pi",pi).addObject("list",list).setViewName("admin/memberclass/challengelist");
		
		return mv;
	}
}
