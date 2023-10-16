package com.kh.spring.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdmindPage {
	
	//어드민 메인 페이지 이동
		@RequestMapping("admin.pa")
		public String mainPage() {
			return "admin/common/adminMain";
		}

}
