package com.kh.spring.admin.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.admin.member.model.service.AdminServiceImpl;
import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.common.template.Pagination;
import com.kh.spring.member.model.vo.Member;


@Controller
public class MemberAdController {
	@Autowired
	private AdminServiceImpl Aservice;
	
	
	//회원 관리 페이지 이동
	@RequestMapping("list.mem")
	public ModelAndView selectMemberListCount(@RequestParam(value="cpage",defaultValue = "1") int currentPage,ModelAndView mv){
		int  memCount = Aservice.selectMemberListCount();
		
		PageInfo pi = Pagination.getPageInfo(memCount, currentPage, 10, 10);
		
		//화면 리스트용 메서드
		ArrayList<Member> list = Aservice.selectMemberList1(pi);
		
		if(list.size()>0) {//성공
			mv.addObject("pi",pi).addObject("list",list).setViewName("admin/member/memberListView");
		}else {//실패
			mv.addObject("errorMsg", "회원조회실패");  
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
        cell.setCellValue("아이디");
        cell = row.createCell(2);
        cell.setCellValue("비밀번호");
        cell = row.createCell(3);
        cell.setCellValue("이름");
        cell = row.createCell(4);
        cell.setCellValue("닉네임");
        cell = row.createCell(5);
        cell.setCellValue("이메일");
        cell = row.createCell(6);
        cell.setCellValue("성별");
        cell = row.createCell(7);
        cell.setCellValue("나이");
        cell = row.createCell(8);
        cell.setCellValue("전화번호");
        cell = row.createCell(9);
        cell.setCellValue("매너온도");
        cell = row.createCell(10);
        cell.setCellValue("회원상태");
        
        //엑셀다운로드용 메서드
        ArrayList<Member> list = Aservice.selectMemberList2();
        
        // Body
        for (int i=0; i<list.size(); i++) {
            row = sheet.createRow(rowNum++);
            cell = row.createCell(0);
            cell.setCellValue(list.get(i).getMemNo());
            cell = row.createCell(1);
            cell.setCellValue(list.get(i).getMemId());
            cell = row.createCell(2);
            cell.setCellValue(list.get(i).getMemPwd());
            cell = row.createCell(3);
            cell.setCellValue(list.get(i).getMemName());
            cell = row.createCell(4);
            cell.setCellValue(list.get(i).getNickName());
            cell = row.createCell(5);
            cell.setCellValue(list.get(i).getEmail());
            cell = row.createCell(6);
            cell.setCellValue(list.get(i).getGender());
            cell = row.createCell(7);
            cell.setCellValue(list.get(i).getAge());
            cell = row.createCell(8);
            cell.setCellValue(list.get(i).getPhone());
            cell = row.createCell(9);
            cell.setCellValue(list.get(i).getManner());
            cell = row.createCell(10);
            cell.setCellValue(list.get(i).getMemStatus());
        }

        // 컨텐츠 타입과 파일명 지정
        response.setContentType("ms-vnd/excel");
        //response.setHeader("Content-Disposition", "attachment;filename=example.xls");
        response.setHeader("Content-Disposition", "attachment;filename=example.xlsx");

        // Excel File Output
        wb.write(response.getOutputStream());
        wb.close();
    }
    
	@RequestMapping("detail.mem")
	public ModelAndView detailMember (String memNo,ModelAndView mv) {
		
		 Member m = Aservice.selectMemberList3(memNo);
		 
		 mv.addObject("m",m).setViewName("admin/member/memberDetailView");
		 return mv;
		 
	}
    //회원 정보 수정
	@RequestMapping("adupdate.mem")
	public String adUpdateMember (Member m) {
		
		int result = Aservice.adUpdateMember(m);
		
		return "redirect:list.mem";
	}
	
	@RequestMapping("updateMem.ex")
	public String exUpdateMember() {
		
		return "admin/member/insertMemEx";
	}
	
	@RequestMapping("update.ex")
	public String exUpdate(@RequestParam("file") MultipartFile file) throws IOException {
		
		XSSFWorkbook workbook = new XSSFWorkbook(file.getInputStream());
	    XSSFSheet worksheet = workbook.getSheetAt(0);

	    for(int i =1;i<worksheet.getPhysicalNumberOfRows(); i++) {
	    	Member excel = new Member();
	    	
	    	DataFormatter formatter = new DataFormatter();		        
	        XSSFRow row = worksheet.getRow(i);
	        	    	
	        String memNo = formatter.formatCellValue(row.getCell(0));
	        String memId = formatter.formatCellValue(row.getCell(1));
	        String memPwd = formatter.formatCellValue(row.getCell(2));
	        String memName = formatter.formatCellValue(row.getCell(3));
	        String nickName = formatter.formatCellValue(row.getCell(4));
	        String email = formatter.formatCellValue(row.getCell(5));
	        String gender = formatter.formatCellValue(row.getCell(6));
	        String age = formatter.formatCellValue(row.getCell(7));
	        String phone = formatter.formatCellValue(row.getCell(8));
	        double manner = Double.parseDouble(formatter.formatCellValue(row.getCell(9)));
	        String memStatus = formatter.formatCellValue(row.getCell(10));
	        
	        
	        
	        excel.setMemNo(memNo);
	        excel.setMemId(memId);
	        excel.setMemPwd(memPwd);
	        excel.setMemName(memName);
	        excel.setNickName(nickName);
	        excel.setEmail(email);
	        excel.setGender(gender);
	        excel.setAge(age);
	        excel.setPhone(phone);
	        excel.setManner(manner);
	        excel.setMemStatus(memStatus);
	        
  
	        int result = Aservice.insertExcel(excel);
	        System.out.println(result);
	    	
	    }

		
		return "redirect:updateMem.ex";
	}

}
