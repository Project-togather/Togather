package com.kh.spring.interest.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.club.model.vo.Club;
import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.feed.model.vo.Feed;
import com.kh.spring.interest.model.dao.SearchDao;
import com.kh.spring.member.model.vo.Member;

@Service
public class SearchServiceImpl implements SearchService {

	@Autowired
	public SearchDao sDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 검색 페이지 리스트
	@Override
	public int selectClassAllListCount() {
		return sDao.selectClassAllListCount(sqlSession);
	}
	
	@Override
	public ArrayList<Club> selectClassAllList(PageInfo pi) {
		return sDao.selectClassAllList(sqlSession, pi);
	}
	
	// 검색 키워드
	@Override
	public int searchKeywordListCount() {
		return sDao.searchKeywordListCount(sqlSession);
	}

	@Override
	public ArrayList<Club> searchKeywordList(PageInfo pi, String keyword, String condition) {
		return sDao.searchKeywordList(sqlSession, pi, keyword, condition);
	}
	
	/*
	// 소셜링 리스트가 보이는 페이지 서비스 (페이징 처리)
	@Override
	public int selectSocialingListCount() {
		
		return sDao.selectSocialingListCount(sqlSession);
		
	}

	@Override
	public ArrayList<Club> selectSocialingList(PageInfo pi) {
		
		return sDao.selectSocialingList(sqlSession, pi);
		
	}
	
	// 클럽 리스트가 보이는 페이지 서비스 (페이징 처리)
	@Override
	public int selectClubListCount() {
		
		return sDao.selectClubListCount(sqlSession);
		
	}
	
	@Override
	public ArrayList<Club> selectClubList(PageInfo pi) {
		
		return sDao.selectClubList(sqlSession, pi);
		
	}
	
	// 챌린지 리스트가 보이는 페이지 서비스 (페이징 처리)
	@Override
	public int selectChallengeListCount() {
		return sDao.selectChallengeListCount(sqlSession);
	}
	
	@Override
	public ArrayList<Club> selectChallengeList(PageInfo pi) {
		return sDao.selectChallengeList(sqlSession, pi);
	}
	*/
	
	/*
	@Override
	public int searchClassListCount() {
		return sDao.searchClassListCount(sqlSession);
	}
	
	@Override
	public ArrayList<Club> searchClassList(PageInfo pi) {
		return sDao.searchClassList(sqlSession, pi);
	}
	*/
	
	
	/* 피드 리스트가 보이는 서비스 */
	@Override
	public ArrayList<Feed> selectFeedList() {
		return sDao.selectFeedList(sqlSession);
	}
	
	/* 멤버 리스트가 보이는 서비스 */
	@Override
	public ArrayList<Member> selectMemberList() {
		
		return sDao.selectMemberList(sqlSession);
	}


	
}
