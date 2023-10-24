package com.kh.spring.club.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RestController
public class contentController {	
	
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
	
	@RequestMapping(value = "writeTest.do", method = RequestMethod.POST)
	public ModelAndView writeTestPost(@RequestParam("image") MultipartFile multi, HttpSession session ,HttpServletRequest request, HttpServletResponse response) {
		
		// System.out.println(multi);
		// MultipartFile[field="image", filename=KakaoTalk_20230517_091558666_02.jpg, contentType=image/jpeg, size=273016]

		
		ModelAndView mv = new ModelAndView();
		
		try {
			String originFilename = multi.getOriginalFilename();
			String updateName = saveFile(multi, session);
			
			// System.out.println(originFilename);  // KakaoTalk_20230517_091558666_02.jpg
			// System.out.println(updateName); // 20231029716465669182.jpg 
			
			if(!multi.isEmpty()) {
				mv.addObject("filename", originFilename);
				mv.addObject("uploadPath", updateName);
				mv.addObject("url", "/resources/contentUploadImg/" + updateName);
				
				// System.out.println("url : " + multi.getOriginalFilename() + "resources/contentUploadImg/" + updateName);
				// url : KakaoTalk_20230517_091558666_02.jpgresources/contentUploadImg/20231029716465669182.jpg
				
				mv.setViewName("image_Url_Json");
			} else {
				mv.setViewName("toast_UI_writer3");
			}
		} catch (Exception e) {
			System.out.println("[Error] " + e.getMessage());
		}
		return mv;
	}
}
