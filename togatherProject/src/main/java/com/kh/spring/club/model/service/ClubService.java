package com.kh.spring.club.model.service;

import java.util.ArrayList;

import com.kh.spring.attachment.model.vo.Attachment;
import com.kh.spring.club.model.vo.Club;

public interface ClubService {
	
	// 전체 리스트 조회 (소셜링, 클럽, 챌린지, 원데이, 피드?) (대문자)
	ArrayList<Club> selectClassList();
	
	// 소셜링 전체 조회
	ArrayList<Club> selectSocialList();
	
	// 클럽 전체 조회
	ArrayList<Club> selectClubList();
	
	// 챌린지 전체 조회
	ArrayList<Club> selectChallengeList();
	
	// 원데이 전체 조회
	ArrayList<Club> selectOneDayList();
	
	// 내 즐겨찾기 조회
	ArrayList<Club> selectMyClassList();
	
	Club selectClassDetail(int classNo);
	
	int insertClass(Club c);
	
	int insertImg(Attachment at);
	
	int insertMyClass(Club c);
}
