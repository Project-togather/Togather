package com.kh.spring.interest.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.club.model.vo.Club;
import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.feed.model.vo.Feed;
import com.kh.spring.member.model.vo.Member;

@Repository
public class SearchDao {
	
	public int selectSocialingListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("clubMapper.selectSocialingListCount");
		
	}
	
	public ArrayList<Club> selectSocialingList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("clubMapper.selectSocialingList", null, rowBounds);
		
	}
	
	public int selectClubListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("clubMapper.selectClubListCount");
		
	}
	
	public ArrayList<Club> selectClubList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("clubMapper.selectClubList", null, rowBounds);
		
	}
	
	
	
	
	
	public ArrayList<Feed> selectFeedList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("feedMapper.selectFeedList");
		
	}
	
	public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectMemberList");
		
	}
	

}
