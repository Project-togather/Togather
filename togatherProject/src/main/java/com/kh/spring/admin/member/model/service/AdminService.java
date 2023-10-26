package com.kh.spring.admin.member.model.service;

import java.util.ArrayList;

import com.kh.spring.admin.member.model.vo.BlackList;
import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.member.model.vo.Member;

public interface AdminService  {
	
	//---------------회원관리---------------
	
	//멤버통합관리
	//페이지용 회원수 조회
	int selectMemberListCount();
	
	//회원조회용 
	ArrayList<Member> selectMemberList1(PageInfo pi);
	
	//엑셀조회용
	ArrayList<Member> selectMemberList2();
	
	//회원상세조회
	Member selectMemberList3(String memNo);
	
	//--------------블랙리스트 관리----------------
	
	//블랙리스트 아이디 체크
	int idCheck(String checkId);
	
	//블랙리스트 추가
	int insertblackList(String userId);
	
	//
	int selectBlackListCount();
	
	ArrayList<BlackList> selectBlackList(PageInfo pi);
	
	int updateBlackList(String memId);
	
	int adUpdateMember(Member m);
	
	int insertExcel(Member excel);
}
