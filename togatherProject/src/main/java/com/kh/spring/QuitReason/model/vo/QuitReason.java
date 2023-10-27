package com.kh.spring.QuitReason.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter  @Setter
@ToString
public class QuitReason {
	
	private String classNo;
	private String memNo;
	private String quitReason;
	private String detailReason;
	
}
