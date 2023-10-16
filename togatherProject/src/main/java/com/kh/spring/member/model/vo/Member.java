package com.kh.spring.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor // 기본생성자
@AllArgsConstructor // 전체매개변수 생성자
@Setter // setter 메소드
@Getter // getter 메소드
@ToString // toString 메소드

public class Member {

	private String memNo;
	private String memId;
	private String memPwd;
	private String memName;
	private String nickName;
	private String email;
	private String gender;
	private String age;
	private String phone;
	private Date enrollDate;
	private String mStatus;
	private double manner;
	private String interest;

}
