package com.kh.spring.club.model.service;

import java.util.ArrayList;

import com.kh.spring.QuitReason.model.vo.QuitReason;
import com.kh.spring.alarm.model.vo.Notification;
import com.kh.spring.attachment.model.vo.Attachment;
import com.kh.spring.club.model.vo.Club;
import com.kh.spring.feed.model.vo.Feed;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.myClass.model.vo.MyClass;
import com.kh.spring.reply.model.vo.Reply;

public interface ClubService {
	
	// 소셜링 전체 조회
	ArrayList<Club> selectSocialList();
	
	// 클럽 전체 조회
	ArrayList<Club> selectClubList();
	
	// 챌린지 전체 조회
	ArrayList<Club> selectChallengeList();
	
	// 원데이 전체 조회
	ArrayList<Club> selectOneDayList();
	
	// 라운지 전체 조회
	ArrayList<Feed> feedLists();
	
	// 마이클래스 대기상태별 조회
	ArrayList<Club> waitTypeClass(Club c);
	
	// 내가 만든 모임 리스트 조회
	ArrayList<Club> selectMyClassList(Member m);
	
	// 찜한 모임 리스트 조회
	ArrayList<Club> likeClassList(Club c);
	
	// 모임 상세 조회
	Club selectClassDetail(MyClass mc);
	
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
	
	// 모임 탈퇴
	int quitClass(QuitReason qr);
	
	// 모임 즐찾 등록
	int likeClass(MyClass c);
	
	// 모임 즐찾 해제
	int unlikeClass(MyClass c);
	
	// 모임 즐찾 확인
	int checkLike(MyClass c);
	
	// 모임 삭제
	int deleteClass(String classNo);
	
	// 모임에 가입한 멤버 확인
	ArrayList<Member> classMemberList(MyClass c);
	
	// 모임 가입할떄 결제한 가입비 조회
	int selectPayPrice(MyClass c);
	
	// 카테고리별 모임 리스트 조회
	ArrayList<Club> selectCategoryList(Club c);
	
	// 참여중인 프로필 이미지 조회
	ArrayList<Member> selectImgList(Club c);
	// 호스트가 멤버 가입 승인
	int admitEnrollMember(MyClass c);
	
	// 호스트가 멤버 가입 거절
	int refuseEnrollMember(MyClass c);
	
	// 모임 수정
	int updateClass(Club c);
	
	// 모임 프사, 썸네일 조회
	ArrayList<Attachment> selectClassAttachment(MyClass c);
	
	// 상세페이지의 피드 조회
	ArrayList<Feed> selectClassFeedList(MyClass c);
	
	// 상세페이지의 피드 프로필사진
	ArrayList<Feed> selectClassFeedPfList(MyClass c);
	
	// 상세페이지의 피드 썸네일
	ArrayList<Feed> selectClassFeedTnList(MyClass c);
	
	// 모임 파일 수정
	int updateImg(Attachment at);
	
	// 비슷한 모임
	ArrayList<Club> selectSimilarList(MyClass c);
	
	// 비슷한 모임 썸네일
	ArrayList<Attachment> selectClassTnList(MyClass c);
	
	
}