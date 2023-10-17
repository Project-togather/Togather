package com.kh.spring.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.attachment.model.vo.Attachment;
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
	public int insertMember(Member m) {
		int result = mDao.insertMember(sqlSession, m);
		return result;
	}

	
	/**
	 *회원번호 가져오기
	 */
	@Override
	public String bringMemNo(Member m) {
		String MemNo = mDao.bringMemNo(sqlSession, m);
		return MemNo;
	}

	/**
	 *첨부파일 테이블에 프사넣기
	 */
	@Override
	public int insertProfileImage(Attachment at) {
		int result = mDao.insertProfileImage(sqlSession , at);
		return result;
	}
	//프사가져오기
	@Override
	public Attachment getProfileImg(String memNo) {
		Attachment pImg = mDao.getProfileImg(sqlSession,memNo);
		return pImg;
	}
	//프로필메세지 넣기 업데이트
	@Override
	public int insertMsg(Member m) {
		int result = mDao.insertMsg(sqlSession, m);
		return result;
	}
	//취향넣기
	@Override
	public int insertInterest(int inNo) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
