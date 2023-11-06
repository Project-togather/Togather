package com.kh.spring.myClass.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class MyClass {
	private String classNo; // 모임번호
	private String memNo; // 회원번호
	private int clType; // 모임상태번호
	
	private String price; // 모임 가격
	private String condition; // 유사 모임(1) 인지 상세 모임(0) 인지
	private int clCategory;
}
