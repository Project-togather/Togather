package com.kh.spring.payment.controller;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.spring.payment.model.service.PaymentService;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
public class PaymentController {
	
	private IamportClient api;
	
	public PaymentController() {
		this.api = new IamportClient("1204024438583748", "EWewEVi2YQVa5mNaNgcw2rG59Paofu5knJUriYpyoUmlDkhIdRzlumTGzxGUPvLcoqDNLg4yf2zbraFV");
	}
	
	@Autowired
	private PaymentService pService;
	
	@ResponseBody
	@RequestMapping(value="verifyIamport/{imp_uid}")
	public IamportResponse<Payment> paymentByImpUid(
						Model model
					  , Locale locale
					  , HttpSession session
					  , @PathVariable(value="imp_uid") String imp_uid) throws IamportResponseException, IOException{
		return api.paymentByImpUid(imp_uid);
	}
	
	
	@RequestMapping("pay.cl")
	public String payment(com.kh.spring.payment.model.vo.Payment p, HttpServletRequest request, Model model) {
		
		int result = pService.insertPayment(p);
		if(result > 0) {
			String referer = request.getHeader("Referer");
			return "redirect:"+ referer;
		} else {
			model.addAttribute("errorMsg", "게시글 등록에 실패");
			return "common/errorPage";
		}
	}
	
}
