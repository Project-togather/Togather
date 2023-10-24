package com.kh.spring.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.attachment.model.vo.Attachment;
import com.kh.spring.feed.model.vo.Feed;
import com.kh.spring.follow.model.vo.Follow;
import com.kh.spring.member.model.dao.MemberDao;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.meminterest.model.vo.MemInterest;


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
	public int insertInterest(MemInterest mi) {
		int result = mDao.insertInterest(sqlSession , mi);
		return result;
	}

	//관심사 가져오기
	@Override
	public ArrayList<MemInterest> getMemInterest(String memNo) {
		
		ArrayList<MemInterest> mi = mDao.getMemInterest(sqlSession, memNo);

		return mi;
	}
	
	//피드 사진들 저장하기
	@Override
	public int insertFeedImg(Attachment at) {
		int result = mDao.insertFeedImg(sqlSession, at);
		return result;
	}
	
	//피드작성
	@Override
	public int insertFeed(Feed f) {
		return mDao.insertFeed(sqlSession ,f);
		
	}
	
	//피드리스트 조회
	@Override
	public ArrayList<Feed> selectFeedList(String memNo) {
		ArrayList<Feed> feedList = mDao.selectFeedList(sqlSession , memNo);
		return feedList;
	}
	
	//썸네일 사진 가져오기
	@Override
	public String selectThumbnail(String feNo) {
		return mDao.selectThumbnail(sqlSession , feNo);
	}

	@Override
	public ArrayList<Member> selectClType(Member m) {
		return mDao.selectClType(m, sqlSession);
	}
	
	//팔로우기능
	@Override
	public int insertFollow(Follow f) {
		return mDao.insertFollow(sqlSession, f);
		
	}
	
	//팔로우 체크
	@Override
	public int checkFollow(Follow f) {
		return mDao.checkFollow(sqlSession, f);
		
	}

	
	//팔로잉리스트
	@Override
	public ArrayList<Member> getFollowingList(String memNo) {
		
		return mDao.getFollowingList(sqlSession, memNo);
	}
	//팔로워리스트
	@Override
	public ArrayList<Member> getFollowerList(String memNo) {
		
		return mDao.getFollowerList(sqlSession, memNo);
	}
	
}
