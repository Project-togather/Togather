package com.kh.spring.payment.model.service;

import java.io.IOException;

import com.kh.spring.payment.model.vo.Payment;

public interface PaymentService {

	int insertPayment(Payment p);
	
	String getToken(String apiKey, String secretKey) throws IOException;
	
	void refundRequest(String access_token, String merchant_uid, String reason) throws IOException;
	
	Payment selectUid(Payment p);
	
	Payment refundUid(Payment p);
}
