package com.kh.spring.notice.model.vo;

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
public class Notice {
	private String noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private String noticeViews;
	private Date noticeDate;
	private String noticeStatus;
}
