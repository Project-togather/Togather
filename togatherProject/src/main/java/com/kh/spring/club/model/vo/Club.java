package com.kh.spring.club.model.vo;

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

public class Club {
	
<<<<<<< HEAD
	private String cNo;
	private String cTitle;
	private String cContent;
	private String cLocation;
	private Date cDate;
	private String cTime;
	private int cPrice;
	private String cApproval;
	private int minAge;
	private int maxAge;
	private int peopleLimit;
	private String clCategory;
	private String clType;
	private String myStatus;
	private String curriculum;
	private String status;
=======
	private String classNo;
	private String classTitle;
	private String classContent;
	private String classLocation;
	private String classDate;
	private int classPrice;
	private String classApproval;
	private String ageLimit;
	private int peopleLimit;
	private int clCaNo;
	private int clType;
	private int inNo;
	private String curriculum;
	private String status;
	
	private Attachment attachment;
>>>>>>> 001de490d4020ae5d77c8548e2c4187d2a0fd8c1
	
}
