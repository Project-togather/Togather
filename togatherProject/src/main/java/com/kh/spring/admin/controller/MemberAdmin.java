package com.kh.spring.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberAdmin {
	
	
	@RequestMapping("list.mem")
	public String memberList() {
		return "admin/member/memberListView";
	}

}
