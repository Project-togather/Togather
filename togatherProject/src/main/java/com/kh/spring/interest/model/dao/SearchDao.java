package com.kh.spring.interest.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.attachment.model.vo.Attachment;
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
	
	public ArrayList<Attachment> selectImageAllList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("searchMapper.selectImageAllList", null, rowBounds);
		
	}
	
	
	
	public int searchKeywordListCount(SqlSessionTemplate sqlSession, String keyword) {
	    Map<String, String> parameterMap = new HashMap<>();
	    parameterMap.put("keyword", keyword);
	    return sqlSession.selectOne("searchMapper.searchKeywordListCount", parameterMap);
	}

	
	public ArrayList<Club> searchKeywordList(SqlSessionTemplate sqlSession, String keyword, PageInfo pi) {
	    int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
	    int limit = pi.getBoardLimit();

	    RowBounds rowBounds = new RowBounds(offset, limit);

	    Map<String, Object> parameterMap = new HashMap<>();
	    parameterMap.put("keyword", keyword);
	    parameterMap.put("rowBounds", rowBounds);

	    return (ArrayList)sqlSession.selectList("searchMapper.searchKeywordList", parameterMap);
	}
	
	public ArrayList<Attachment> selectImageSearchList(SqlSessionTemplate sqlSession, String keyword, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("searchMapper.selectImageSearchList", null, rowBounds);
		
	}
	
	
	
	// 상세 조회
	public int searchFilterListCount(SqlSessionTemplate sqlSession, String keyword, String options) {
	    Map<String, String> parameterMap = new HashMap<>();
	    parameterMap.put("keyword", keyword);
	    parameterMap.put("options", options);
	    
	    return sqlSession.selectOne("searchMapper.searchFilterListCount", parameterMap);
	}

	
	public ArrayList<Club> searchFilterList(SqlSessionTemplate sqlSession, String keyword, PageInfo fpi, String options) {
	    int offset = (fpi.getCurrentPage() - 1) * fpi.getBoardLimit();
	    int limit = fpi.getBoardLimit();

	    RowBounds rowBounds = new RowBounds(offset, limit);

	    Map<String, Object> parameterMap = new HashMap<>();
	    parameterMap.put("keyword", keyword);
	    parameterMap.put("rowBounds", rowBounds);
	    parameterMap.put("options", options);

	    return (ArrayList)sqlSession.selectList("searchMapper.searchFilterList", parameterMap);
	}
	
	public ArrayList<Attachment> selectFilterImageSearchList(SqlSessionTemplate sqlSession, String keyword, PageInfo fpi, String options) {
		
		int offset = (fpi.getCurrentPage() - 1) * fpi.getBoardLimit();
		int limit = fpi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("searchMapper.selectFilterImageSearchList", null, rowBounds);
		
	}
	

	
	// ajax 영역
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
