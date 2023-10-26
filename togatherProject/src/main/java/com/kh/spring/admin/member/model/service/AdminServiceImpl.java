package com.kh.spring.admin.member.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.admin.member.model.dao.AdminDao;
import com.kh.spring.admin.member.model.vo.BlackList;
import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService {

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
	public Member selectMemberList3(String memNo) {
		return ADao.selectMemberList3(sqlSession,memNo);
	}

	@Override
	public int idCheck(String checkId) {
		return ADao.idCheck(sqlSession, checkId);
	}

	@Override
	public int insertblackList(String userId) {
		return ADao.insertblackList(sqlSession,userId);
	}

	@Override
	public int selectBlackListCount() {
		return ADao.selectBlackListCount(sqlSession);
	}

	@Override
	public ArrayList<BlackList> selectBlackList(PageInfo pi) {
		return ADao.selectBlackList(sqlSession,pi);
	}

	@Override
	public int updateBlackList(String memId) {
		return ADao.updateBlackList(sqlSession,memId);
	}

	@Override
	public int adUpdateMember(Member m) {
		return ADao.adUpdateMember(sqlSession,m);
	}

	@Override
	public int insertExcel(Member excel) {
		
		System.out.println("asd"+excel );
		return ADao.insertExcel(sqlSession, excel);
	}
	

}
