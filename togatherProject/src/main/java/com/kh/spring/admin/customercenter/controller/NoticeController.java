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
import com.kh.spring.admin.customercenter.model.vo.Faq;
import com.kh.spring.admin.customercenter.model.vo.Notice;
import com.kh.spring.admin.customercenter.model.vo.NoticeReply;
import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.common.template.Pagination;

@Controller
public class NoticeController {

	@Autowired
	private CustomerBoardServiceImpl Cservice;

	// 공지사항 페이지 이동
	@RequestMapping("notice.list")
	public ModelAndView noticeListPage(@RequestParam(value = "cpage", defaultValue = "1") int currentPage,
			ModelAndView mv) {

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

	// 사용자페이지 공지사항 노출
	@RequestMapping("usnoticelist.pa")
	public ModelAndView usnoticeListPage(@RequestParam(value = "cpage", defaultValue = "1") int currentPage,
			ModelAndView mv) {

		int noticeListCount = Cservice.selectNoticeListCount();

		PageInfo pi = Pagination.getPageInfo(noticeListCount, currentPage, 10, 10);

		ArrayList<Notice> list = Cservice.selectNoticeList(pi);

		if (list.size() > 0) {
			mv.addObject("pi", pi).addObject("list", list).setViewName("admin/customercenter/userNoticeListView");

		} else {
			mv.addObject("pi", pi).addObject("list", list).setViewName("admin/customercenter/userNoticeListView");
			// mv.addObject("errorMsg", "블랙리스트조회실패");
			// mv.setViewName("common/errorPage");
		}

		return mv;
	}
	
	// 사용자페이지 faq 노출
		@RequestMapping("usfaqlist.pa")
		public ModelAndView usfaqListPage(@RequestParam(value = "cpage", defaultValue = "1") int currentPage,
				ModelAndView mv) {

			int faqListCount = Cservice.selectFaqListCount();

			PageInfo pi = Pagination.getPageInfo(faqListCount, currentPage, 10, 10);

			ArrayList<Faq> list = Cservice.selectFaqList(pi);

			if (list.size() > 0) {
				mv.addObject("pi", pi).addObject("list", list).setViewName("admin/customercenter/userFaqListView");

			} else {
				mv.addObject("pi", pi).addObject("list", list).setViewName("admin/customercenter/userFaqListView");
				// mv.addObject("errorMsg", "블랙리스트조회실패");
				// mv.setViewName("common/errorPage");
			}

			return mv;
		}

	// insert페이지 이동 notice
	@RequestMapping("insertno.pa")
	public String insertNoticePage() {
		return "admin/customercenter/noticeInsert";

	}
	// insert페이지 이동 faq
	@RequestMapping("insertfaq.pa")
	public String insertfaqPage() {
		return "admin/customercenter/faqInsert";

	}

	// insert 수행 notice
	@RequestMapping("insert.no")
	public String insertNotice(Notice n, HttpSession session, Model model) {
		int result = Cservice.insertNoticeBoard(n);

		if (result > 0) {
			session.setAttribute("alertMsg", "성공적으로 공지사항이 등록되었습니다.");
			return "redirect:notice.list";
		} else {
			model.addAttribute("errorMsg", "공지사항 등록에 실패했습니다.");
			return "common/errorPage";
		}
	}
	// insert 수행 faq
		@RequestMapping("insert.fq")
		public String insertfaq(Faq f, HttpSession session, Model model) {
			int result = Cservice.insertfaqBoard(f);

			if (result > 0) {
				session.setAttribute("alertMsg", "성공적으로 faq 등록되었습니다.");
				return "redirect:faq.list";
			} else {
				model.addAttribute("errorMsg", "faq 등록에 실패했습니다.");
				return "common/errorPage";

			}

		}
	
	

	// 관리자 페이지 공지사항 상세보기
	@RequestMapping("detail.no")
	public ModelAndView noticeDetailview(String noticeNo, ModelAndView mv) {

		Notice n = Cservice.noticeDetailview(noticeNo);

		if (n != null) {
			mv.addObject("n", n).setViewName("admin/customercenter/noticeDetailView");
		} else {
			mv.addObject("n", n).setViewName("admin/customercenter/noticeDetailView");

		}

		return mv;
	}

	// 사용자 페이지 공지사항 상세보기
	@RequestMapping("usdetail.no")
	public ModelAndView usnoticeDetailview(String noticeNo, ModelAndView mv) {
		
		int result = Cservice.increaseNotice(noticeNo);
		

		if (result > 0) {
			Notice n = Cservice.noticeDetailview(noticeNo);
			ArrayList<NoticeReply> nr = Cservice.selectNoticeReply(noticeNo);
			mv.addObject("n", n).addObject("nr",nr).setViewName("admin/customercenter/usernoticeDetailView");
			
		} else {
			Notice n = Cservice.noticeDetailview(noticeNo);
			ArrayList<NoticeReply> nr = Cservice.selectNoticeReply(noticeNo);
			mv.addObject("n", n).addObject("nr",nr).setViewName("admin/customercenter/usernoticeDetailView");
		}

		return mv;
	}
	

	@RequestMapping("update.no")
	public String updateNotice(Notice n, Model model, HttpSession session) {

		int result = Cservice.updateNotice(n);

		if (result > 0) {
			session.setAttribute("alertMsg", "성공적으로 공지사항이 등록되었습니다.");
			return "redirect:notice.list";
		} else {
			model.addAttribute("errorMsg", "공지사항 등록에 실패했습니다.");
			return "common/errorPage";

		}
	}


	@RequestMapping("faq.list")
	public ModelAndView faqList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, ModelAndView mv) {
		int faqListCount = Cservice.selectFaqListCount();

		PageInfo pi = Pagination.getPageInfo(faqListCount, currentPage, 10, 10);

		ArrayList<Faq> list = Cservice.selectFaqList(pi);

		if (list.size() > 0) {
			mv.addObject("pi", pi).addObject("list", list).setViewName("admin/customercenter/FaqListView");

		} else {
			mv.addObject("pi", pi).addObject("list", list).setViewName("admin/customercenter/FaqListView");
			// mv.addObject("errorMsg", "블랙리스트조회실패");
			// mv.setViewName("common/errorPage");
		}

		return mv;
	}

