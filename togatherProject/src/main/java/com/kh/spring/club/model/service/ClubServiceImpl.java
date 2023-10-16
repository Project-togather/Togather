package com.kh.spring.club.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		return null;
	}

	@Override
	public ArrayList<Club> selectSocialList() {
		return cDao.selectSocialList(sqlSession);
	}

	@Override
	public int increaseCount(int cNo) {
		return 0;
	}

	@Override
	public Club selectSocial(int cNo) {
		return null;
	}

	@Override
	public int insertSocial(Club c) {
		return 0;
	}

	@Override
	public int updateSocial(Club c) {
		return 0;
	}

	@Override
	public int deleteSocial(int cNo) {
		return 0;
	}

	@Override
	public ArrayList<Club> selectClubList() {
		return null;
	}

	@Override
	public Club selectclub(int cNo) {
		return null;
	}

	@Override
	public int insertclub(Club c) {
		return 0;
	}

	@Override
	public int updateclub(Club c) {
		return 0;
	}

	@Override
	public int deleteclub(int cNo) {
		return 0;
	}

	@Override
	public ArrayList<Club> selectChallengeList() {
		return null;
	}

	@Override
	public Club selectchallenge(int cNo) {
		return null;
	}

	@Override
	public int insertchallenge(Club c) {
		return 0;
	}

	@Override
	public int updatechallenge(Club c) {
		return 0;
	}

	@Override
	public int deletechallenge(int cNo) {
		return 0;
	}

	@Override
	public ArrayList<Club> selectOneDayList() {
		return null;
	}

	@Override
	public Club selectOneDay(int cNo) {
		return null;
	}

	@Override
	public int insertOneDay(Club c) {
		return 0;
	}

	@Override
	public int updateOneDay(Club c) {
		return 0;
	}

	@Override
	public int deleteOneDay(int cNo) {
		return 0;
	}

	@Override
	public ArrayList<Club> selectMyClassList() {
		return null;
	}

}
