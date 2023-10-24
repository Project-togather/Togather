package com.kh.spring.admin.memberclass.model.Dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.spring.club.model.vo.Club;
import com.kh.spring.common.model.vo.PageInfo;

@Repository
public class MemberClassDao {
	
	public int challengeListCount(SqlSession sqlsession) {
		return sqlsession.selectOne("adClassMapper.selectchallengeListCount");
	}
	
	public ArrayList<Club> challengeList(SqlSession sqlsession,PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlsession.selectList("adClassMapper.selectchallengeList",null, rowBounds);
	}

}
