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
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.attachment.model.vo.Attachment;
import com.kh.spring.club.model.service.ClubServiceImpl;
import com.kh.spring.club.model.vo.Club;

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
		
		String changeName = currentTime + ranNum + ext; 
		
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
			try {
				upfile.transferTo(new File(savePath + changeName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
		return changeName;
	}
	
	/**
	 * 전체 리스트 조회 (소셜링, 클럽, 챌린지, 원데이, 피드?) (대문자)
	 */
	public String selectClubList(Club c, Attachment at, MultipartFile upfile, HttpSession session, Model model) {
		
		
		if(!upfile.getOriginalFilename().equals("")) {
			String changeName = saveFile(upfile, session);
			at.setOriginName(upfile.getOriginalFilename());
			at.setChangeName("resources/uploadFiles/" + changeName);
		}
		
		ArrayList<Club> list = cService.selectClubList();
		
		if(list != null) {
			session.setAttribute("list", list);
			return "main";
		}else {
			model.addAttribute("errorMsg", "실패!?");
			return "/";
		}
	}
	
	// 소셜링 페이지 이동
	@RequestMapping(value = "sosial.pa")
	public String myClassPage() {
		return "class/sosialPage";
	}
	
	// 클럽 페이지 이동
	@RequestMapping(value = "club.pa")
	public String clubPage() {
		return "class/clubPage";
	}
	
	// 챌린지 페이지 이동
	@RequestMapping(value = "challenge.pa")
	public String challengePage() {
		return "class/challengePage";
	}
	
	// 원데이클래스 페이지 이동
	@RequestMapping(value = "oneday.pa")
	public String onedayPage() {
		return "class/onedayPage";
	}
	
	// 라운지 페이지 이동
	@RequestMapping(value = "rounge.pa")
	public String roungePage() {
		return "class/roungePage";
	}
	
	/**
	 * 소셜링 전체 조회
	 */
	public String selectSocialList() {
		ArrayList<Club> list = cService.selectSocialList();
		
		return "main";
	}
	
	/**
	 * 소셜링 상세 조회
	 */
	public String selectSocialList(int cNo) {
		int result = cService.increaseCount(cNo);
		
		if(result > 0) {
			Club c = cService.selectSocial(cNo);
		}else {
			
		}
		return "main";
	}
	
	/**
	 * 소셜링 작성
	 */
	public void insertSocial(Club c) {
		int result = cService.insertSocial(c);
	}
	
	/**
	 * 소셜링 수정
	 */
	public void updateSocial(Club c) {
		int result = cService.updateSocial(c);
	}

	/**
	 * 소셜링 삭제
	 */
	public void deleteSocial(int cNo) {
		int result = cService.deleteSocial(cNo);
	}
	
	/**
	 * 클럽 전체 조회 (소문자)
	 */
	public void selectclubList() {
		ArrayList<Club> list = cService.selectclubList();
	}

	/**
	 * 클럽 상세 조회 (카운트 증가 where 절 바꾸기)
	 */
	public void selectclub(int cNo) {
		
		int result = cService.increaseCount(cNo);
		
		if(result > 0) {
			Club c = cService.selectSocial(cNo);
		}else {
			
		}
	}

	/**
	 * 클럽 작성
	 */
	public void insertclub(Club c) {
		int result = cService.insertclub(c);
	}
	
	/**
	 * 클럽 수정
	 */
	public void updateclub(Club c) {
		int result = cService.updateclub(c);
	}

	/**
	 * 클럽 삭제
	 */
	public void deleteclub(int cNo) {
		int result = cService.deleteclub(cNo);
	}

	/**
	 * 챌린지 전체 조회
	 */
	public void selectchallengeList() {
		ArrayList<Club> list = cService.selectchallengeList();
	}
	
	/**
	 * 챌린지 상세 조회 (카운트 증가 where 절 바꾸기)
	 */
	public void selectchallenge(int cNo) {
		
		int result = cService.increaseCount(cNo);
		
		if(result > 0) {
			Club c = cService.selectSocial(cNo);
		}else {
			
		}
	}
	
	/**
	 * 챌린지 작성
	 */
	public void insertchallenge(Club c) {
		int result = cService.insertchallenge(c);
	}
	
	/**
	 * 챌린지 수정
	 */
	public void updatechallenge(Club c) {
		int result = cService.updateOneDay(c);
	}

	/**
	 * 챌린지 삭제
	 */
	public void deletechallenge(int cNo) {
		int result = cService.deletechallenge(cNo);
	}
	
	/**
	 * 원데이 전체 조회
	 */
	public void selectOneDayList() {
		ArrayList<Club> list = cService.selectOneDayList();
	}

	/**
	 * 원데이 상세 조회 (카운트 증가 where 절 바꾸기)
	 */
	public void selectOneDay(int cNo) {
		
		int result = cService.increaseCount(cNo);
		
		if(result > 0) {
			Club c = cService.selectSocial(cNo);
		}else {
			
		}
	}
	
	/**
	 * 원데이 작성
	 */
	public void insertOneDay(Club c) {
		int result = cService.insertOneDay(c);
	}
	
	/**
	 * 원데이 수정
	 */
	public void updateOneDay(Club c) {
		int result = cService.updateOneDay(c);
	}
	
	/**
	 * 원데이 삭제
	 */
	public void deleteOneDay(int cNo) {
		int result = cService.deleteOneDay(cNo);
	}
	
	/**
	 * 내 즐겨찾기 조회
	 */
	public void selectMyList() {
		ArrayList<Club> list = cService.selectMyList();
	}
	
	/**
	 * 모임등록 폼 이동 
	 */
	@RequestMapping("enrollForm.cl")
	public String classEnrollForm() {
		return "class/ClassEnrollForm";
	}
	
}
