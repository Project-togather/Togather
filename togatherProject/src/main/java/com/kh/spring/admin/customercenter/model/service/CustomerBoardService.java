package com.kh.spring.admin.customercenter.model.service;

import java.util.ArrayList;

import com.kh.spring.admin.customercenter.model.vo.Faq;
import com.kh.spring.admin.customercenter.model.vo.Notice;
import com.kh.spring.common.model.vo.PageInfo;


public interface CustomerBoardService {
	
	int selectNoticeListCount();
	
	int selectFaqListCount();
	
	ArrayList<Notice> selectNoticeList(PageInfo pi);
	
	ArrayList<Faq> selectFaqList(PageInfo pi);
	
	int insertNoticeBoard(Notice n);
	
	Notice noticeDetailview(String noticeNo);
	
	int updateNotice(Notice n);
	
	int deleteNotice(String noticeNo);

	Faq faqDetailview(int faqNo);
	
	int updateFaq(Faq f);
	
	int deletefaq(String faqNo);
	
	int insertfaqBoard(Faq f);
	
	int increaseNotice(String noticeNo);
}
