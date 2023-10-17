package com.kh.spring.admin.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.member.model.vo.Member;

@Repository
public class AdminDao {
	
	public ArrayList<Member> selectMemberList1(SqlSession sqlsession,PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlsession.selectList("adminMapper.selectMemberList",null, rowBounds);
	}
	
	public int selectMemberListCount(SqlSession sqlsession) {
		return sqlsession.selectOne("adminMapper.selectMemberCount");
	}
	
	public ArrayList<Member> selectMemberList2 (SqlSession sqlsession){
		return  (ArrayList)sqlsession.selectList("adminMapper.selectMemberList");
	}
	
	public int idCheck(SqlSession sqlsession,String checkId) {
		return sqlsession.selectOne("adminMapper.idCheck",checkId);
	}
}
