package com.kh.spring.feed.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.feed.model.dao.FeedDao;
import com.kh.spring.feed.model.vo.Feed;
import com.kh.spring.reply.model.vo.Reply;

@Service
public class FeedServiceImpl implements FeedService {

	@Autowired
	private FeedDao fDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Feed> selectFeedList() {
		return null;
	}

	@Override
	public int increaseCount(int feNo) {
		return 0;
	}

	@Override
	public Feed selectFeed(int feNo) {
		return null;
	}

	@Override
	public int insertFeed(Feed f) {
		return 0;
	}

	@Override
	public int updateFeed(Feed f) {
		return 0;
	}

	@Override
	public int deleteFeed(int feNo) {
		return 0;
	}

	@Override
	public ArrayList<Feed> selectReviewList() {
		return null;
	}

	@Override
	public Feed selectRevicw(int feNo) {
		return null;
	}

	@Override
	public int insertReview(Feed f) {
		return 0;
	}

	@Override
	public int updateReview(Feed f) {
		return 0;
	}

	@Override
	public ArrayList<Reply> selectReplyList(int cNo) {
		return null;
	}

	@Override
	public int insertReply(int rNo) {
		return 0;
	}

	@Override
	public int updateReply(int rNo) {
		return 0;
	}

	@Override
	public int deleteReply(int rNo) {
		return 0;
	}

	
	
}
