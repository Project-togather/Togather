package com.kh.spring.chat.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter
@Setter
public class ChatRoom {
	private String chatRoomNo; 
	private String refClubNo; 
	private String chatMem; 
}
