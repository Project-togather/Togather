package com.kh.spring.admin.customercenter.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.admin.customercenter.model.dao.CustomerBoardDao;
import com.kh.spring.admin.customercenter.model.vo.Notice;
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
	public Notice noticeDetailview(int noticeNo) {
		return Cdao.noticeDetailview(sqlSession,noticeNo);
		
	}

	@Override
	public int updateNotice(Notice n) {
		return Cdao.updateNotice(sqlSession,n);
	} 
	

}
