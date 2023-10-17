package com.kh.spring.club.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
	
	public Club selectClassDetail(int classNo, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("clubMapper.selectClassDetail", classNo);
	}
	
	public int insertReply(Reply r, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("clubMapper.insertReply", r);
	}
	
	
}
