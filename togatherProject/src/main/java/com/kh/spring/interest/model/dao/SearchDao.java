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
	
	
	public int selectClassAllListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("searchMapper.selectClassAllListCount");
		
	}
	
	public ArrayList<Club> selectClassAllList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("searchMapper.selectClassAllList", null, rowBounds);
		
	}
	
	public int searchKeywordListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("searchMapper.searchKeywordListCount");
		
	}
	
	public ArrayList<Club> searchKeywordList(SqlSessionTemplate sqlSession, PageInfo pi, String keyword, String condition) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("searchMapper.searchKeywordList", null, rowBounds);
		
	}
	
	
	/*
	public int selectSocialingListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("searchMapper.ajaxSelectSocialingListCount");
		
	}
	
	public ArrayList<Club> selectSocialingList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("searchMapper.ajaxSelectSocialingList", null, rowBounds);
		
	}
	
	public int selectClubListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("searchMapper.ajaxSelectClubListCount");
		
	}
	
	public ArrayList<Club> selectClubList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("searchMapper.ajaxSelectClubList", null, rowBounds);
		
	}
	
	public int selectChallengeListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("searchMapper.ajaxSelectChallengeListCount");
		
	}
	
	public ArrayList<Club> selectChallengeList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("searchMapper.ajaxSelectChallengeList", null, rowBounds);
		
	}
	*/
	
	/*
	public int searchClassListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("searchMapper.ajaxSelectClassListCount");
		
	}
	
	public ArrayList<Club> searchClassList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("searchMapper.ajaxSelectClassList", null, rowBounds);
		
	}
	*/
	
	public ArrayList<Feed> selectFeedList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("searchMapper.ajaxSelectFeedList");
		
	}
	
	public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("searchMapper.ajaxSelectMemberList");
		
	}
	

}
