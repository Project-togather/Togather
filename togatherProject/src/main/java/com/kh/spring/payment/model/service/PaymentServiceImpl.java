package com.kh.spring.payment.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.payment.model.dao.PaymentDao;
import com.kh.spring.payment.model.vo.Payment;

@Service
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private PaymentDao pDao;
	
	@Override
	public int insertPayment(Payment p) {
		return pDao.insertPayment(p, sqlSession);
	}

	
	
}
