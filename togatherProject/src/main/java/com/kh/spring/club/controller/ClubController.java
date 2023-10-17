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

import com.kh.spring.attachment.model.vo.Attachment;
import com.kh.spring.club.model.service.ClubServiceImpl;
import com.kh.spring.club.model.vo.Club;
import com.kh.spring.myClass.model.vo.MyClass;

@Controller
public class ClubController {

	@Autowired
	private ClubServiceImpl cService;
	
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
		
		if(list != null) {
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
	public String loungePage() {
		return "class/loungePage";
	}
	
   // 내모임 리스트 조회
   @RequestMapping(value = "myclass.pa")
   public String selectMyClass() {
      return "class/myClassPage";
   }
	
	/**
	 * 소셜링 전체 조회
	 */
	@RequestMapping("social.pa")
	public String selectSocialList(Club c, Attachment at, MultipartFile upfile, HttpSession session, Model model) {
		
		ArrayList<Club> list = cService.selectSocialList();
		
		if(list != null) {
			session.setAttribute("list", list);
			return "class/socialPage";
		}else {
			model.addAttribute("errorMsg", "실패!?");
			return "/";
		}
	}
	
	/**
	 * 클럽 전체 조회
	 */
	@RequestMapping("club.pa")
	public String selectClubList(Club c, Attachment at, MultipartFile upfile, HttpSession session, Model model) {
		
		ArrayList<Club> list = cService.selectClubList();
		
		if(list != null) {
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
		
		if(list != null) {
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
		
		if(list != null) {
			session.setAttribute("list", list);
			return "class/onedayPage";
		}else {
			model.addAttribute("errorMsg", "실패!?");
			return "/";
		}
	}
	
	/**
	 * 내 즐겨찾기 조회
	 */
	public void selectMyList() {
		ArrayList<Club> list = cService.selectMyClassList();
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
		
		int result = cService.insertClass(c);
		
		if(!upfile.getOriginalFilename().equals("")) {
			
			String updateName = saveFile(upfile, session);
			at.setOriginName(upfile.getOriginalFilename());
			at.setUpdateName("resources/uploadFiles/" + updateName);
			at.setFilePath(upfile.getOriginalFilename() + "resources/uploadFiles/" + updateName);
		}
		
		if(result > 0) {
			at.setCategory(c.getClType());
			
			int result2 = cService.insertImg(at);
			MyClass myClass = new MyClass();
			if(result2 > 0) {
				myClass.setClassNo(c.getClassNo());
				myClass.setMemNo(c.getMemNo());
				myClass.setClType(c.getClType());
				
				int result3 = cService.insertMyClass(c);
				
				if(result3 > 0) {
				}
				session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
				return "class/myClassPage";
				}else {
					model.addAttribute("errorMsg", "게시글 등록에 실패");
					return "common/errorPage";
				}
		}
		return null;
	}
	
	@RequestMapping("detail.cl")
	public String selectClassDetail(int cNo, Model model) {
		
		Club c = cService.selectClassDetail(cNo);
		model.addAttribute("c", c);
		
		System.out.println(c);
		return "class/classDetailView";
		
	}
	
}
