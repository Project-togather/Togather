package com.kh.spring.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.attachment.model.vo.Attachment;
import com.kh.spring.feed.model.vo.Feed;
import com.kh.spring.follow.model.vo.Follow;
import com.kh.spring.interest.model.vo.Interest;
import com.kh.spring.member.model.service.MemberServiceImpl;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.meminterest.model.vo.MemInterest;

@Controller
public class MemberController {

   @Autowired 
   private MemberServiceImpl mService;
   
   //로그인폼 이동
   @RequestMapping("loginForm.me")
   public String loginForm() {
	   return "member/loginForm";
   }
   
   
   // 로그인
   @RequestMapping("login.me")
   public String loginMember(Member m, Model model, HttpSession session) {
	  //System.out.println("여기오냐?");
      Member loginMember = mService.loginMember(m);
      

      if(loginMember != null) {
    	 //System.out.println(loginMember);
    	 Attachment pImg = mService.getProfileImg(loginMember.getMemNo());
    	 System.out.println("일반로그인");
    	 //System.out.println("컨트롤러에서 받아오자 " + pImg);
         //System.out.println("세션에 저장");
    	 ArrayList<Member> clType = mService.selectClType(m);
    	 
    	 System.out.println("쏄탑 : " + clType);
    	  
    	 session.setAttribute("clType", clType);
         session.setAttribute("loginMember", loginMember);
         session.setAttribute("pImg", pImg);
         session.setAttribute("alertMsg", "어서오십시오");
         return "redirect:/";
      } else {
    	
    	  model.addAttribute("errorMsg", "로그인 실패");
          return "common/errorPage";
      }
      
   }
   
   // 로그아웃
   @RequestMapping("logout.me")
   public String logoutMember(HttpSession session) {
      session.invalidate();
      return "redirect:/";
   }
   
   //회원가입폼 이동
   @RequestMapping("enrollForm.me")
   public String enrollForm() {
      return "member/memberEnrollForm";
   }
   
