package com.kh.spring.payment.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter  @Setter
@ToString
public class Payment {
	
	private String payNo;
	private String classNo; 
	private String memNo;
	private String payDate;
	private String payMethod;
	private String PayYn;
	private String payEmail;
}
