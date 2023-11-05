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
	
	// 임시
	public int searchListCount(SqlSessionTemplate sqlSession, String keyword, String options, String sorting, String category, String dateValue, String onoff) {
	    
		Map<String, Object> parameterMap = new HashMap<>();
	    parameterMap.put("keyword", keyword);
	    parameterMap.put("options", options);
	    parameterMap.put("sorting", sorting);
	    parameterMap.put("category", category);
	    parameterMap.put("dateValue", dateValue);
	    parameterMap.put("onoff", onoff);
		
	    return sqlSession.selectOne("searchMapper.searchListCount", parameterMap);
	}
	
	public ArrayList<Club> searchList(SqlSessionTemplate sqlSession, String keyword, String options, String sorting, String category, String dateValue, String onoff, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		Map<String, Object> parameterMap = new HashMap<>();
	    parameterMap.put("keyword", keyword);
	    parameterMap.put("options", options);
	    parameterMap.put("sorting", sorting);
	    parameterMap.put("category", category);
	    parameterMap.put("dateValue", dateValue);
	    parameterMap.put("onoff", onoff);

	    return (ArrayList)sqlSession.selectList("searchMapper.searchList", parameterMap, rowBounds);
	}
	
	
	public ArrayList<Attachment> searchImageList(SqlSessionTemplate sqlSession, String keyword, String options, String sorting, String category, String dateValue, String onoff, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		Map<String, Object> parameterMap = new HashMap<>();
	    parameterMap.put("keyword", keyword);
	    parameterMap.put("options", options);
	    parameterMap.put("sorting", sorting);
	    parameterMap.put("category", category);
	    parameterMap.put("dateValue", dateValue);
	    parameterMap.put("onoff", onoff);
		
		return (ArrayList)sqlSession.selectList("searchMapper.searchImageList", parameterMap, rowBounds);
		
	}
	
	
	// 검색 조회
	/*
	public int searchKeywordListCount(SqlSessionTemplate sqlSession) {
	    
	    return sqlSession.selectOne("searchMapper.searchKeywordListCount");
	}


	
	public ArrayList<Club> searchFilterList(SqlSessionTemplate sqlSession, String keyword, PageInfo pi, String options) {
	    int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
	    int limit = pi.getBoardLimit();

	    RowBounds rowBounds = new RowBounds(offset, limit);

	    Map<String, Object> parameterMap = new HashMap<>();
	    parameterMap.put("keyword", keyword);
	    parameterMap.put("rowBounds", rowBounds);
	    parameterMap.put("options", options);

	    return (ArrayList)sqlSession.selectList("searchMapper.searchFilterList", parameterMap);
	}
	
	public ArrayList<Attachment> selectFilterImageSearchList(SqlSessionTemplate sqlSession, String keyword, PageInfo pi, String options) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("searchMapper.selectFilterImageSearchList", null, rowBounds);
		
	}
	*/
	

	
	// ajax 영역
	public int searchFeedMoreListCount(SqlSessionTemplate sqlSession) {
	    
		
	    return sqlSession.selectOne("searchMapper.searchFeedMoreListCount");
	}
	
	
	public ArrayList<Feed> selectFeedList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("searchMapper.ajaxSelectFeedList", rowBounds);
		
	}
	
	public ArrayList<Attachment> selectImageFeedList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("searchMapper.ajaxSelectImageFeedList", rowBounds);
		
	}
	
	public ArrayList<Member> selectImageMemberFeedList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("searchMapper.ajaxSelectImageMemberFeedList", rowBounds);
		
	}
	
	
	// 멤버 부분
	
	public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("searchMapper.ajaxSelectMemberList");
		
	}
	
	public ArrayList<Attachment> selectImageMemberList(SqlSessionTemplate sqlSession) {
		
		
		return (ArrayList)sqlSession.selectList("searchMapper.selectImageMemberList");
		
	}
	

}
