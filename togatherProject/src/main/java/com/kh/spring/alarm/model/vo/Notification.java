package com.kh.spring.alarm.model.vo;

import com.kh.spring.member.model.vo.Member;
import com.kh.spring.reply.model.vo.Reply;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Notification {

	private String aNo;
	private Member receiver;
    private Reply reply;
    private String content;
    private String url;
    private String isRead;
    
    private String happen;
    private String receiveNo;
    private String nickName;

    @Builder
    public Notification(Member receiver, Reply reply, String content, String url, String isRead) {
    	this.receiver = receiver;
    	this.reply = reply;
    	this.content = content;
    	this.url = url;
    	this.isRead = isRead;
    }
}
