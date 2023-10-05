package com.kh.spring.feed.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.feed.model.service.FeedServiceImpl;
import com.kh.spring.feed.model.vo.Feed;
import com.kh.spring.reply.model.vo.Reply;

@Controller
public class FeedController {
	
	@Autowired
	private FeedServiceImpl fService;
	
	/**
	 * 피드 전체 조회
	 */
	public void selectFeedList() {
		ArrayList<Feed> list = fService.selectFeedList();
	}
	
	/**
	 * 피드 상세 조회
	 */
	public void selectFeed(int feNo) {
		int result = fService.increaseCount(feNo);
		
		if(result > 0) {
			Feed f = fService.selectFeed(feNo);
		}
	}
	
	/**
	 * 피드 작성
	 */
	public void insertFeed(Feed f) {
		int result = fService.insertFeed(f);
	}
	
	/**
	 * 피드 수정
	 */
	public void updateFeed(Feed f) {
		int result = fService.updateFeed(f);
	}
	
	/**
	 * 피드 삭제
	 */
	public void deleteFeed(int feNo) {
		int result = fService.deleteFeed(feNo);
	}
	
	/**
	 * 후기 전체 조회
	 */
	public void selectReviewList() {
		ArrayList<Feed> list = fService.selectReviewList();
	}
	
	/**
	 * 후기 상세 조회 (카운트 증가 where 절 바꾸기)
	 */
	public void selectRevicw(int feNo) {
		int result = fService.increaseCount(feNo);
		
		if(result > 0) {
			Feed f = fService.selectFeed(feNo);
		}
	}
	
	/**
	 * 후기 작성
	 */
	public void insertReview(Feed f) {
		int result = fService.insertReview(f);
	}
	
	/**
	 * 후기 수정
	 */
	public void updateReview(Feed f) {
		int result = fService.updateReview(f);
	}
	
	/**
	 * 댓글 조회
	 */
	public void selectReplyList(int cNo) {
		ArrayList<Reply> list = fService.selectReplyList(cNo);
	}
	
	/**
	 * 댓글 작성
	 */
	public void insertReply(int rNo) {
		int result = fService.insertReply(rNo);
	}
	
	/**
	 * 댓글 수정
	 */
	public void updateReply(int rNo) {
		int result = fService.updateReply(rNo);
	}
	
	/**
	 * 댓글 삭제
	 */
	public void deleteReply(int rNo) {
		int result = fService.deleteReply(rNo);
	}
	
}
