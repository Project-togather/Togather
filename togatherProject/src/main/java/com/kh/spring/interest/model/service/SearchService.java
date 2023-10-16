package com.kh.spring.interest.model.service;

import java.lang.reflect.Array;
import java.util.ArrayList;

import com.kh.spring.club.model.vo.Club;
import com.kh.spring.common.model.vo.PageInfo;

public interface SearchService {

	// 1. 게시판 리스트가 보이는 페이지 서비스 (페이징 처리)
	int selectSocialingListCount();
	ArrayList<Club> selectSocialingList(PageInfo pi);
	
}
