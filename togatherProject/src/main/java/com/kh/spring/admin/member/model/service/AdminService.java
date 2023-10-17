package com.kh.spring.admin.member.model.service;

import java.util.ArrayList;

import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.member.model.vo.Member;

public interface AdminService  {
	
	//회원관리
	
	//회원조회용
	int selectMemberListCount();
	
	//회원조회용
	ArrayList<Member> selectMemberList1(PageInfo pi);
	
	//excel조회용
	ArrayList<Member> selectMemberList2();
	
	//블랙리스트 아이디 체크
	int idCheck(String checkId);
	
	//블랙리스트 추가
	int insertblackList(String userId);
}
