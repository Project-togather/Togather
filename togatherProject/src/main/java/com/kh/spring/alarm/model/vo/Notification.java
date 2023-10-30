package com.kh.spring.alarm.model.vo;

import com.kh.spring.member.model.vo.Member;
import com.kh.spring.reply.model.vo.Reply;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Notification {

	private Member receiver;
    private Reply reply;
    private String content;
    private String url;
    private boolean isRead;

    @Builder
    public Notification(Member receiver, Reply reply, String content, String url, boolean isRead) {
    	this.receiver = receiver;
    	this.reply = reply;
    	this.content = content;
    	this.url = url;
    	this.isRead = isRead;
    }
}
