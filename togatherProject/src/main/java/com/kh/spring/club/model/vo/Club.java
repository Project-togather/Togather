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
	
	private String cNo;
	private String cTitle;
	private String cContent;
	private String cLocation;
	private Date cDate;
	private String cPrice;
	private String cApproval;
	private String ageLimit;
	private String peopleLimit;
	private String guide;
	private String hobbyCategory;
	private String cCa;
	private String memNo;
	
}
