package com.kh.spring.member.model.service;

import com.kh.spring.attachment.model.vo.Attachment;
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
	
}
