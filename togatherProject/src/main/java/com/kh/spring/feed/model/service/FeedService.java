package com.kh.spring.feed.model.service;

import java.util.ArrayList;

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
	
	
}
