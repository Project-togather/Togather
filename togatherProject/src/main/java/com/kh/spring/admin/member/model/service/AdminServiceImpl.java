package com.kh.spring.admin.member.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.admin.member.model.dao.AdminDao;
import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.member.model.vo.Member;




@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDao ADao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectMemberListCount() {
		return ADao.selectMemberListCount(sqlSession);
	}

	@Override
	public ArrayList<Member> selectMemberList1(PageInfo pi) {
		return ADao.selectMemberList1(sqlSession, pi);
	}

	@Override
	public ArrayList<Member> selectMemberList2() {
		return ADao.selectMemberList2(sqlSession);
	}

	@Override
	public int idCheck(String checkId) {
		return ADao.idCheck(sqlSession,checkId);
	}
	

}
