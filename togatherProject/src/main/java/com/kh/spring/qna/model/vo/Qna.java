package com.kh.spring.qna.model.vo;

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
public class Qna {
	private String qnaNo;
	private String qnaTitle;
	private String qnaContent;
	private String qnaStatus;
}
