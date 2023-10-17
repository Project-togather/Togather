package com.kh.spring.member.model.service;

import com.kh.spring.attachment.model.vo.Attachment;
import com.kh.spring.member.model.vo.Member;

public interface MemberService {
	Member loginMember(Member m);
	int idCheck(String checkId);
	int insertMember(Member m);
	String bringMemNo(Member m);
	//프사 첨부
	int insertProfileImage(Attachment at);
	//프사 가져오기
	Attachment getProfileImg(String memNo);
	
}
