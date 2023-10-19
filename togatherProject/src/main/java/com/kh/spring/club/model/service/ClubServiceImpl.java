package com.kh.spring.club.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.attachment.model.vo.Attachment;
import com.kh.spring.club.model.dao.ClubDao;
import com.kh.spring.club.model.vo.Club;
import com.kh.spring.myClass.model.vo.MyClass;
import com.kh.spring.reply.model.vo.Reply;

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

	@Override
	public int insertReply(Reply r) {
		return cDao.insertReply(r, sqlSession);
	}

	@Override
	public ArrayList<Reply> selectReplyList(String classNo) {
		return cDao.selectReplyList(classNo, sqlSession);
	}

	@Override
	public ArrayList<Reply> selectCreplyList(String classNo) {
		return cDao.selectCreplyList(classNo, sqlSession);
	}

	@Override
	public int insertReReply(Reply r) {
		return cDao.insertReReply(r, sqlSession);
	}

	@Override
	public int checkStatus(MyClass c) {
		return cDao.checkStatus(c, sqlSession);
	}

	@Override
	public int checkType(MyClass c) {
		return cDao.checkType(c, sqlSession);
	}

	@Override
	public int enterClass(MyClass c) {
		return cDao.enterClass(c, sqlSession);
	}

}
