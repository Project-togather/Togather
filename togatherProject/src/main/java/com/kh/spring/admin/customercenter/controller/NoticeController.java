package com.kh.spring.admin.customercenter.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.admin.customercenter.model.service.CustomerBoardServiceImpl;
import com.kh.spring.admin.customercenter.model.vo.Notice;
import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.common.template.Pagination;


@Controller
public class NoticeController {

	@Autowired
	private CustomerBoardServiceImpl Cservice;

	// 공지사항 페이지 이동
	@RequestMapping("notice.list")
	public ModelAndView noticeListPage(@RequestParam(value = "cpage", defaultValue = "1") int currentPage,ModelAndView mv) {

		int noticeListCount = Cservice.selectNoticeListCount();
		

		PageInfo pi = Pagination.getPageInfo(noticeListCount, currentPage, 10, 10);

		ArrayList<Notice> list = Cservice.selectNoticeList(pi);

		
		if (list.size() > 0) {
			mv.addObject("pi", pi).addObject("list", list).setViewName("admin/customercenter/noticeList");

		} else {
			mv.addObject("pi", pi).addObject("list", list).setViewName("admin/customercenter/noticeList");
			// mv.addObject("errorMsg", "블랙리스트조회실패");
			// mv.setViewName("common/errorPage");
		}

		return mv;
	}
	//insert페이지 이동
	@RequestMapping("insertno.pa")
	public String insertNoticePage() {
		return "admin/customercenter/noticeInsert";
		
	}
	//insert 수행
	@RequestMapping("insert.no")
	public String insertNotice(Notice n,HttpSession session,Model model ) {
		int result = Cservice.insertNoticeBoard(n);
		
		if(result>0) {
			session.setAttribute("alertMsg", "성공적으로 공지사항이 등록되었습니다.");
			return "redirect:notice.list";
		}else {
			model.addAttribute("errorMsg","공지사항 등록에 실패했습니다.");
			return "common/errorPage";
			
		}
		
	}
	
	@RequestMapping("detail.no")
	public ModelAndView noticeDetailview(int noticeNo,ModelAndView mv) {
		
		Notice n = Cservice.noticeDetailview(noticeNo);
		
		
		if(n !=null){
			mv.addObject("n",n).setViewName("admin/customercenter/noticeDetailView");
		}else {
			mv.addObject("n",n).setViewName("admin/customercenter/noticeDetailView");
			
		}
		
		return mv;
	}
	
	@RequestMapping("update.no")
	public String updateNotice(Notice n,Model model,HttpSession session) {
		
		int result = Cservice.updateNotice(n);
		
		if(result>0) {
			session.setAttribute("alertMsg", "성공적으로 공지사항이 등록되었습니다.");
			return "redirect:notice.list";
		}else {
			model.addAttribute("errorMsg","공지사항 등록에 실패했습니다.");
			return "common/errorPage";
			
		}
	}
}
