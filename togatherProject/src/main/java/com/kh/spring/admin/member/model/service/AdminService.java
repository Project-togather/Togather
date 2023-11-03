package com.kh.spring.admin.member.model.service;

import java.util.ArrayList;

import com.kh.spring.admin.member.model.vo.BlackList;
import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.report.model.vo.Report;

public interface AdminService  {
	
	//---------------회원관리---------------
	
	//멤버통합관리
	//페이지용 회원수 조회
	int selectMemberListCount();
	
	//회원조회용 
	ArrayList<Member> selectMemberList1(PageInfo pi);
	
	//엑셀조회용
	ArrayList<Member> selectMemberList2();
	
	ArrayList<Report> selectReport(PageInfo pi);
	
	
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
	
	int insertReport(Report r);
	
	int selectReportCount();
	
	Report selectReportList(String reNo);
	
	//멤버 신고 카운트 누적
	int rcountUpdate(Report r);
	//멤버 신고 카운트 누적 이후 신고내역 리스트 삭제
	int reResultupdate(Report r);
	
	//관리자 확인 - 누적신고3회이상 블랙리스트 자동 등록
	int insertblackList2(Report r);
}
