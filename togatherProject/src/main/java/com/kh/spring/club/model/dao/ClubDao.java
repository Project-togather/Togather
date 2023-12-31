package com.kh.spring.club.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.QuitReason.model.vo.QuitReason;
import com.kh.spring.alarm.model.vo.Notification;
import com.kh.spring.attachment.model.vo.Attachment;
import com.kh.spring.club.model.vo.Club;
import com.kh.spring.feed.model.vo.Feed;
import com.kh.spring.feed.model.vo.Feed;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.myClass.model.vo.MyClass;
import com.kh.spring.reply.model.vo.Reply;

@Repository
public class ClubDao {
	
	public ArrayList<Club> selectSocialList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("clubMapper.selectSocialList");
	}
	
	public ArrayList<Club> selectClubList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("clubMapper.selectClubList");
	}
	
	public ArrayList<Club> selectChallengeList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("clubMapper.selectChallengeList");
	}
	
	public ArrayList<Club> selectOneDayList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("clubMapper.selectOneDayList");
	}
	
	public Club selectClassDetail(MyClass mc, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("clubMapper.selectClassDetail", mc);
	}
	
	public int insertReply(Reply r, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("clubMapper.insertReply", r);
	}
	

	public int insertClass(Club c, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("clubMapper.insertClass", c);
	}

	public int insertImg(Attachment at, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("clubMapper.insertImg", at);
	}
	
	public int insertMyClass(Club c, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("clubMapper.insertMyClass", c);
	}
	
	public ArrayList<Reply> selectReplyList(String classNo, SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("clubMapper.selectReplyList", classNo);
	}
	
	public ArrayList<Reply> selectCreplyList(String classNo, SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("clubMapper.selectCreplyList", classNo);
	}
	
	public int insertReReply(Reply r, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("clubMapper.insertReReply", r);
	}
	
	public int checkStatus(MyClass c, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("clubMapper.checkStatus", c);
	}
	
	public int checkType(MyClass c, SqlSessionTemplate sqlSession) {
		int a = sqlSession.selectOne("clubMapper.checkType", c);
		return a;
	}
	
	public int enterClass(MyClass c, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("clubMapper.enterClass", c);
	}
	
	public int quitClass(QuitReason qr, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("clubMapper.quitClass", qr);
	}
	
	public int likeClass(MyClass c, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("clubMapper.likeClass", c);
	}
	
	public int unlikeClass(MyClass c, SqlSessionTemplate sqlSession) {
		return sqlSession.delete("clubMapper.unlikeClass", c);
	}
	
	public int checkLike(MyClass c, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("clubMapper.checkLike", c);
	}
	
	public int deleteClass(String classNo, SqlSessionTemplate sqlSession) {
		return sqlSession.update("clubMapper.deleteClass", classNo);
	}
	
	public ArrayList<Member> classMemberList(MyClass c, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("clubMapper.classMemberList", c);
	}
	
	public int selectPayPrice(MyClass c, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("clubMapper.selectPayPrice", c);
	}
	
	public int admitMember(MyClass c, SqlSessionTemplate sqlSession) {
		return sqlSession.update("clubMapper.admitMember", c);
	}
	
	public int refuseMember(MyClass c, SqlSessionTemplate sqlSession) {
		return sqlSession.delete("clubMapper.refuseMember", c);
	}
	
	public ArrayList<Club> selectCategoryList(SqlSessionTemplate sqlSession, Club c){
		return (ArrayList)sqlSession.selectList("clubMapper.selectCategoryList", c);
	}
	
	public ArrayList<Feed> feedLists(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("feedMapper.feedLists");
	}
	
	public ArrayList<Member> selectImgList(SqlSessionTemplate sqlSession, Club c){
		return (ArrayList)sqlSession.selectList("clubMapper.selectImgList", c);
	}
	
	public ArrayList<Club> selectMyClassList(SqlSessionTemplate sqlSession, Member m){
		return (ArrayList)sqlSession.selectList("clubMapper.selectMyClassList", m);
	}
	
	public ArrayList<Club> waitTypeClass(SqlSessionTemplate sqlSession, Club c){
		return (ArrayList)sqlSession.selectList("clubMapper.waitTypeClass", c);
	}
	
	public ArrayList<Club> likeClassList(SqlSessionTemplate sqlSession, Club c){
		return (ArrayList)sqlSession.selectList("clubMapper.likeClassList", c);
	}
	
	public int updateClass(Club c, SqlSessionTemplate sqlSession) {
		return sqlSession.update("clubMapper.updateClass", c);
	}
	
	public ArrayList<Attachment> selectClassAttachment(MyClass c, SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("clubMapper.selectClassAttachment", c);
	}
	
	public ArrayList<Feed> selectClassFeedList(MyClass c, SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("clubMapper.selectClassFeedList", c);
	}
	
	public ArrayList<Feed> selectClassFeedPfList(MyClass c, SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("clubMapper.selectClassFeedPfList", c);
	}
	
	public ArrayList<Feed> selectClassFeedTnList(MyClass c, SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("clubMapper.selectClassFeedTnList", c);
	}

	public int updateImg(Attachment at, SqlSessionTemplate sqlSession) {
		return sqlSession.update("clubMapper.updateImg", at);
	}
	
	public ArrayList<Club> selectSimilarList(MyClass c, SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("clubMapper.selectSimilarList", c);
	}
	
	public ArrayList<Attachment> selectClassTnList(MyClass c, SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("clubMapper.selectClassTnList", c);
	}

	public Member selectMrUserNo(Reply r, SqlSessionTemplate sqlSession){
		return (Member)sqlSession.selectOne("clubMapper.selectMrUserId", r);
	}
	
}
