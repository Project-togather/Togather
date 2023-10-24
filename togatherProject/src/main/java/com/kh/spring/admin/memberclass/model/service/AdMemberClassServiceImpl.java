package com.kh.spring.admin.memberclass.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.admin.member.model.dao.AdminDao;
import com.kh.spring.admin.memberclass.model.Dao.MemberClassDao;
import com.kh.spring.club.model.vo.Club;
import com.kh.spring.common.model.vo.PageInfo;

@Service
public class AdMemberClassServiceImpl implements AdMemberClassService {

	@Autowired
	private MemberClassDao MDao;

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int challengeListCount() {
		return MDao.challengeListCount(sqlSession);
	}

	@Override
	public ArrayList<Club> challengeList(PageInfo pi) {
		return MDao.challengeList(sqlSession,pi);
	}

	
}
