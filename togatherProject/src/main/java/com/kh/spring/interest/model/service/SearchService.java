package com.kh.spring.interest.model.service;

import java.lang.reflect.Array;
import java.util.ArrayList;

import com.kh.spring.club.model.vo.Club;
import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.feed.model.vo.Feed;

public interface SearchService {

	// 1. 소셜링 리스트가 보이는 페이지 서비스 (페이징 처리)
	int selectSocialingListCount();
	ArrayList<Club> selectSocialingList(PageInfo pi);
	
	// 2. 피드 리스트가 보이는 서비스
	ArrayList<Feed> selectFeedList();
	
}
