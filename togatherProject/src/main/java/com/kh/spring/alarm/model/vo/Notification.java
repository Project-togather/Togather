package com.kh.spring.alarm.model.vo;

import com.kh.spring.member.model.vo.Member;
import com.kh.spring.reply.model.vo.Reply;

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
public class Notification {

	private Member receiver;
    private Reply reply;
    private String content;
    private String url;
    private boolean isRead;

}
