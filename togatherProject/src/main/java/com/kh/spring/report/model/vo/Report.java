package com.kh.spring.report.model.vo;

import java.sql.Date;

import com.kh.spring.member.model.vo.Member;
import com.kh.spring.reportType.model.vo.ReportType;

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
public class Report {
	
	private String reNo;
	private String reMem;
	private String originName;
	private String updateName;
	private String filePath;
	private String rePmem;
	private String reContent;
	private Date reDate;
	private String reResult;
	private int reCategory;
	
	private ReportType reportType;
	private String reName;
	
	private Member member;
	private int rpCount;
	
	
	
	
}
