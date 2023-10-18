package com.kh.spring.admin.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.spring.admin.member.model.vo.BlackList;
import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.member.model.vo.Member;

@Repository
public class AdminDao {
	
	//-----회원 관리------
	public int selectMemberListCount(SqlSession sqlsession) {
		return sqlsession.selectOne("admemberMapper.selectMemberCount");
	}
	
	public ArrayList<Member> selectMemberList1(SqlSession sqlsession,PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlsession.selectList("admemberMapper.selectMemberList",null, rowBounds);
	}
	
	
	public ArrayList<Member> selectMemberList2 (SqlSession sqlsession){
		return  (ArrayList)sqlsession.selectList("admemberMapper.selectMemberList");
	}
	
	//-----블랙리스트 관리------
	public int idCheck(SqlSession sqlsession,String checkId) {
		return sqlsession.selectOne("admemberMapper.idCheck",checkId);
	}
	public int insertblackList(SqlSession sqlsession,String userId) {
		return sqlsession.insert("admemberMapper.insertblackList",userId);
	}
	
	public int selectBlackListCount(SqlSession sqlsession) {
		return sqlsession.selectOne("admemberMapper.selectBlackListCount");
	}
	
	public ArrayList<BlackList> selectBlackList(SqlSession sqlSession,PageInfo pi){
		int offset = (pi.getCurrentPage() -1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("admemberMapper.selectBlackList",null, rowBounds);
	}
}
