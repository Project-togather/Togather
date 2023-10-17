package com.kh.spring.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
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
    	 //System.out.println("컨트롤러에서 받아오자 " + pImg);
         //System.out.println("세션에 저장");

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
   
   //마이페이지이동
   @RequestMapping(value = "mypage.me")
   public String myPage() {
      return "member/myPage";
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
   
   
	public String[] saveFile(MultipartFile upfile, HttpSession session) { //리팩토링 작업이라고 한다.
		String originName = upfile.getOriginalFilename();
		//"20231004154607"
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

   // 내모임 페이지 이동
   @RequestMapping(value = "myclass.pa")
   public String myClassPage() {
      return "member/myClassPage";
   }
   
   
   
   @RequestMapping(value="profile.me")
   public String insertProfile(HttpServletRequest request , String memNo , String profileMessage , HttpSession session) {
	   //System.out.println(memNo);
	   //System.out.println(profileMessage);
	   String arr [] = request.getParameterValues("interest"); 
	   int interArr[] = new int [arr.length];
	   for(int i = 0 ; i < arr.length ; i ++) {
		   //System.out.println(arr[i]);
	   }
	   for(int i = 0 ; i < arr.length ; i ++) {
		   interArr[i] = Integer.parseInt(arr[i]);
	   }
	   
	   
	   
	   Member m = new Member();
	   m.setMemNo(memNo);
	   m.setMsg(profileMessage);
	   //프로필 한마디를 넣어보아요
	   
	   //System.out.println("DB로 갈 m " + m);
	   int result1 = mService.insertMsg(m);

	   //DB 에 취향을 넣어봅시다. 프로필 한마디도 넣어야함
	   int result2 = 0 ; 
	   for(int i = 0 ; i < interArr.length ; i ++) {
		  MemInterest mi = new MemInterest();
		  mi.setMemNo(memNo);
		  mi.setInNo(interArr[i]);
		  //System.out.println("DB로갈 mi" + mi);
		  result2 = mService.insertInterest(mi);
		  
	   }
	   if(result1 * result2 != 0) {
		   session.setAttribute("alertMsg", "가입을 축하드립니다!");
		   return "redirect:/";
	   }else {
		   return "common/errorPage";
	   }
   }
  
}