package com.kh.spring.report.model.vo;

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
	
	
	
}
