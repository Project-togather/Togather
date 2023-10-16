package com.kh.spring.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.member.model.dao.MemberDao;
import com.kh.spring.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao mDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public Member loginMember(Member m) {
		
		Member loginMember = mDao.loginMember(m, sqlSession);
		
		return loginMember;
	}

	@Override
	public int idCheck(String checkId) {
		int result = mDao.idCheck(sqlSession, checkId);
		return result;
	}

	@Override
	public int inserMember(Member m) {
		
		return 0;
	}
	
}
