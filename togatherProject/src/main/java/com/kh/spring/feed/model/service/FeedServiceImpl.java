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

	@Override
	public Feed selectFeed(String feNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateFeed(Feed f) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteFeed(int feNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Feed> selectReviewList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Feed selectRevicw(int feNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertReview(Feed f) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateReview(Feed f) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Reply> selectReplyList(int cNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertReply(int rNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateReply(int rNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReply(int rNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	
}
