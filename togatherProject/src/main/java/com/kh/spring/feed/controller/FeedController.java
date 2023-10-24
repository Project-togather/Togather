package com.kh.spring.feed.controller;

import java.util.ArrayList;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.spring.attachment.model.vo.Attachment;
import com.kh.spring.feed.model.service.FeedServiceImpl;
import com.kh.spring.feed.model.vo.Feed;
import com.kh.spring.member.model.service.MemberServiceImpl;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.meminterest.model.vo.MemInterest;
import com.kh.spring.reply.model.vo.Reply;

@Controller
public class FeedController {
	
	@Autowired
	private FeedServiceImpl fService;
	
	@Autowired
	private MemberServiceImpl mService;
	
	
	//피드번호로 피드 디테일 조회
	@RequestMapping(value = "feedDetail.fe")
	public String selectFeedDetail(String feNo , HttpServletRequest request , HttpSession session) {
		//일단 기본적인 피드가져오고
		Feed f = fService.selectFeedDetail(feNo);
		System.out.println(f);
		//feNo 로 attachment 에서 사진 가져오자
		ArrayList<Attachment> atList = fService.selectFeedDetailImgList(feNo);
		//for (int i = 0 ; i < atList.size() ; i ++) {
		//	System.out.println(atList.get(i));
		//}
		//잘가져왔네 그럼 이제 담자 
		request.setAttribute("f", f);
		request.setAttribute("atList", atList);
		//맴버 관심사 한번 더 가져와보자
		  //관심사 가져오기
		
		  ArrayList<MemInterest> mi = mService.getMemInterest(f.getFeWriter());
		 
		  String [] interArr = new String [mi.size()];
		   for (int i = 0 ; i < mi.size() ; i ++) {
			 if(mi.get(i).getInNo() == 1) { 
				 interArr[i] = "Music & Art" + "🎨" ;
			 }else if (mi.get(i).getInNo() == 2) {
				 interArr[i] = "Activity 🥅";
			 }else if (mi.get(i).getInNo() == 3) {
				 interArr[i] = "Food & Drink 🍻";
			 }else if (mi.get(i).getInNo() == 4) { 
				 interArr[i] = "Hooby 📸";
			 }else if (mi.get(i).getInNo() == 5) {
				 interArr[i] = "Party 🎉";
			 }else if (mi.get(i).getInNo() == 6) {
				 interArr[i] = "Date 💄";
			 }else if (mi.get(i).getInNo() == 7) {
				 interArr[i] = "InvestMent 💸";
			 }else {
				 interArr[i] = "Foreign Language 💬 ";
			 }
		  }
		   request.setAttribute("interArr", interArr);
		   //관심사도 덤으로 담아보자
		
		
		
		return "member/feedDetailView" ; 
	}
	
	

	
	//피드 댓글등록
	@ResponseBody
	@RequestMapping (value = "insertFeedReply.re")
	public String insertFeedReply(String rvContent , String refFno , String memNo) {
		Reply r = new Reply();
		r.setRvContent(rvContent);
		r.setRefFno(refFno);
		r.setMemNo(memNo);
		//System.out.println(r);
		int result = fService.insertFeedReply(r);
		
		if (result != 0) {
			return "YYYYY";
		}else {
			return "YYYYN"; 
		}
		
	}	
	//피드 댓글조회
	@ResponseBody
	@RequestMapping (value = "showFeedReply.re" , produces="application/json ; charset=UTF-8")
	public String showFeedReply(String feNo) {
		System.out.println(feNo);
		ArrayList<Reply> rList = fService.showFeedReply(feNo);
		ArrayList<Reply> toRlist = new ArrayList<Reply>();
		for(int i = 0 ; i <rList.size() ; i ++ ) {
			String memNo = rList.get(i).getMemNo();
			//맴버 닉네임하고 사진을 가져와야함
			Member m = fService.selectReplyMember(memNo);
			//가져와주고 rList 에 세팅 
			rList.get(i).setNickName(m.getNickName());
			rList.get(i).setImg(m.getImg());
		}
		return new Gson().toJson(rList);
	}
	
}
