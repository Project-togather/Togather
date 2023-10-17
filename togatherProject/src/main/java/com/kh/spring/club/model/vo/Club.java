package com.kh.spring.club.model.vo;

import java.sql.Date;

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
	
	private String classNo; // 모임번호
	private String memNo; // 호스트멤버번호
	private String classTitle; // 모임제목
	private String classContent; // 모임내용
	private String classLocation; // 모임지역
	private String classDate; // 모임날짜
	private String classTime; // 모임시간
	private int classPrice; // 모임비
	private String classApproval; // 승인제
	private int minAge; // 최소나이제한
	private int maxAge; // 최대나이제한
	private int peopleLimit; // 인원제한
	private int clType; //  (소셜링, 챌린지)
	private int clCategory; // in_no 관심사 (취미,)
	private String curriculum; // 커리큘럼
	private String status; // 폐쇄상태
	
	private Attachment attachment;
	
}
