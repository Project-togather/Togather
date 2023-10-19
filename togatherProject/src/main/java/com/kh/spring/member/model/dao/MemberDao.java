package com.kh.spring.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.attachment.model.vo.Attachment;
import com.kh.spring.feed.model.vo.Feed;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.meminterest.model.vo.MemInterest;


@Repository
public class MemberDao {

	public Member loginMember(Member m, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	public int idCheck(SqlSessionTemplate sqlSession , String checkId) {
		return sqlSession.selectOne("memberMapper.idCheck", checkId);
	}
	
	public int insertMember(SqlSessionTemplate sqlSession , Member m) {
		
		return sqlSession.insert("memberMapper.insertMember", m);
		
	}
	
	public String bringMemNo(SqlSessionTemplate sqlSession , Member m){

		String MemNo =  sqlSession.selectOne("memberMapper.bringMemNo",m);
		return MemNo;
		
	}
	
	public int insertProfileImage(SqlSessionTemplate sqlSession , Attachment at) {
		return sqlSession.insert("memberMapper.insertProfileImage", at);
	}
	
	public Attachment getProfileImg(SqlSessionTemplate sqlSession , String memNo) {
		
		Attachment pImg = sqlSession.selectOne("memberMapper.getProfileImg" , memNo);
		//System.out.println("DB로 들어갈 memNo" + memNo);
		//System.out.println("DAO 에서 꺼내온 사진" +  pImg);
		return pImg;
	}
	
	public int insertMsg(SqlSessionTemplate sqlSession , Member m) {
		return sqlSession.update("memberMapper.insertMsg",m);
	}
	
	public int insertInterest(SqlSessionTemplate sqlSession , MemInterest mi) {
		return sqlSession.insert("memberMapper.insertInterest", mi);
	}
	
	public ArrayList<MemInterest> getMemInterest(SqlSessionTemplate sqlSession , String memNo){
		
		ArrayList<MemInterest> mi = (ArrayList)sqlSession.selectList("memberMapper.getMemInterest" , memNo);
		
		return mi;
	}
	
	public int insertFeedImg(SqlSessionTemplate sqlSession , Attachment at){
		return sqlSession.insert("memberMapper.insertFeedImg" , at);
	}
	
	public int insertFeed(SqlSessionTemplate sqlSession , Feed f) {
		return sqlSession.insert("memberMapper.insertFeed", f);
	}
	
	public ArrayList<Feed> selectFeedList(SqlSessionTemplate sqlSession , String memNo){
		return (ArrayList)sqlSession.selectList("memberMapper.selectFeedList",memNo) ;
	}
	public String selectThumbnail(SqlSessionTemplate sqlSession , String feNo) {
		return sqlSession.selectOne("memberMapper.selectThumbnail",feNo);
	}
	
}
