package com.kh.spring.club.model.service;

import java.util.ArrayList;

import com.kh.spring.club.model.vo.Club;

public interface ClubService {
	
	// 전체 리스트 조회 (소셜링, 클럽, 챌린지, 원데이, 피드?) (대문자)
	ArrayList<Club> selectClassList();
	
	// 소셜링 전체 조회
	ArrayList<Club> selectSocialList();
	
	// 소셜링 상세 조회
	int increaseCount(int cNo);
	Club selectSocial(int cNo);
	
	// 소셜링 작성
	int insertSocial(Club c);
	
	// 소셜링 수정
	int updateSocial(Club c);
	
	// 소셜링 삭제
	int deleteSocial(int cNo);
	
	// 클럽 전체 조회
	ArrayList<Club> selectClubList();
	
	// 클럽 상세 조회
	// 카운트 증가 where 절 바꾸기
	Club selectclub(int cNo);
	
	// 클럽 작성
	int insertclub(Club c);
	
	// 클럽 수정
	int updateclub(Club c);
	
	// 클럽 삭제
	int deleteclub(int cNo);
	
	// 챌린지 전체 조회
	ArrayList<Club> selectChallengeList();
	
	// 챌린지 상세 조회
	// 카운트 증가 where 절 바꾸기
	Club selectchallenge(int cNo);
	
	// 챌린지 작성
	int insertchallenge(Club c);
	
	// 챌린지 수정
	int updatechallenge(Club c);
	
	// 챌린지 삭제
	int deletechallenge(int cNo);
	
	// 원데이 전체 조회
	ArrayList<Club> selectOneDayList();
	
	// 원데이 상세 조회
	// 카운트 증가 where 절 바꾸기
	Club selectOneDay(int cNo);
	
	// 원데이 작성
	int insertOneDay(Club c);
	
	// 원데이 수정
	int updateOneDay(Club c);
	
	// 원데이 삭제
	int deleteOneDay(int cNo);
	
	// 내 즐겨찾기 조회
	ArrayList<Club> selectMyClassList();
	
	Club selectClassDetail(int classNo);
}
