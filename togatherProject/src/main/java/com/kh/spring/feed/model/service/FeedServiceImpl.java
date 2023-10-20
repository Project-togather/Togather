package com.kh.spring.feed.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.attachment.model.vo.Attachment;
import com.kh.spring.feed.model.dao.FeedDao;
import com.kh.spring.feed.model.vo.Feed;
import com.kh.spring.member.model.dao.MemberDao;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.reply.model.vo.Reply;

@Service
public class FeedServiceImpl implements FeedService {
	
	@Autowired
	private FeedDao fDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//피드 상세정보
	@Override
	public Feed selectFeedDetail(String feNo) {
		return fDao.selectFeedDetail(sqlSession , feNo);
	}

	//피드에 가져올 사진 리스트 조회
	@Override
	public ArrayList<Attachment> selectFeedDetailImgList(String feNo) {
		
		return fDao.selectFeedDetailImgList(sqlSession,feNo);
	}

	//피드에 댓글작성
	@Override
	public int insertFeedReply(Reply r) {
		return fDao.insertFeedReply(sqlSession, r);
	}
	//피드 댓글리스트 가져오기
	@Override
	public ArrayList<Reply> showFeedReply(String feNo) {
		return fDao.showFeedReply(sqlSession ,feNo);
	}
	//댓글의 맴버 정보 가져오기
	@Override
	public Member selectReplyMember(String memNo) {
		return fDao.selectReplyMember(sqlSession,memNo);
	}



	
	
}
