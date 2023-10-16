package com.kh.spring.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.member.model.service.MemberServiceImpl;
import com.kh.spring.member.model.vo.Member;

@Controller
public class MemberController {

   @Autowired 
   private MemberServiceImpl mService;
   
   // 로그인
   @RequestMapping("login.me")
   public String loginMember(Member m, Model model, HttpSession session) {
      
      Member loginMember = mService.loginMember(m);
            
      if(loginMember == null) {
         model.addAttribute("errorMsg", "로그인 실패");
         return "common/errorPage";
      } else {
         session.setAttribute("loginMember", loginMember);
         return "redirect:/";
         
         
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
   public String insertMember(Member m ,MultipartFile upfile , HttpSession session , Model model , MultipartFile[] upfile2) {
	  System.out.println(upfile);
      System.out.println(m);
      if(!upfile.getOriginalFilename().equals("")) {

    	  	String changeName = saveFile(upfile , session);
			System.out.println(changeName);

		}

      return null ;
   }
   
   
	public String saveFile(MultipartFile upfile, HttpSession session) { //리팩토링 작업이라고 한다.
		String originName = upfile.getOriginalFilename();
		//"20231004154607"
		String currentTime = new SimpleDateFormat("yyyyMMddhhmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);//5자리 랜덤값
		String ext =originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime+ ranNum + ext ; //새로운 이름
		//업로드 시키고자 하는 폴더의 물리적 경로를 알아내보자
		String savePath = session.getServletContext().getRealPath("resources/uploadFiles/");
		//슬래쉬는 webapp
		//외우거라 넹
		try {
			upfile.transferTo(new File(savePath + changeName)); //io 라서 예외처리 실제 저장하는중
		} catch (IllegalStateException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		return changeName;
	}
	
   
   
   
   
   
   //회원가입중 아이디체크 Ajax
   @ResponseBody
   @RequestMapping("idCheck.me")
      public String idCheck(String checkId) {
        
         int result = mService.idCheck(checkId);
         checkId.toLowerCase();
 
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
   

   
}