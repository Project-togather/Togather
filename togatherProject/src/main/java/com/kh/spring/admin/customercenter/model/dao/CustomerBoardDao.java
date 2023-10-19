package com.kh.spring.admin.customercenter.model.dao;

import java.util.ArrayList;

import org.apache.commons.math3.linear.SymmLQ;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.spring.admin.customercenter.model.vo.Notice;
import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.member.model.vo.Member;

@Repository
public class CustomerBoardDao {
	
	//공지사항 관리
	public int selectNoticeListCount(SqlSession sqlsession) {
		int num = sqlsession.selectOne("adcustomerMapper.selectNoticeCount");
		System.out.println(num);
		return num;
	}
	
	//공지사항 페이지 리스트
	public ArrayList<Notice> selectNoticeList(SqlSession sqlsession,PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlsession.selectList("adcustomerMapper.selectNoticeList",null, rowBounds);
	}
	
	public int insertNoticeBoard(SqlSession sqlsession,Notice n) {
		return sqlsession.insert("adcustomerMapper.insertNoticeBoard", n);
	}
	
	public Notice noticeDetailview(SqlSession sqlsession,int noticeNo) {
		return sqlsession.selectOne("adcustomerMapper.noticeDetailview",noticeNo);
	}
	
	public int updateNotice(SqlSession sqlsession,Notice n) {
		System.out.println(n);
		return sqlsession.update("adcustomerMapper.updateNotice", n);
	}
}
