package com.kh.spring.interest.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.club.model.vo.Club;
import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.interest.model.dao.SearchDao;

@Service
public class SearchServiceImpl implements SearchService {

	@Autowired
	public SearchDao sDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectSocialingListCount() {
		
		return sDao.selectSocialingListCount(sqlSession);
		
	}

	@Override
	public ArrayList<Club> selectSocialingList(PageInfo pi) {
		
		return sDao.selectSocialingList(sqlSession, pi);
		
	}
	
}
