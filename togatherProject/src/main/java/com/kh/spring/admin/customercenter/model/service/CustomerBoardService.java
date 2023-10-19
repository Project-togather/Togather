package com.kh.spring.admin.customercenter.model.service;

import java.util.ArrayList;

import com.kh.spring.admin.customercenter.model.vo.Notice;
import com.kh.spring.common.model.vo.PageInfo;


public interface CustomerBoardService {
	
	int selectNoticeListCount();
	
	ArrayList<Notice> selectNoticeList(PageInfo pi);
	
	int insertNoticeBoard(Notice n);
	
	Notice noticeDetailview(int noticeNo);
	
	int updateNotice(Notice n);

}
