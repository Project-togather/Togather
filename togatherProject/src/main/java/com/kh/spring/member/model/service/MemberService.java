package com.kh.spring.member.model.service;

import com.kh.spring.member.model.vo.Member;

public interface MemberService {

	//로그인 (select)
		Member loginMember(Member m);
		
	//아이디 중복검사(select)
		int idCheck(String checkId);
		
	//회원가입 (insert)
		int inserMember(Member m);
	
}
