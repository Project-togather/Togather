package com.kh.spring.admin.customercenter.model.dao;

import java.util.ArrayList;

import org.apache.commons.math3.linear.SymmLQ;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.spring.admin.customercenter.model.vo.Faq;
import com.kh.spring.admin.customercenter.model.vo.Notice;
import com.kh.spring.admin.customercenter.model.vo.NoticeReply;
import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.member.model.vo.Member;

@Repository
public class CustomerBoardDao {
	
	//공지사항 관리
	public int selectNoticeListCount(SqlSession sqlsession) {
		int num = sqlsession.selectOne("adcustomerMapper.selectNoticeCount");
		return num;
	}
	//faq 관리
		public int selectFaqListCount(SqlSession sqlsession) {
			int num = sqlsession.selectOne("adcustomerMapper.selectFaqListCount");
			return num;
		}
	
	//공지사항 페이지 리스트
	public ArrayList<Notice> selectNoticeList(SqlSession sqlsession,PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlsession.selectList("adcustomerMapper.selectNoticeList",null, rowBounds);
	}
	//faq 페이지 리스트
		public ArrayList<Notice> selectFaqList(SqlSession sqlsession,PageInfo pi){
			
			int offset = (pi.getCurrentPage() -1)*pi.getBoardLimit();
			int limit = pi.getBoardLimit();
			
			RowBounds rowBounds = new RowBounds(offset, limit);
			return (ArrayList)sqlsession.selectList("adcustomerMapper.selectFaqList",null, rowBounds);
		}
	
		public int insertNoticeBoard(SqlSession sqlsession,Notice n) {
			return sqlsession.insert("adcustomerMapper.insertNoticeBoard", n);
		}
		
		public Notice noticeDetailview(SqlSession sqlsession,String noticeNo) {
			return sqlsession.selectOne("adcustomerMapper.noticeDetailview",noticeNo);
		}
		
		public int updateNotice(SqlSession sqlsession,Notice n) {
			return sqlsession.update("adcustomerMapper.updateNotice", n);
		}
		public int deleteNotice(SqlSession sqlsession,String noticeNo){
			return sqlsession.update("adcustomerMapper.deleteNotice", noticeNo);
		}
		public Faq faqDetailview(SqlSession sqlsession,int faqNo) {
			return sqlsession.selectOne("adcustomerMapper.faqDetailview",faqNo);
		}
		
		public int updateFaq(SqlSession sqlsession,Faq f) {
			return sqlsession.update("adcustomerMapper.updateFaq", f);
		}
		
		public int deletefaq(SqlSession sqlsession,String faqNo) {
			return sqlsession.update("adcustomerMapper.deletefaq", faqNo);
		}
		
		public int insertfaqBoard(SqlSession sqlsession,Faq f) {
			return sqlsession.insert("adcustomerMapper.insertfaqBoard", f);
		}
		public int increaseNotice(SqlSession sqlsession,String noticeNo) {
			return sqlsession.update("adcustomerMapper.increaseNotice",noticeNo);
		}
		public ArrayList<NoticeReply> selectNoticeReply(SqlSession sqlsession,String noticeNo){
			return (ArrayList)sqlsession.selectList("adcustomerMapper.selectNoticeReply",noticeNo);
		}
		public int insertReplyNotice(SqlSession sqlsession,NoticeReply nr) {
			return sqlsession.insert("adcustomerMapper.insertReplyNotice",nr);
		}
}
