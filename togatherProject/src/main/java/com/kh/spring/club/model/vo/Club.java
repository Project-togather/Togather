package com.kh.spring.club.model.vo;

import java.sql.Date;

import com.kh.spring.attachment.model.vo.Attachment;
import com.kh.spring.clType.model.vo.ClType;

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
	private String classTime; // 모임시간(분)
	private String classPrice; // 모임비
	private String avgPrice; // 모임비 평균 값
	private int hour; // 모임시간에서 시만 자름
	private String classApproval; // 승인제
	private int minAge; // 최소나이제한
	private int maxAge; // 최대나이제한
	private int peopleLimit; // 인원제한
	private int clType; //  (소셜링, 챌린지)
	private int clCategory; // in_no 관심사 (취미,)
	private String clName; // 카테고리 이름
	private String curriculum; // 커리큘럼
	private String status; // 폐쇄상태
	private int vacancy; // 남은 자리
	private String nickName; // 닉네임
	private String enrollDate; // 모임등록 날짜
	
	// 프로필 이미지
	private String img;
	
	// 카카오맵 api 추가
	private String latitude; // 위도
	private String longitude; // 경도
	
	private String placeId; // 장소값
	
	private String memId;
	private int clTypeStatus; // 모임 가입상태

	private Attachment attachment;
	
	//관리자페이지 모임 조회용
	private String clCaName;
	
	private String updateName;
	private String filePath;
	
	private String msg;
	private String refFno;
}
