package com.kh.spring.admin.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.spring.admin.member.model.vo.BlackList;
import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.report.model.vo.Report;

@Repository
public class AdminDao {

	// -----회원 관리------
	public int selectMemberListCount(SqlSession sqlsession) {
		return sqlsession.selectOne("admemberMapper.selectMemberCount");
	}

	public ArrayList<Member> selectMemberList1(SqlSession sqlsession, PageInfo pi) {

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList) sqlsession.selectList("admemberMapper.selectMemberList", null, rowBounds);
	}

	public ArrayList<Member> selectMemberList2(SqlSession sqlsession) {

		return (ArrayList) sqlsession.selectList("admemberMapper.selectMemberList2");
	}
	//신고조회
	public ArrayList<Report> selectReport(SqlSession sqlsession ,PageInfo pi) {

		return (ArrayList) sqlsession.selectList("admemberMapper.selectReport");
	}

	public Member selectMemberList3(SqlSession sqlsession, String memNo) {
		return sqlsession.selectOne("admemberMapper.selectMemberList3", memNo);
	}

	// -----블랙리스트 관리------
	// insert시 id 체크
	public int idCheck(SqlSession sqlsession, String checkId) {
		return sqlsession.selectOne("admemberMapper.idCheck", checkId);
	}

	// id 체크 후 insert
	public int insertblackList(SqlSession sqlsession, String userId) {
		return sqlsession.insert("admemberMapper.insertblackList", userId);
	}

	// 블랙리스트 리스트
	public int selectBlackListCount(SqlSession sqlsession) {
		return sqlsession.selectOne("admemberMapper.selectBlackListCount");
	}

	// 블랙리스트 페이지바
	public ArrayList<BlackList> selectBlackList(SqlSession sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList) sqlSession.selectList("admemberMapper.selectBlackList", null, rowBounds);
	}

	// 블랙리스트 삭제
	public int updateBlackList(SqlSession sqlsession, String memId) {
		return sqlsession.update("admemberMapper.updateBlackList", memId);
	}

	// 회원수정
	public int adUpdateMember(SqlSession sqlsession, Member m) {
		return sqlsession.update("admemberMapper.adUpdateMember", m);
	}

	public int insertExcel(SqlSession sqlsession, Member excel) {
		return sqlsession.update("admemberMapper.insertExcel", excel);
	}

	public int insertReport(SqlSession sqlsession, Report r) {
		return sqlsession.insert("admemberMapper.insertReport", r);
	}

	// 신고리스트조회
	public int selectReportCount(SqlSession sqlsession) {
		return sqlsession.selectOne("admemberMapper.selectReportCount");
	}
	
	public Report selectReportList(SqlSession sqlSession,String reNo) {
		return sqlSession.selectOne("admemberMapper.selectReportList",reNo);
	}
	
	public int rcountUpdate(SqlSession sqlSession,Report r) {
		return sqlSession.update("admemberMapper.rcountUpdate",r);
	}
	public int reResultupdate(SqlSession sqlSession,Report r) {
		return sqlSession.update("admemberMapper.reResultupdate",r);
	}
	
	public int insertblackList2(SqlSession sqlSession,Report r) {
		return sqlSession.insert("admemberMapper.insertblackList2",r);
	}
}
