package com.kh.spring.feed.model.service;

import java.util.ArrayList;

import com.kh.spring.feed.model.vo.Feed;
import com.kh.spring.reply.model.vo.Reply;

public interface FeedService {
	
	// 피드 전체 조회
	ArrayList<Feed> selectFeedList();
	
	// 피드 상세 조회
	int increaseCount(int feNo);
	Feed selectFeed(int feNo);
	
	// 피드 작성
	int insertFeed(Feed f);
	
	// 피드 수정
	int updateFeed(Feed f);
	
	// 피드 삭제
	int deleteFeed(int feNo);
	
	// 후기 전체 조회
	ArrayList<Feed> selectReviewList();
	
	// 후기 상세 조회
	// 카운트 증가 where 절 바꾸기
	Feed selectRevicw(int feNo);
	
	// 후기 작성
	int insertReview(Feed f);
	
	// 후기 수정
	int updateReview(Feed f);
	
	// 댓글 조회
	ArrayList<Reply> selectReplyList(int cNo);
	
	// 댓글 작성
	int insertReply(int rNo);
	
	// 댓글 수정
	int updateReply(int rNo);
	
	// 댓글 삭제
	int deleteReply(int rNo);
}
