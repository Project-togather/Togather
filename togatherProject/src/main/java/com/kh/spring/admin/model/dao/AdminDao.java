package com.kh.spring.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.spring.member.model.vo.Member;

@Repository
public class AdminDao {
	
	public ArrayList<Member> selectMemberList(SqlSession sqlsession){
		return (ArrayList)sqlsession.selectList("adminMapper.selectMemberList");
	}
}
