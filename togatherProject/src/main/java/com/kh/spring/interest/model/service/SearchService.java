package com.kh.spring.interest.model.service;

import java.lang.reflect.Array;
import java.util.ArrayList;

import com.kh.spring.club.model.vo.Club;
import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.feed.model.vo.Feed;
import com.kh.spring.member.model.vo.Member;

public interface SearchService {

	// 전체 조회
	int selectClassAllListCount();
	ArrayList<Club> selectClassAllList(PageInfo pi);
	
	// 검색 조회
	int searchKeywordListCount();
	ArrayList<Club> searchKeywordList(PageInfo pi, String keyword, String condition);
	
	/*
	// 소셜링
	int selectSocialingListCount();
	ArrayList<Club> selectSocialingList(PageInfo pi);
	// 소셜링 검색
	
	
	// 클럽
	int selectClubListCount();
	ArrayList<Club> selectClubList(PageInfo pi);
	
	// 챌린지
	int selectChallengeListCount();
	ArrayList<Club> selectChallengeList(PageInfo pi);
	*/
	
	/*
	// 소셜링, 클럽, 챌린지 리스트가 보이는 페이지 서비스 (페이징 처리)
	int searchClassListCount();
	ArrayList<Club> searchClassList(PageInfo pi);
	*/
	
	// 피드 리스트가 보이는 서비스
	ArrayList<Feed> selectFeedList();
	
	// 멤버 리스트가 보이는 서비스
	ArrayList<Member> selectMemberList();
	
}
