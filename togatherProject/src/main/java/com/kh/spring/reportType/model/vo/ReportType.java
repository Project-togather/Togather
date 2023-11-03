package com.kh.spring.reportType.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class ReportType {
	
	private String reName; //신고타입명
	private int reCategory; //신고카테고리분류
}
