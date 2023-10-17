package com.kh.spring.admin.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.spring.admin.member.model.service.AdminServiceImpl;

@Controller
public class BlackListController {
	@Autowired
	private AdminServiceImpl Aservice;

			//블랙리스트 페이지 이동
			@RequestMapping("blacklist.bo")
			public String blacklistPage() {
				return "admin/member/blacklist";
			}
			
			//블랙리스트 아이디 체크
			@ResponseBody
			@RequestMapping ("idCheck.me")
			public String idCheck(String checkId){
				
				int count = Aservice.idCheck(checkId);
				
				  if(count > 0) {
					  return "NNNNN"; 
				  }else{
					  return "NNNNY";
				  }
			}
				  
			//블랙리스트 추가하기
			@RequestMapping("insert.bo")
			public String insertblacklist(String memId) {
				System.out.println(memId);
				
				return "";
			}

}
