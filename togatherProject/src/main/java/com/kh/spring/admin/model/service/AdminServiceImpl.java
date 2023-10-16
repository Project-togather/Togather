package com.kh.spring.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.admin.model.dao.AdminDao;
import com.kh.spring.member.model.vo.Member;




@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDao ADao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Member> selectMemberList() {
		return ADao.selectMemberList(sqlSession);
	}

}
