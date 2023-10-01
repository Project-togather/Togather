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
	private String rNo;
	private String rContent;
	private Date rDate;
	private String rStatus;
	private String refFno;
	private String memNo;
}
