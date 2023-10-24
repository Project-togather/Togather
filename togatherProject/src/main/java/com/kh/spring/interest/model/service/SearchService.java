package com.kh.spring.interest.model.service;

import java.lang.reflect.Array;
import java.util.ArrayList;

import com.kh.spring.club.model.vo.Club;
import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.feed.model.vo.Feed;
import com.kh.spring.member.model.vo.Member;

public interface SearchService {

	/*
	int selectSocialingListCount();
	ArrayList<Club> selectSocialingList(PageInfo pi);
	
	int selectClubListCount();
	ArrayList<Club> selectClubList(PageInfo pi);
	*/
	
	// 소셜링, 클럽, 챌린지 리스트가 보이는 페이지 서비스 (페이징 처리)
	int searchClassListCount();
	ArrayList<Club> searchClassList(PageInfo pi);
	
	// 피드 리스트가 보이는 서비스
	ArrayList<Feed> selectFeedList();
	
	// 멤버 리스트가 보이는 서비스
	ArrayList<Member> selectMemberList();
	
}
