package com.kh.spring.club.model.vo;

import com.kh.spring.attachment.model.vo.Attachment;

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
	
}
