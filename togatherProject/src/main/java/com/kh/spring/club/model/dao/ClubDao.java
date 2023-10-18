package com.kh.spring.club.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.attachment.model.vo.Attachment;
import com.kh.spring.club.model.vo.Club;
import com.kh.spring.reply.model.vo.Reply;

@Repository
public class ClubDao {
	
	public ArrayList<Club> selectClassList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("clubMapper.selectClassList"); 
	}
	
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
	
	public Club selectClassDetail(int classNo, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("clubMapper.selectClassDetail", classNo);
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
}
