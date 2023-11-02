package com.kh.spring.admin.customercenter.model.vo;

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
public class NoticeReply {
	 private String noticeReplyNo;
	 private String noticeComment;
	 private String commentWriter;
	 private Date commentCreateDate;
}
