package com.kh.spring.common.model.vo;

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
public class PageInfo {
	
	private int listCount;		// 총 게시글의 개수
	private int currentPage;	// 현재페이지(즉, 요청한 페이지)
	private int pageLimit;		// 하단에 보여질 페이징바의 페이지 목록 최대 개수
	private int boardLimit;		// 해당 페이지에 보여질 게시글의 최대 개수
	
	private int maxPage;		// 가장 마지막의 페이지 수 (listCount, boardLimit을 가지고 구함)
	private int startPage;		// 해당 페이지에 보여질 페이징바의 시작 수 (pageLimit, currentPage를 가지고 구함)
	private int endPage;		// 해당 페이지에 보여질 페이징바의 끝 수 (startPage, pageLimit, maxPage)
	
}
