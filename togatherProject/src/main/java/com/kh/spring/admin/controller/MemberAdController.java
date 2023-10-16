package com.kh.spring.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.admin.model.service.AdminServiceImpl;
import com.kh.spring.member.model.vo.Member;

@Controller
public class MemberAdController {
	@Autowired
	private AdminServiceImpl Aservice;
	
	//회원 관리 페이지 이동
	@RequestMapping("list.mem")
	public ModelAndView selectMemberList(ModelAndView mv){
		ArrayList<Member> list = Aservice.selectMemberList();
		
		if(list.size()>0) {//성공
			mv.addObject("list",list).setViewName("admin/member/memberListView");
		}else {//실패
			mv.addObject("errorMsg", "로그인실패");  
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	//회원 목록 다운로드 (excel)
	@RequestMapping("list.dl")
    public void memberListDownload(HttpServletResponse response) throws IOException {
		//Workbook wb = new HSSFWorkbook();
        Workbook wb = new XSSFWorkbook();
        Sheet sheet = wb.createSheet("첫번째 시트");
        Row row = null;
        Cell cell = null;
        int rowNum = 0;

        // Header
        row = sheet.createRow(rowNum++);
        cell = row.createCell(0);
        cell.setCellValue("회원번호");
        cell = row.createCell(1);
        cell.setCellValue("이름");
        cell = row.createCell(2);
        cell.setCellValue("아이디");
        cell = row.createCell(3);
        cell.setCellValue("닉네임");
        cell = row.createCell(4);
        cell.setCellValue("가입일");
        cell = row.createCell(5);
        cell.setCellValue("나이");
        
        ArrayList<Member> list = Aservice.selectMemberList();
        System.out.println(list);
        // Body
        for (int i=0; i<list.size(); i++) {
            row = sheet.createRow(rowNum++);
            cell = row.createCell(0);
            cell.setCellValue(list.get(i).getMemNo());
            cell = row.createCell(1);
            cell.setCellValue(list.get(i).getMemName());
            cell = row.createCell(2);
            cell.setCellValue(list.get(i).getMemId());
            cell = row.createCell(3);
            cell.setCellValue(list.get(i).getNickname());
            cell = row.createCell(4);
            cell.setCellValue(list.get(i).getEnrollDate());
            cell = row.createCell(5);
            cell.setCellValue(list.get(i).getAge());
        }

        // 컨텐츠 타입과 파일명 지정
        response.setContentType("ms-vnd/excel");
//        response.setHeader("Content-Disposition", "attachment;filename=example.xls");
        response.setHeader("Content-Disposition", "attachment;filename=example.xlsx");

        // Excel File Output
        wb.write(response.getOutputStream());
        wb.close();
    }
    
    

}
