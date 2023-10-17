package com.kh.spring.club.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.attachment.model.vo.Attachment;
import com.kh.spring.club.model.dao.ClubDao;
import com.kh.spring.club.model.vo.Club;

@Service
public class ClubServiceImpl implements ClubService {
	
	@Autowired
	private ClubDao cDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Club> selectClassList() {
		return cDao.selectClassList(sqlSession);
	}

	@Override
	public ArrayList<Club> selectSocialList() {
		return cDao.selectSocialList(sqlSession);
	}

	@Override
	public ArrayList<Club> selectClubList() {
		return cDao.selectClubList(sqlSession);
	}

	@Override
	public ArrayList<Club> selectChallengeList() {
		return cDao.selectChallengeList(sqlSession);
	}
	
	@Override
	public ArrayList<Club> selectOneDayList() {
		return cDao.selectOneDayList(sqlSession);
	}

	@Override
	public ArrayList<Club> selectMyClassList() {
		return null;
	}

	@Override
	public Club selectClassDetail(int classNo) {
		return cDao.selectClassDetail(classNo, sqlSession);
	}

	@Override
	public int insertClass(Club c) {
		return cDao.insertClass(c, sqlSession);
	}

	@Override
	public int insertImg(Attachment at) {
		return cDao.insertImg(at, sqlSession);
	}

	@Override
	public int insertMyClass(Club c) {
		return cDao.insertMyClass(c, sqlSession);
	}

}