	@RequestMapping("detail.fa")
	public ModelAndView detailfaq(int faqNo, ModelAndView mv) {

		Faq f = Cservice.faqDetailview(faqNo);

		if (f != null) {
			mv.addObject("f", f).setViewName("admin/customercenter/faqDetailView");
		} else {
			mv.addObject("f", f).setViewName("admin/customercenter/faqDetailView");

		}
		return mv;
	}

	@RequestMapping("update.fa")
	public String updateFaq(Faq f, Model model, HttpSession session) {

		int result = Cservice.updateFaq(f);

		if (result > 0) {
			session.setAttribute("alertMsg", "성공적으로 faq가 수정 되었습니다.");
			return "redirect:faq.list";
		} else {
			model.addAttribute("errorMsg", "faq 수정에 실패했습니다.");
			return "common/faq.list";

		}
	}
	
	@RequestMapping("delete.fa")
	public String deletefaq(String faqNo) {
		int result = Cservice.deletefaq(faqNo);

		return "redirect:faq.list";
	}
	@RequestMapping("delete.no")
	public String deleteNotice(String noticeNo) {
		int result = Cservice.deleteNotice(noticeNo);

		return "redirect:notice.list";
	}
	
	
	@RequestMapping("comment.no")
	public String commentNotice(NoticeReply nr,HttpSession session) {
		
		int result = Cservice.insertReplyNotice(nr);
		
		if (result > 0) {
			session.setAttribute("alertMsg", "성공적으로 댓글등록 되었습니다.");
			return "redirect:usnoticelist.pa";
		} else {
			session.setAttribute("errorMsg", "댓글등록에 실패했습니다.");
			return "redirect:usnoticelist.pa";
		}
	}
	
	@RequestMapping("complain.bl")
	public String complainBlackList() {
		return "admin/member/complainBlackList";
	}

}