package com.kh.spring.admin.customercenter.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.admin.customercenter.model.dao.CustomerBoardDao;
import com.kh.spring.admin.customercenter.model.vo.Faq;
import com.kh.spring.admin.customercenter.model.vo.Notice;
import com.kh.spring.admin.customercenter.model.vo.NoticeReply;
import com.kh.spring.common.model.vo.PageInfo;


@Service
public class CustomerBoardServiceImpl implements CustomerBoardService {
	
	@Autowired
	private CustomerBoardDao Cdao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectNoticeListCount() {
		return Cdao.selectNoticeListCount(sqlSession);
	}

	@Override
	public ArrayList<Notice> selectNoticeList(PageInfo pi) {
		return (ArrayList)Cdao.selectNoticeList(sqlSession, pi);
	}

	@Override
	public int insertNoticeBoard(Notice n) {
		return Cdao.insertNoticeBoard(sqlSession,n);
	}
	

	@Override
	public Notice noticeDetailview(String noticeNo) {
		return Cdao.noticeDetailview(sqlSession,noticeNo);
		
	}

	@Override
	public int updateNotice(Notice n) {
		return Cdao.updateNotice(sqlSession,n);
	}

	@Override
	public int deleteNotice(String noticeNo) {
		return Cdao.deleteNotice(sqlSession,noticeNo);
	}

	@Override
	public int selectFaqListCount() {
		return Cdao.selectFaqListCount(sqlSession);
	}

	@Override
	public ArrayList<Faq> selectFaqList(PageInfo pi) {
		return (ArrayList)Cdao.selectFaqList(sqlSession, pi);
	}

	@Override
	public Faq faqDetailview(int faqNo) {
		return Cdao.faqDetailview(sqlSession,faqNo);
	}

	@Override
	public int updateFaq(Faq f) {
		return Cdao.updateFaq(sqlSession,f);
	}

	@Override
	public int deletefaq(String faqNo) {
		return Cdao.deletefaq(sqlSession,faqNo);
	}

	@Override
	public int insertfaqBoard(Faq f) {
		return Cdao.insertfaqBoard(sqlSession,f);
	}

	@Override
	public int increaseNotice(String noticeNo) {
		return Cdao.increaseNotice(sqlSession,noticeNo);
	}

	@Override
	public ArrayList<NoticeReply> selectNoticeReply(String noticeNo) {
		return Cdao.selectNoticeReply(sqlSession,noticeNo);
	}

	@Override
	public int insertReplyNotice(NoticeReply nr) {
		return Cdao.insertReplyNotice(sqlSession,nr);
	} 
	

}
