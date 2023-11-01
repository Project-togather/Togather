package com.kh.spring.chat.model.vo;

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
public class Chat {
	private String chatNo;
	private String chatWriter;
	private String chatContent;
	private String createDate;
	private String chatRoom;
	private String img;
	
}
