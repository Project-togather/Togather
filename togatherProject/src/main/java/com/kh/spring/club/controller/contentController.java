package com.kh.spring.club.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
		
		String savePath = session.getServletContext().getRealPath("resources/contentUploadImg/");
		
			try {
				upfile.transferTo(new File(savePath + updateName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
		return updateName;
	}
	
	@RequestMapping(value = "content.do", method = RequestMethod.GET)
	public ModelAndView writeTestGet(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:enrollForm.cl");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="content.do", method = RequestMethod.POST)
	public String writeTestPost(@RequestParam("image") MultipartFile multi, HttpSession session ,HttpServletRequest request, HttpServletResponse response) {
		
		JSONObject jObj = new JSONObject(); // {}
		
		try {
			String uploadPath = "resources/contentUploadImg/";
			String updateName = saveFile(multi, session); // 20231029716465669182.jpg 
			
			if(!multi.isEmpty()) {
				
				jObj.put("filename", updateName);
				jObj.put("uploadPath", multi.getOriginalFilename());
				jObj.put("url", uploadPath + updateName);
				
				return jObj.toJSONString();
			} else {
				return jObj.toJSONString();
			}
		} catch (Exception e) {
			System.out.println("[Error] " + e.getMessage());
		}
		return "";
	}
}
