package com.kh.spring.interest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SearchController {

	@RequestMapping(value = "search.so")
	public String searchSocialing() {
		return "search/searchSocialingPage";
	}
	
}
