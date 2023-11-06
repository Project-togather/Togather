package com.kh.spring.interest.model.service;

import java.lang.reflect.Array;
import java.util.ArrayList;

import com.kh.spring.attachment.model.vo.Attachment;
import com.kh.spring.club.model.vo.Club;
import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.feed.model.vo.Feed;
import com.kh.spring.member.model.vo.Member;

public interface SearchService {

	// 임시
	int searchListCount(String keyword, String options, String sorting, String category, String dateValue, String onoff, String selectedAddress);
	ArrayList<Club> searchList(String keyword, String options, String sorting, String category, String dateValue, String onoff, String selectedAddress, PageInfo pi);
	ArrayList<Attachment> searchImageList(String keyword, String options, String sorting, String category, String dateValue, String onoff, String selectedAddress, PageInfo pi);
	
	// 검색 조회
	/*
	int searchKeywordListCount(String keyword, String options);
	ArrayList<Club> searchFilterList(String keyword, String options, PageInfo pi);
	ArrayList<Attachment> selectFilterImageSearchList(String keyword, String options, PageInfo pi);
	*/
	
	
	
	// 멤버 리스트가 보이는 서비스
	ArrayList<Member> selectMemberList();
	ArrayList<Attachment> selectImageMemberList();
}
