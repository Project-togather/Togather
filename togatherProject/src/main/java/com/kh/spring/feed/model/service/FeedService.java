package com.kh.spring.feed.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.spring.attachment.model.vo.Attachment;
import com.kh.spring.feed.model.vo.Feed;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.reply.model.vo.Reply;

public interface FeedService {
	
	
	
	// 피드 상세 조회
	Feed selectFeedDetail(String feNo);
	ArrayList<Attachment> selectFeedDetailImgList(String feNo);
	//피드 댓글작성
	int insertFeedReply(Reply r);
	
	//피드 댓글 조회
	ArrayList<Reply> showFeedReply(String feNo);
	//피드 댓글 조회할때 멤버 정보 가져오기
	Member selectReplyMember(String memNo);
	//맴버 검색
	ArrayList<Member> memberSearchList(HashMap<String, String> map);
	//검색된 멤버페이지로 이동
	Member searchUserPage(String memNo);
	
	// 피드 전체리스트 조회
	ArrayList<Feed> selectListFeeds();
	
	// 피드 리스트 조회
	ArrayList<Feed> selectFeedLists(String feStatus);
	
	// 좋아요 한 피드 리스트 조회
	ArrayList<Feed> FollowingFeedLists(Member m);
}
