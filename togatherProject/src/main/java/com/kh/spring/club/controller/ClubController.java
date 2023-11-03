package com.kh.spring.club.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.spring.QuitReason.model.vo.QuitReason;
import com.kh.spring.alarm.model.service.NotificationServiceImpl;
import com.kh.spring.alarm.model.vo.Notification;
import com.kh.spring.attachment.model.vo.Attachment;
import com.kh.spring.club.model.service.ClubServiceImpl;
import com.kh.spring.club.model.vo.Club;
<<<<<<< HEAD
import com.kh.spring.feed.model.vo.Feed;
=======
import com.kh.spring.feed.model.service.FeedServiceImpl;
import com.kh.spring.feed.model.vo.Feed;
import com.kh.spring.member.model.service.MemberService;

>>>>>>> 8a8bae8ac3393724bbe82c3ede8ce47172fc22ff
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.reply.model.vo.Reply;
import com.kh.spring.myClass.model.vo.MyClass;

@Controller
public class ClubController {
	
	@Autowired
	private NotificationServiceImpl nService;

	@Autowired
	private ClubServiceImpl cService;
	
	@Autowired
	private FeedServiceImpl fService;
	
	/**
	 * 이미지 경로 저장
	 */
	public String saveFile(MultipartFile upfile, HttpSession session) {
		String originName = upfile.getOriginalFilename(); 
		
		String currentTime = new SimpleDateFormat("yyyyMMDDHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000); 
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String updateName = currentTime + ranNum + ext; 
		
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
			try {
				upfile.transferTo(new File(savePath + updateName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
		return updateName;
	}
	
	/**
	 * 전체 리스트 조회 (소셜링, 클럽, 챌린지, 원데이, 피드?)
	 */
	@RequestMapping(value= "index.do")
	public String selectClassList(Club c, Attachment at, MultipartFile upfile, HttpSession session, Model model) {
		
		ArrayList<Club> list = cService.selectClassList();
		// 피드 리스트 조회 추가!
		ArrayList<Feed> list1 = fService.selectListFeeds();
		
		if(list != null) {
			session.setAttribute("list1", list1);
			session.setAttribute("list", list);
			return "main";
		}else {
			model.addAttribute("errorMsg", "실패!?");
			return "/";
		}
	}
	
	// 메인 페이지 이동
	@RequestMapping(value = "main.pa")
	public String mainPage() {
		return "main";
	}
	
	// 라운지 페이지 이동
	@RequestMapping(value = "lounge.pa")
	public String loungePage(HttpSession session, Model model) {
		ArrayList<Feed> list = cService.feedLists();
		
		if(list != null) {
			
			session.setAttribute("list", list);
			return "class/loungePage";
		}else {
			model.addAttribute("errorMsg", "실패!?");
			return "/";
		}
	}
	
    // 내모임 리스트 조회
    @RequestMapping(value="myclass.pa")
    public String myclassList(Member m, HttpSession session, Model model) {
    	 m = (Member)session.getAttribute("loginMember");
    	 
    	 ArrayList<Club> list = cService.selectMyClassList(m);
		 if(list != null) {
			 session.setAttribute("list", list);
			 return "class/myClassPage";
		 }else {
			 model.addAttribute("errorMsg", "실패!?");
			 return "/";
		 }
    }
    
    // 내모임 진행상황에 따른 페이지 || 찜
    @ResponseBody
    @RequestMapping(value="myclass.list", produces = "application/json; charset=utf-8")
    public String waitTypeClass(Club c, HttpSession session, Model model) {
    	
	   ArrayList<Club> list = cService.waitTypeClass(c);
	   
		 if(list != null) {
			 session.setAttribute("list", list);
			 return new Gson().toJson(list);
		 }else {
			 model.addAttribute("errorMsg", "실패!?");
			 return "/";
		 }
    }
    
    // 내 즐겨찾기 조회
    @ResponseBody
    @RequestMapping(value="likeclass.list", produces = "application/json; charset=utf-8")
    public String likeClassList(Club c, HttpSession session, Model model){
    	
	    ArrayList<Club> list = cService.likeClassList(c);
	    
		if(list != null) {
			session.setAttribute("list", list);
			return new Gson().toJson(list);
		}else {
			model.addAttribute("errorMsg", "실패!?");
			return "/";
		}
    }
	
	/**
	 * 소셜링 전체 조회
	 */
	@RequestMapping("social.pa")
	public String selectSocialList(Club c, Attachment at, MultipartFile upfile, HttpSession session, Model model) {
		ArrayList<Club> list = cService.selectSocialList();
		
		ArrayList<Member> imgList1 = new ArrayList<Member>();
		if(list != null) {
			for(int i=0; i<list.size(); i++) {
				c.setClassNo(list.get(i).getClassNo());
				ArrayList<Member> imgList = cService.selectImgList(c);
				imgList1.addAll(0, imgList);
				
				if(!imgList.isEmpty()) {
					session.setAttribute("imgList1", imgList1);
				}
			}
			
			session.setAttribute("list", list);
			return "class/socialPage";
		}else {
			model.addAttribute("errorMsg", "실패!?");
			return "/";
		}
	}
	
	/**
	 * 카테고리별 리스트조회
	 */
	@ResponseBody
	@RequestMapping(value="category.list", produces = "application/json; charset=utf-8")
	public String selectCategoryList(HttpSession session, Model model, Club c) {
		ArrayList<Club> list = cService.selectCategoryList(c);
		
		if(list != null) {
			for(int i=0; i<list.size(); i++) {
				c.setClassNo(list.get(i).getClassNo());
				
				ArrayList<Member> imgList = cService.selectImgList(c);
				if(!imgList.isEmpty()) {
					session.setAttribute("imgList", imgList);
				}
			}
			
			session.setAttribute("list", list);
			return new Gson().toJson(list);
		}else {
			model.addAttribute("errorMsg", "실패!?");
			return "/";
		}
	}
	
	@RequestMapping("category.solist")
	public String socialCategory() {
		return "class/socialCategory";
	}
	
	@RequestMapping("category.cllist")
	public String clubCategory() {
		return "class/clubCategory";
	}
	
	@RequestMapping("category.chlist")
	public String challengeCategory() {
		return "class/challengeCategory";
	}
	
	@RequestMapping("category.onlist")
	public String onedayCategory() {
		return "class/onedayCategory";
	}
	
	/**
	 * 클럽 전체 조회
	 */
	@RequestMapping("club.pa")
	public String selectClubList(Club c, Attachment at, MultipartFile upfile, HttpSession session, Model model) {
		
		ArrayList<Club> list = cService.selectClubList();
		
		ArrayList<Member> imgList1 = new ArrayList<Member>();
		if(list != null) {
			for(int i=0; i<list.size(); i++) {
				c.setClassNo(list.get(i).getClassNo());
				ArrayList<Member> imgList = cService.selectImgList(c);
				imgList1.addAll(0, imgList);
				
				if(!imgList.isEmpty()) {
					session.setAttribute("imgList1", imgList1);
				}
			}
			
			session.setAttribute("list", list);
			return "class/clubPage";
		}else {
			model.addAttribute("errorMsg", "실패!?");
			return "/";
		}
	}
	
	/**
	 * 챌린지 전체 조회
	 */
	@RequestMapping("challenge.pa")
	public String selectChallengeList(Club c, Attachment at, MultipartFile upfile, HttpSession session, Model model) {
		
		ArrayList<Club> list = cService.selectChallengeList();
		
		ArrayList<Member> imgList1 = new ArrayList<Member>();
		if(list != null) {
			for(int i=0; i<list.size(); i++) {
				c.setClassNo(list.get(i).getClassNo());
				ArrayList<Member> imgList = cService.selectImgList(c);
				imgList1.addAll(0, imgList);
				
				if(!imgList.isEmpty()) {
					session.setAttribute("imgList1", imgList1);
				}
			}
			
			session.setAttribute("list", list);
			return "class/challengePage";
		}else {
			model.addAttribute("errorMsg", "실패!?");
			return "/";
		}
	}
	
	/**
	 * 원데이클래스 전체 조회
	 */
	@RequestMapping("oneday.pa")
	public String selectOneDayList(Club c, Attachment at, MultipartFile upfile, HttpSession session, Model model) {
		
		ArrayList<Club> list = cService.selectOneDayList();
		
		ArrayList<Member> imgList1 = new ArrayList<Member>();
		if(list != null) {
			for(int i=0; i<list.size(); i++) {
				c.setClassNo(list.get(i).getClassNo());
				ArrayList<Member> imgList = cService.selectImgList(c);
				imgList1.addAll(0, imgList);
				
				if(!imgList.isEmpty()) {
					session.setAttribute("imgList1", imgList1);
				}
			}
			
			session.setAttribute("list", list);
			return "class/onedayPage";
		}else {
			model.addAttribute("errorMsg", "실패!?");
			return "/";
		}
	}
	
	
	/**
	 * 모임등록 폼 이동 
	 */
	@RequestMapping("enrollForm.cl")
	public String classEnrollForm() {
		return "class/ClassEnrollForm";
	}
	
	
	@RequestMapping("enroll.cl")
	public String insertClass(Club c, Attachment at, MultipartFile upfile , HttpSession session , Model model) {

		System.out.println("클래스동록 : " + c);

		int result = cService.insertClass(c);
		
		if(!upfile.getOriginalFilename().equals("")) {
			
			String updateName = saveFile(upfile, session);
			at.setOriginName(upfile.getOriginalFilename());
			at.setUpdateName(updateName);
			at.setFilePath("resources/uploadFiles/" + updateName);
		}
		
		if(result > 0) {
			at.setCategory(c.getClType()+"");
			
			int result2 = cService.insertImg(at);
			
			if(result2 > 0) {
				session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
				return "redirect:/index.do";
			}else {
				model.addAttribute("errorMsg", "게시글 등록에 실패");
				return "common/errorPage";
			}
		}
		return null;
	}
	
	@RequestMapping("detail.cl")
	public String selectClassDetail(MyClass mc, Model model, HttpSession session) {
		
		/*
		if((Member)session.getAttribute("loginMember") != null) {
			Member loginMember = (Member)session.getAttribute("loginMember");
			mc.setMemNo(loginMember.getMemNo()); 			
		}
		*/

		mc.setClType(1);
		
		Club c = cService.selectClassDetail(mc);
		
		mc.setMemNo(c.getMemNo());
		
		ArrayList<Attachment> atList = cService.selectClassAttachment(mc); // 모임 프사, 썸네일 조회
		ArrayList<Feed> fList = cService.selectClassFeedList(mc); // 모임 피드
		ArrayList<Feed> fpfList = cService.selectClassFeedPfList(mc); // 피드 프로필사진
		ArrayList<Feed> ftnList = cService.selectClassFeedTnList(mc); // 피드 썸네일
		ArrayList<Member> list = cService.classMemberList(mc); // 모임 가입 명단
		
		
		if(c.getClassApproval().equals("Y")) {
			c.setClassApproval("승인제");
		} else {
			c.setClassApproval("선착순");
		}
		
		model.addAttribute("list", list);
		model.addAttribute("atList", atList);
		model.addAttribute("fList", fList);
		model.addAttribute("fpfList", fpfList);
		model.addAttribute("ftnList", ftnList);
		model.addAttribute("c", c);
		return "class/classDetailView";
	}
	
	@ResponseBody
	@RequestMapping("enroll.rv")
	public String insertReply(Reply r, Member m) {
		
		nService.send(m, r, "댓글이 등록되었습니다!");

		int result = cService.insertReply(r);
		return result>0 ? "success" : "fail";
		

	}

	@ResponseBody
	@RequestMapping(value="rlist.cl", produces = "application/json; charset=UTF-8")
	public String selectReplyList(String cno){
		ArrayList<Reply> rlist = cService.selectReplyList(cno);
		return new Gson().toJson(rlist);

	}
	
	@ResponseBody
	@RequestMapping(value="crlist.cl", produces = "application/json; charset=UTF-8")
	public String selectCreplyList(String cno){
		ArrayList<Reply> rlist = cService.selectCreplyList(cno);
		return new Gson().toJson(rlist);

	}
	
	@ResponseBody
	@RequestMapping("enrollRe.rv")
	public String insertReReply(Reply r) {
		int result = cService.insertReReply(r);
		return result>0 ? "success" : "fail";

	}
	
	@ResponseBody
	@RequestMapping("checkStatus.cl")
	public int checkStatus(MyClass c) {
		int result = cService.checkStatus(c);
		if(result > 0) {
			int type = cService.checkType(c);
			return type;
		} else {
			return 0;
		}
		
	}
	
	@ResponseBody
	@RequestMapping("enterClass.cl")
	public String enterClass(MyClass c) {
		
		int result = cService.enterClass(c);
		return result>0 ? "success" : "fail";
	}
	
	@ResponseBody
	@RequestMapping("quitClass.cl")
	public String quitClass(QuitReason qr) {
		
		System.out.println("퀵 : " + qr);
		
		int result = cService.quitClass(qr);
		return result>0 ? "success" : "fail";
	}
	
	@ResponseBody
	@RequestMapping("likeClass.cl")
	public String likeClass(MyClass c) {
		
		int check = cService.checkLike(c);
		int result = 0;
		if(check > 0) {
			result = unlikeClass(c);
			return "delete";
		} else {
			result = cService.likeClass(c);		
			return "insert";
		}

	}
	
	@ResponseBody
	@RequestMapping("unlikeClass.cl")
	public int unlikeClass(MyClass c) {
		int result = cService.unlikeClass(c);
		return result;
	}
	
	@ResponseBody
	@RequestMapping("checkLike.cl")
	public int checkLike(MyClass c) {
		int result = cService.checkLike(c);
		return result;
	}
	
	@RequestMapping("classUpdateForm.cl")
	public String classUpdateForm(MyClass mc, Model model) {
		
		Club c = cService.selectClassDetail(mc);
		model.addAttribute("c", c);
		
		return "class/classUpdateForm";
	}
	
	@RequestMapping("deleteClass.cl")
	public String deleteClass(String cNo, Model model) {
		
		int result = cService.deleteClass(cNo);
		
		if(result > 0) {
			return "redirect:/";			
		} else {
			model.addAttribute("errorMsg", "게시글 등록에 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("memberListPage.cl")
	public String memberListPage(MyClass mc, Model model) {
		Club c = cService.selectClassDetail(mc);
		System.out.println("멤리 : " + c);
		model.addAttribute("c", c);
		return "class/classMemberList";
	}
	
	@ResponseBody
	@RequestMapping("classMemberList.cl")
	public ArrayList<Member> classMemberList(MyClass c) {
		ArrayList<Member> list = cService.classMemberList(c);
		return list;
		
	}
	
	@RequestMapping("quitClassForm.cl")
	public String quitClassForm(MyClass mc, Model model) {
		
		Club c = cService.selectClassDetail(mc);
		int price = cService.selectPayPrice(mc);
		
		model.addAttribute("price", price);
		model.addAttribute("c", c);
		return "class/quitClassForm";
		
	}

	@RequestMapping("roadView.cl")
	public String roadView(String latitude, String longitude, Model model) {

		model.addAttribute("latitude", latitude);
		model.addAttribute("longitude", longitude);
		return "class/classRoadView";
	}
	
	@ResponseBody
	@RequestMapping(value="admitClass.me", produces = "application/json; charset=UTF-8")
	public int admitClass(MyClass c) {
		
		System.out.println("c:" + c);
		
		int result = cService.admitEnrollMember(c);
		
		if(result>0) {
			return result;
		} else {
			return result;
		}
	}
	
	@ResponseBody
	@RequestMapping(value="refuseClass.me", produces = "application/json; charset=UTF-8")
	public int refuseClass(MyClass c) {
		
		int result = cService.refuseEnrollMember(c);
		
		if(result>0) {
			return result;
		} else {
			return result;
		}
	}
	
	@RequestMapping("classDetailUpdateForm.cl")
	public String classDetailUpdateForm(MyClass mc, Model model) {
		Club c = cService.selectClassDetail(mc);
		
		model.addAttribute("c", c);
		return "class/classDetailUpdateForm";	
	}
	
	@RequestMapping("update.cl")
	public String updateClass(Club c, MyClass mc, Attachment at, MultipartFile upfile , HttpSession session , Model model) {
		int result = cService.updateClass(c);
		
		if(!upfile.getOriginalFilename().equals("")) {
			
			String updateName = saveFile(upfile, session);
			at.setOriginName(upfile.getOriginalFilename());
			at.setUpdateName("resources/uploadFiles/" + updateName);
			at.setFilePath(upfile.getOriginalFilename() + "resources/uploadFiles/" + updateName);
			at.setClassNo(c.getClassNo());
			
			System.out.println("at : " + at);
		}
		
		if(result > 0) {
			System.out.println("업데이트 성공1");
			
			at.setCategory(c.getClType()+"");
			
			int result2 = cService.insertImg(at);
			
			if(result2 > 0) {
				System.out.println("성공왓니");
				cService.selectClassDetail(mc);
				session.setAttribute("alertMsg", "성공적으로 게시글이 수정되었습니다.");
				return "class/classDetailView";
			}else {
				model.addAttribute("errorMsg", "게시글 등록에 실패");
				return "common/errorPage";
			}
		}
		return null;
	}
	
	
}
