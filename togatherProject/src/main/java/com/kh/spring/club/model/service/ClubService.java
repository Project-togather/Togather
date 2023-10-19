package com.kh.spring.club.model.service;

import java.util.ArrayList;

import com.kh.spring.attachment.model.vo.Attachment;
import com.kh.spring.club.model.vo.Club;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.myClass.model.vo.MyClass;
import com.kh.spring.reply.model.vo.Reply;

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
	
	// 모임 상세 조회
	Club selectClassDetail(int classNo);
	
	// 댓글(모임) 등록
	int insertReply(Reply r);
	
	// 댓글의 답글(모임) 등록
	int insertReReply(Reply r);

	int insertClass(Club c);
	
	int insertImg(Attachment at);
	
	int insertMyClass(Club c);
	
	// 댓글(모임) 조회
	ArrayList<Reply> selectReplyList(String classNo);
	
	// 댓글(모임)의 답글 조회
	ArrayList<Reply> selectCreplyList(String classNo);

	// 모임 가입 상태 확인
	int checkStatus(MyClass c);
	
	// 모임 가입 타입 확인
	int checkType(MyClass c); 
	
	// 모임 가입
	int enterClass(MyClass c);
	
	// 모임 즐찾 등록
	int likeClass(MyClass c);
	
	// 모임 즐찾 해제
	int unlikeClass(MyClass c);
	
	// 모임 즐찾 확인
	int checkLike(MyClass c);
}
