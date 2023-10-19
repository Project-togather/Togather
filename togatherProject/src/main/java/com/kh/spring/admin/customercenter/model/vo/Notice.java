package com.kh.spring.admin.customercenter.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Notice {
	
	 private String noticeNo;
	 private String memId;
	 private String noticeTitle;
	 private String noticeContent;
	 private int noticeViews;
	 private Date noticeDate;
	 private String noticeStatus;

}
