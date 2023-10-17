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
}
