package com.kh.spring.reply.model.vo;

import java.sql.Date;

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
public class Reply {
	private String rvNo;
	private String mrNo;
	private String crNo;
	private String rvContent;
	private String rvDate;
	private String rvStatus;
	private String refFno;
	private String memNo;
	
	private String nickName;
	private String img;
	private String classTitle;
	
	private String happen;
	//private String refMno; // 댓글을 단 모임의 호스트번호
}
