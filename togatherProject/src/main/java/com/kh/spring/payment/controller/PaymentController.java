package com.kh.spring.payment.controller;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
	
	public static final String apiKey = "1204024438583748";
	public static final String secretKey = "EWewEVi2YQVa5mNaNgcw2rG59Paofu5knJUriYpyoUmlDkhIdRzlumTGzxGUPvLcoqDNLg4yf2zbraFV";
	
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
	
	@ResponseBody
	@RequestMapping(value = "pay.cl", produces = "application/json; charset=UTF-8")
	public String payment(com.kh.spring.payment.model.vo.Payment p, HttpServletRequest request, Model model) {
		
		int result = pService.insertPayment(p);
		if(result > 0) {
			String referer = request.getHeader("Referer");
			return "redirect:"+ referer;
		} else {
			model.addAttribute("errorMsg", "결제 실패");
			return "common/errorPage";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "refund.cl", produces = "application/json; charset=UTF-8")
	public ResponseEntity<String> refund(com.kh.spring.payment.model.vo.Payment p) throws IOException {
		
		com.kh.spring.payment.model.vo.Payment pi = pService.selectUid(p);
		
		
		String access_token = pService.getToken(apiKey, secretKey);
		String merchant_uid = pi.getMUid();
		String reason = "그냥";
		
		try {
	        pService.refundRequest(access_token, merchant_uid, reason);
	        pService.refundUid(pi);
	        return new ResponseEntity<>("환불 성공", HttpStatus.OK);
	    } catch (Exception e) {
	        return new ResponseEntity<>("환불 실패: " + e.getMessage(), HttpStatus.BAD_REQUEST);
	    }
		
	}
}
