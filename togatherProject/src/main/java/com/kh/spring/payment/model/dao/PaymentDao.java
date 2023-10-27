package com.kh.spring.payment.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.payment.model.vo.Payment;

@Repository
public class PaymentDao {

	public int insertPayment(Payment p, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("paymentMapper.insertPayment", p);
	}
	
}
