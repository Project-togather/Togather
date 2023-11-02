package com.kh.spring.feed.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.attachment.model.vo.Attachment;
import com.kh.spring.feed.model.vo.Feed;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.reply.model.vo.Reply;

@Repository
public class FeedDao {

	public Feed selectFeedDetail(SqlSessionTemplate sqlSession , String feNo) {
		return sqlSession.selectOne("myfeedMapper.selectFeedDetail" , feNo);
	}
	
	public ArrayList<Attachment> selectFeedDetailImgList(SqlSessionTemplate sqlSession , String feNo){
		return (ArrayList)sqlSession.selectList("myfeedMapper.selectFeedDetailImgList",feNo);
	}
	
	public int insertFeedReply(SqlSessionTemplate sqlSession , Reply r) {
		return sqlSession.insert("myfeedMapper.insertFeedReply", r);
	}
	public ArrayList<Reply> showFeedReply(SqlSessionTemplate sqlSession , String feNo){
		return (ArrayList)sqlSession.selectList("myfeedMapper.showFeedReply" , feNo);
	}
	
	public Member selectReplyMember(SqlSessionTemplate sqlSession , String memNo) {
		return sqlSession.selectOne("myfeedMapper.selectReplyMember" ,memNo);
	}
	
	public ArrayList<Member> memberSearchList(SqlSessionTemplate sqlSession , HashMap<String, String> map){
		return (ArrayList)sqlSession.selectList("myfeedMapper.memberSearchList" , map);
	}
	
	//검색된 맴버 정보 가져오기
	public Member searchUserPage(SqlSessionTemplate sqlSession , String memNo) {
		return sqlSession.selectOne("myfeedMapper.searchUserPage", memNo);
	}
	
	// 피드 리스트 조회
	public ArrayList<Feed> selectFeedLists(SqlSessionTemplate sqlSession, String feStatus){
		return (ArrayList)sqlSession.selectList("feedMapper.selectFeedLists", feStatus);
	}
	
	// 팔로잉 한 피드 리스트 조회
	public ArrayList<Feed> FollowingFeedLists(SqlSessionTemplate sqlSession, Member m){
		return (ArrayList)sqlSession.selectList("feedMapper.FollowingFeedLists", m);
	}
}
