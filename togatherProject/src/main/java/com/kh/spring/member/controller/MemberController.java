package com.kh.spring.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
   public String insertMember(Member m) {
      System.out.println(m.getMemName());
      return null ;
   }
   //회원가입중 아이디체크 Ajax
   @ResponseBody
   @RequestMapping("idCheck.me")
      public String idCheck(String checkId) {
        
         int result = mService.idCheck(checkId);
         checkId.toLowerCase();
         System.out.println(checkId);
         System.out.println(result);
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
   
   // 내모임 리스트 조회
   @RequestMapping(value = "myclass.me")
   public String selectMyClass() {
      
      return "";
   }
   
}