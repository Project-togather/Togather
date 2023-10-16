package com.kh.spring.club.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.club.model.vo.Club;

@Repository
public class ClubDao {
	
	public ArrayList<Club> selectSocialList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("clubMapper.selectSocialList");
	}
	
}
