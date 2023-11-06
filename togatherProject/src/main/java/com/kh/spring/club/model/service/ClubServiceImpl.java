package com.kh.spring.club.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.QuitReason.model.vo.QuitReason;
import com.kh.spring.alarm.model.vo.Notification;
import com.kh.spring.attachment.model.vo.Attachment;
import com.kh.spring.club.model.dao.ClubDao;
import com.kh.spring.club.model.vo.Club;
import com.kh.spring.feed.model.vo.Feed;
import com.kh.spring.feed.model.vo.Feed;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.myClass.model.vo.MyClass;
import com.kh.spring.reply.model.vo.Reply;

@Service
public class ClubServiceImpl implements ClubService {
	
	@Autowired
	private ClubDao cDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Club> selectSocialList() {
		return cDao.selectSocialList(sqlSession);
	}

	@Override
	public ArrayList<Club> selectClubList() {
		return cDao.selectClubList(sqlSession);
	}

	@Override
	public ArrayList<Club> selectChallengeList() {
		return cDao.selectChallengeList(sqlSession);
	}
	
	@Override
	public ArrayList<Club> selectOneDayList() {
		return cDao.selectOneDayList(sqlSession);
	}

	@Override
	public ArrayList<Club> selectMyClassList(Member m) {
		return cDao.selectMyClassList(sqlSession, m);
	}

	@Override
	public Club selectClassDetail(MyClass mc) {
		return cDao.selectClassDetail(mc, sqlSession);
	}

	@Override
	public int insertClass(Club c) {
		return cDao.insertClass(c, sqlSession);
	}

	@Override
	public int insertImg(Attachment at) {
		return cDao.insertImg(at, sqlSession);
	}

	@Override
	public int insertMyClass(Club c) {
		return cDao.insertMyClass(c, sqlSession);
	}

	@Override
	public int insertReply(Reply r) {
		return cDao.insertReply(r, sqlSession);
	}

	@Override
	public ArrayList<Reply> selectReplyList(String classNo) {
		return cDao.selectReplyList(classNo, sqlSession);
	}

	@Override
	public ArrayList<Reply> selectCreplyList(String classNo) {
		return cDao.selectCreplyList(classNo, sqlSession);
	}

	@Override
	public int insertReReply(Reply r) {
		return cDao.insertReReply(r, sqlSession);
	}

	@Override
	public int checkStatus(MyClass c) {
		return cDao.checkStatus(c, sqlSession);
	}

	@Override
	public int checkType(MyClass c) {
		return cDao.checkType(c, sqlSession);
	}

	@Override
	public int enterClass(MyClass c) {
		return cDao.enterClass(c, sqlSession);
	}
	
	@Override
	public int quitClass(QuitReason qr) {
		return cDao.quitClass(qr, sqlSession);
	}

	@Override
	public int likeClass(MyClass c) {
		return cDao.likeClass(c, sqlSession);
	}

	@Override
	public int unlikeClass(MyClass c) {
		return cDao.unlikeClass(c, sqlSession);
	}

	@Override
	public int checkLike(MyClass c) {
		return cDao.checkLike(c, sqlSession);
	}

	@Override
	public int deleteClass(String classNo) {
		return cDao.deleteClass(classNo, sqlSession);
	}

	@Override
	public ArrayList<Member> classMemberList(MyClass c) {
		return cDao.classMemberList(c, sqlSession);
	}

	@Override
	public int selectPayPrice(MyClass c) {
		return cDao.selectPayPrice(c, sqlSession);
	}

	@Override
	public int admitEnrollMember(MyClass c) {
		return cDao.admitMember(c, sqlSession);
	}

	@Override
	public int refuseEnrollMember(MyClass c) {
		return cDao.refuseMember(c, sqlSession);
	}

	@Override
	public ArrayList<Club> selectCategoryList(Club c) {
		return cDao.selectCategoryList(sqlSession, c);
	}

	@Override
	public ArrayList<Member> selectImgList(Club c) {
		return cDao.selectImgList(sqlSession, c);
	}

	@Override
	public ArrayList<Feed> feedLists() {
		return cDao.feedLists(sqlSession);
	}


	@Override
	public ArrayList<Club> waitTypeClass(Club c) {
		return cDao.waitTypeClass(sqlSession, c);
	}

	@Override
	public ArrayList<Club> likeClassList(Club c) {
		return cDao.likeClassList(sqlSession, c);
	}

	@Override
	public int updateClass(Club c) {
		return cDao.updateClass(c, sqlSession);
	}

	@Override
	public ArrayList<Attachment> selectClassAttachment(MyClass c) {
		return cDao.selectClassAttachment(c, sqlSession);
	}

	@Override
	public ArrayList<Feed> selectClassFeedList(MyClass c) {
		return cDao.selectClassFeedList(c, sqlSession);
	}

	@Override
	public ArrayList<Feed> selectClassFeedPfList(MyClass c) {
		return cDao.selectClassFeedPfList(c, sqlSession);

	}

	@Override
	public ArrayList<Feed> selectClassFeedTnList(MyClass c) {
		return cDao.selectClassFeedTnList(c, sqlSession);

	}

	@Override
	public int updateImg(Attachment at) {
		return cDao.updateImg(at, sqlSession);
	}

	@Override
	public ArrayList<Club> selectSimilarList(MyClass c) {
		return cDao.selectSimilarList(c, sqlSession);
	}

	@Override
	public ArrayList<Attachment> selectClassTnList(MyClass c) {
		return cDao.selectClassTnList(c, sqlSession);
	}

	@Override
	public Member selectMrUserNo(Reply r) {
		return cDao.selectMrUserNo(r, sqlSession);
	}


}
