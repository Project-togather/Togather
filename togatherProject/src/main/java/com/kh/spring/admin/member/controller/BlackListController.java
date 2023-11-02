package com.kh.spring.admin.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.admin.member.model.service.AdminServiceImpl;
import com.kh.spring.admin.member.model.vo.BlackList;
import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.common.template.Pagination;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.report.model.vo.Report;

@Controller
public class BlackListController {
	@Autowired
	private AdminServiceImpl Aservice;

			//블랙리스트 페이지 이동
			@RequestMapping("blacklist.bo")
			public ModelAndView blacklistPage(@RequestParam(value="cpage",defaultValue = "1") int currentPage,ModelAndView mv) {
				int  blackMemCount = Aservice.selectBlackListCount();
				
				PageInfo pi = Pagination.getPageInfo(blackMemCount, currentPage, 10, 10);
				//화면 리스트용 메서드
				
				ArrayList<BlackList> list = Aservice.selectBlackList(pi);
				
				if(list.size()>0) {
					mv.addObject("pi",pi).addObject("list",list).setViewName("admin/member/blacklist");
					
				}else {
					mv.addObject("pi",pi).addObject("list",list).setViewName("admin/member/blacklist");
					//mv.addObject("errorMsg", "블랙리스트조회실패");  
					//mv.setViewName("common/errorPage");
				}
				
				return mv;
			}
			
			//블랙리스트 아이디 체크
			@ResponseBody
			@RequestMapping ("idCheck.bl")
			public String idCheck(String checkId){
				int count = Aservice.idCheck(checkId);
				
				  if(count > 0) {
					  return "NNNNN"; 
				  }else{
					  return "NNNNY";
				  }
			}
				  
			//블랙리스트 추가하기
			@RequestMapping("insert.bl")
			public String insertblacklist(String userId,HttpSession session,Model model) {
				int result = Aservice.insertblackList(userId);
				
				if(result>0) {
					session.setAttribute("alertMsg", "성공적으로 블랙리스트가 등록되었습니다.");
					return "redirect:blacklist.bo";
				}else {
					model.addAttribute("errorMsg","블랙리스트 등록에 실패했습니다.");
					return "common/errorPage";
					
				}
			}
			
			@RequestMapping("black.de")
			public String updateBlackList(String memId,Model model, HttpSession session) {
				
				int result = Aservice.updateBlackList(memId);
				
				if(result>0) {
					session.setAttribute("alertMsg", "성공적으로 블랙리스트 해제되었습니다.");
					return "redirect:blacklist.bo";
				}else {
					model.addAttribute("errorMsg","블랙리스트 해제에 실패했습니다.");
					return "common/errorPage";
				}
			}
			
			@RequestMapping("throwComplain.bl")
			public String insertComplain(Report r,MultipartFile upfile, HttpSession session ,Model model) {
				//System.out.println(r);
				if(!upfile.getOriginalFilename().equals("")) {
					String changeName = saveFile(upfile, session);
					
					r.setOriginName(upfile.getOriginalFilename());
					r.setUpdateName("/resources/assets/bluploadFiles/" + changeName);
					
					
				}
			
				int result = Aservice.insertReport(r);
				
				if(result>0) {
					session.setAttribute("alertMsg", "성공적으로 신고가 완료되었습니다.");
					return "redirect:complain.bl";
				}else {
					model.addAttribute("errorMsg","게시글 등록에 실패했습니다.");
					return "common/errorPage";
				}
			}
			
			
			public String saveFile(MultipartFile upfile, HttpSession session) {
				String originName = upfile.getOriginalFilename(); // 파일원본명
				//System.out.println(originName);

				//"20231004154607" (년월일시분초)
				String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); //"20231004154708"
				int ranNum = (int)(Math.random() *90000+10000); //5가지 랜덤값 생성
				String ext = originName.substring(originName.lastIndexOf("."));
				
				String changeName = currentTime + ranNum + ext;//20231004154607+5가지 랜덤값 생성+.확장자
			     //System.out.println(changeName);
				//업로드 시키고자 하는 폴더의 물리적인 경로를 알아내기
				String savePath = session.getServletContext().getRealPath("/resources/assets/bluploadFiles/");
				//System.out.println(savePath);
				try {
					upfile.transferTo(new File(savePath + changeName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}return changeName;
			}
			
			@RequestMapping("select.bl")
			public ModelAndView selectBlackList(@RequestParam(value="cpage",defaultValue = "1") int currentPage,ModelAndView mv) {
					int  reportCount = Aservice.selectReportCount();
					System.out.println(reportCount);
				
				PageInfo pi = Pagination.getPageInfo(reportCount, currentPage, 10, 10);
				//화면 리스트용 메서드
				
				ArrayList<Report> list = Aservice.selectReport(pi);
				System.out.println(list);
				if(list.size()>0) {
					mv.addObject("pi",pi).addObject("list",list).setViewName("admin/member/reportViewList");
					
				}else {
					mv.addObject("pi",pi).addObject("list",list).setViewName("admin/member/reportViewList");
					//mv.addObject("errorMsg", "블랙리스트조회실패");  
					//mv.setViewName("common/errorPage");
				}
				
				return mv;
				
			}

}