   //회원가입
   @RequestMapping("insertMember.me")
   public String insertMember(Member m ,MultipartFile upfile , HttpSession session , Model model , MultipartFile[] upfile2 , HttpServletRequest request) {
	  //System.out.println(upfile);
      //System.out.println(m);
	   
      String changeName ="";
      String originName = upfile.getOriginalFilename();
      String savePath = "";
      String filePath = "";
      
      if(!upfile.getOriginalFilename().equals("")) {
    	  	 String arr[] = saveFile(upfile , session);
    	  	 //파일저장하고 경로좀 받아오자
    	  	 changeName = arr[0];
    	  	 savePath = arr[1];
    	  	 filePath = "resources/uploadFiles/"+changeName;
			//System.out.println(changeName);
    	  	 //System.out.println(filePath);
		}
      //먼저 member를 insert하고
      m.setImg(filePath);
      int result1 = mService.insertMember(m);
      
      //memberNo 를 가져와서
     
      String memNo = mService.bringMemNo(m);

      
      
      
      
      //파일을 attach에 insert하면 됨
      Attachment at = new Attachment();
      at.setRefFno(memNo);
      at.setUpdateName(changeName);
      at.setOriginName(originName);
      at.setFilePath(filePath);
      //System.out.println(at);
      
      int result2 = mService.insertProfileImage(at);
      
      if(result1 * result2 != 0 ) {
    	  request.setAttribute("memNo", memNo);
    	  session.setAttribute("alertMsg","이제 취향을 알아볼까요?");
    	  return "member/chooseInterest";
      }else {
    	  System.out.println("실패");
    	  return "common/errorPage";
      }

   
   }
   
   
	public String[] saveFile(MultipartFile upfile, HttpSession session) { //리팩토링1
		String originName = upfile.getOriginalFilename();
		
		String currentTime = new SimpleDateFormat("yyyyMMddhhmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);//5자리 랜덤값
		String ext =originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime+ ranNum + ext ; //새로운 이름
		//업로드 시키고자 하는 폴더의 물리적 경로를 알아내보자
		String savePath = session.getServletContext().getRealPath("resources/uploadFiles/");
		
		//System.out.println("savePath 제작중" + savePath);
		//슬래쉬는 webapp
		//외우거라 넹
		try {
			upfile.transferTo(new File(savePath + changeName)); //io 라서 예외처리 실제 저장하는중
		} catch (IllegalStateException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		String[] arr = {changeName ,savePath };
		return arr;
	}
	
   
   
   
   
   
   //회원가입중 아이디체크 Ajax
   @ResponseBody
   @RequestMapping("idCheck.me")
      public String idCheck(String checkId) {
        
         int result = mService.idCheck(checkId);
 
         if(result > 0) {
            return "NNNNN";
         }else {
            return "NNNNY";
         }      
      }

//   // 내모임 페이지 이동
//   @RequestMapping(value = "myclass.pa")
//   public String myClassPage() {
//      return "member/myClassPage";
//   }
   
   
   
   //취향선택인듯
   @RequestMapping(value="profile.me")
   public String insertProfile(HttpServletRequest request , String memNo , String profileMessage , HttpSession session) {
	   //System.out.println(memNo);
	   //System.out.println(profileMessage);
	   int result2 = 0 ; 
	   
	   String arr [] = request.getParameterValues("interest"); 
	   int interArr[] = new int [arr.length];
	   for(int i = 0 ; i < arr.length ; i ++) {
		   interArr[i] = Integer.parseInt(arr[i]);
	   }
	   
	   for(int i = 0 ; i < interArr.length ; i ++) {
		  MemInterest mi = new MemInterest();
		  mi.setMemNo(memNo);
		  mi.setInNo(interArr[i]);
		  //System.out.println("DB로갈 mi" + mi);
		  result2 = mService.insertInterest(mi);
		  
	   }
	   
	   Member m = new Member();
	   m.setMemNo(memNo);
	   m.setMsg(profileMessage);
	   //프로필 한마디를 넣어보아요
	   
	   //System.out.println("DB로 갈 m " + m);
	   int result1 = mService.insertMsg(m);

	   //DB 에 취향을 넣어봅시다. 프로필 한마디도 넣어야함
	
	   if(result1 * result2 != 0) {
		   session.setAttribute("alertMsg", "가입을 축하드립니다!");
		   return "redirect:/";
	   }else {
		   return "common/errorPage";
	   }
   }
   
   
   
   
   
   //마이페이지 관련 으어어어어어어어어어
   //마이페이지이동
   @RequestMapping(value = "mypage.me")
   public String myPage(HttpSession session , HttpServletRequest request ) {
	  
	  Member loginMember = (Member)session.getAttribute("loginMember");
	  String memNo = loginMember.getMemNo();
	  //관심사 가져오기
	  ArrayList<MemInterest> mi = mService.getMemInterest(memNo);
	 
	  if(mi != null) {
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
	  
	   
	   
	  //문화예술 1 액티비티2 푸드드링크3 취미4 파티소개팅5 동네친목6 제테크7 외국어8
	  request.setAttribute("interArr",interArr);
	  }
	  //나의 피드 불러오기
	  ArrayList<Feed> fList = mService.selectFeedList(memNo);
	 
	 
	  
	  
	  //다음은 feed_no 를 기준으로 썸네일을 불러오자
	  for(int i = 0 ; i < fList.size() ; i ++) {
		  String thumbFilePath = mService.selectThumbnail(fList.get(i).getFeNo());
		  fList.get(i).setThumbnail(thumbFilePath);
	  }
	  //System.out.println(fList);
	  
	  //다음은 팔로잉 팔로워를 불러워야함 둘다 리스트뽑아서 보내주자
	  ArrayList<Member> followingList = mService.getFollowingList(memNo);
	  ArrayList<Member> followerList = mService.getFollowerList(memNo);

	  //리퀘스트에 담자
	  request.setAttribute("followingList", followingList);
	  request.setAttribute("followerList", followerList);
	  
	  
	  request.setAttribute("fList", fList);
      return "member/myPage";
   }
   
   
   //피드 작성 이동폼
   @RequestMapping(value = "feedEnrollForm.me")
   public String feedEnrollForm() {
	   return "member/feedEnrollForm";
   }
   //피드작성
   @RequestMapping(value = "insertFeed.me")
   public String insertFeed(MultipartFile[] upfile , HttpServletRequest request , Feed f ,HttpSession session , Model model) {
	   System.out.println(f);
	   String feWriter = ((Member)session.getAttribute("loginMember")).getMemNo();
	   int result1 = 0 ;
	   int result2 = 0 ;
	   //피드 넣고 피드 번호 가져와야됨 좇같다
	   //이제 피드를 넣자
	   Feed feed = new Feed();
	   feed.setRefCno(f.getRefCno());
	   feed.setFeContent(f.getFeContent());
	   feed.setFeWriter(feWriter);
	   //ㅇㅋ 피드로 가셈
	   result1 = mService.insertFeed(feed);
	   //다녀왔어

	   //db에 4번 다녀오자
	   for (int i = 0 ; i< upfile.length ; i ++) {
		   //첨부파일이 null 이 아닐때 required 걸어놔서 null 일경우는 없지만
		   if(!upfile[i].getOriginalFilename().equals("")) { 
			   
			   String changeName ="";
			   String originName = upfile[i].getOriginalFilename();
			   String savePath = "";
			   String filePath = "";
			   String arr[] = saveFile(upfile[i] , session);
	    	  	 //파일저장하고 경로좀 받아오자
	    	   changeName = arr[0];
	    	   savePath = arr[1];
	    	   filePath = "resources/uploadFiles/"+changeName;
			   Attachment at = new Attachment();
			   
			   //at 생성하고 값 채워넣기
			  
			   
			   
	    	   at.setOriginName(originName);
	    	   at.setUpdateName(changeName);
	    	   at.setFilePath(filePath);
	    	   at.setCategory("FEED");
	    	   if(i == 0) { //썸네일 사진은 1로 세팅
	    		   at.setThumbnail(1);
	    	   }else { 
	    		   at.setThumbnail(0);
	    	   }
			   //db로 가보자고
	    	   result2 = mService.insertFeedImg(at);
	    	   //if(result2 !=0) {
	    	   //	   System.out.println("성공" + i);
	    	   // }
		   }
 
	   }
	   
	   if (result1 * result2 != 0) {
		   session.setAttribute("alertMsg", "피드가 성공적으로 작성되었습니다");
	        return "redirect:/mypage.me";
	   }else {
		   model.addAttribute("errorMsg", "피드작성 실패");
	       return "common/errorPage";
	   }

   }
   //팔로우기능
   @ResponseBody
   @RequestMapping(value = "requestFollw.me")
   public String requestFollw(Follow follow ,HttpSession session) {
	   //먼저 팔로우했나 안했나 검사부터 하자
	   int check = mService.checkFollow(follow);
	   if(check ==0){
	   String result = mService.insertFollow(follow) + "";
	   return result; 
	   }else {
		   return 2+"";
	   }
   }
   //언팔기능
   @ResponseBody
   @RequestMapping(value = "unFollow.me")
   public String unFollow(Follow follow ,HttpSession session) {
	   int result = mService.deleteFollow(follow);
	   return result+"" ;
   }
   
   //맴버 수정폼 이동
   //넘겨줄 값 닉네임 한마디 이미지인데.. 지금 생각해보니까 이미세션에 띄워져있네?
   @RequestMapping(value = "updateForm.me")
   public String memberUpdateForm() {
	   return "member/memberUpdateForm";
   }
   
   
   //맴버 수정
   @RequestMapping(value = "update.me")
   public String updateMember(Member m ,MultipartFile upfile , HttpSession session , Model model , MultipartFile[] upfile2 , HttpServletRequest request) {
		   	
	   String memNo = ((Member)session.getAttribute("loginMember")).getMemNo();
	   
	   
		    String oldImg =  ((Member)session.getAttribute("loginMember")).getImg(); //수정전 파일
		    
		   
		    String interArrS [] = request.getParameterValues("interest"); 
		    
		  
		    
		    
		   //사진부터 수정해볼까나

	      String changeName ="";
	      String originName = upfile.getOriginalFilename();
	      String savePath = "";
	      String filePath = "";
	      
	      
	      
	      if(!upfile.getOriginalFilename().equals("")) {
	    	  if( (oldImg.charAt(0))!= 'h' ) { //구글로그인은 이미지가 없단말야
	    		  new File(session.getServletContext().getRealPath(oldImg)).delete();//기존파일 지우고
	    	  }
	    	  	 String arr[] = saveFile(upfile , session);
	    	  	 //파일저장하고 경로좀 받아오자
	    	  	 changeName = arr[0];
	    	  	 savePath = arr[1];
	    	  	 filePath = "resources/uploadFiles/"+changeName;
				//System.out.println(changeName);
	    	  	 //System.out.println(filePath);
			}
	     
	      
	      
	      
	      //먼저 member insert합시다
	      Member upMem = new Member();
	      upMem.setMemNo(memNo);
	      upMem.setNickName(m.getNickName());//새로운 닉네임
	      upMem.setMsg(m.getMsg());	      //새로운 메세지
	      
	      if(!upfile.getOriginalFilename().equals("")) { //새로올라온 파일이 있을때 이야기임
	      upMem.setImg(filePath);//새로운 이미지주소
	      }else{
	    	 upMem.setImg(oldImg);
	      }
	      
	      int result1 = mService.updateMember(upMem);
	      
	      //attachment 에 넣고

	      //파일을 attach에 insert하면 됨
	      if(!upfile.getOriginalFilename().equals("")) {
		      Attachment at = new Attachment();
		      at.setRefFno(memNo);
		      at.setUpdateName(changeName);
		      at.setOriginName(originName);
		      at.setFilePath(filePath);
	      int result2 = mService.updateProfileImg(at);
	      }
	      //interarr 도 넣어야함 먼저 전부 삭제후 새로 넣는식으로 하자
	      int result3 = mService.deleteInterest(memNo);
	      
	      //삭제했으면 넣어라
	      
	      int result4 = 0 ; 
	      if(interArrS!=null){
			    int interArr[] = new int [interArrS.length];
				   for(int i = 0 ; i < interArrS.length ; i ++) {
					   interArr[i] = Integer.parseInt(interArrS[i]);
				   }
				   for(int i = 0 ; i < interArr.length ; i ++) {
						  MemInterest mi = new MemInterest();
						  mi.setMemNo(memNo);
						  mi.setInNo(interArr[i]);
						  //System.out.println("DB로갈 mi" + mi);
						  result4 = mService.insertInterest(mi);
					   }  
			}
	      
		   
		
		  
		  //내가 구조를 이상하게 짜놔서 다시 띄워줘야함 그냥 세션을 싹 지우고 다시 띄워주자
		  
		  //다시 로그인 해야하나봐
		  Member nowLogin = (Member)session.getAttribute("loginMember");//현재 로그인한 맴버 정보
		  Member reLoginMem = new Member();//새로 세션에 넣어줄 로그인 정보
		 
		  reLoginMem.setMemId(nowLogin.getMemId());
		  reLoginMem.setMemPwd(nowLogin.getMemPwd());
		  Member loginMember = mService.loginMember(reLoginMem);
		  
		  
		  session.setAttribute("loginMember",loginMember);
		  session.setAttribute("pImg", filePath);
		  return "redirect:/mypage.me";

   }
   

   
  
}