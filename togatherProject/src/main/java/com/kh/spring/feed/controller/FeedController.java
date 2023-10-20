package com.kh.spring.feed.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.feed.model.service.FeedServiceImpl;
import com.kh.spring.feed.model.vo.Feed;
import com.kh.spring.reply.model.vo.Reply;

@Controller
public class FeedController {
	
	@Autowired
	private FeedServiceImpl fService;
	
	@RequestMapping(value = "feedDetail.fe")
	public void selectFeedDetail() {
		
	}
	
}
