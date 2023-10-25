package com.kh.spring.member.model.service;

import java.util.ArrayList;

import com.kh.spring.attachment.model.vo.Attachment;
import com.kh.spring.feed.model.vo.Feed;
import com.kh.spring.follow.model.vo.Follow;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.meminterest.model.vo.MemInterest;




public interface MemberService {
	Member loginMember(Member m);
	int idCheck(String checkId);
	int insertMember(Member m);
	String bringMemNo(Member m);
	//프사 첨부파일에 넣기
	int insertProfileImage(Attachment at);

	//프사 가져오기
	Attachment getProfileImg(String memNo);
	
	//DB에 취향밑 한마디 넣기
	int insertMsg(Member m);
	int insertInterest(MemInterest mi);
	//다음꺼
	
	
	
	//여기서 부턴 마이페이지랑 그 개인 피드 관련임 계속 재사용할꺼라서 조심해서 잘쓰자
	
	
	ArrayList<MemInterest> getMemInterest(String memNo);
	int insertFeedImg(Attachment at);
	//피드넣기
	int insertFeed(Feed f);
	//피드리스트 조회
	ArrayList<Feed> selectFeedList(String memNo);
	//썸네일 사진 가져오기 피드 번호로
	String selectThumbnail(String feNo);

	//여기까지
	
	// 로그인 세션 + 해당 유저의 모임 가입상태 세션
	ArrayList<Member> selectClType(Member m);

	//팔로우하기
	int insertFollow(Follow f);
	//언팔하기
	int deleteFollow(Follow f);
	//팔로우되어있나 체크
	int checkFollow(Follow f);
	
	//팔로잉리스트 팔로워리스트
	ArrayList<Member> getFollowingList (String memNo);
	ArrayList<Member> getFollowerList (String memNo);
	
	
}
