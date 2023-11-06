package com.kh.spring.feed.model.vo;

import java.sql.Date;

import com.kh.spring.attachment.model.vo.Attachment;
import com.kh.spring.great.model.vo.Great;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor // 기본생성자
@AllArgsConstructor // 전체매개변수 생성자
@Setter // setter 메소드
@Getter // getter 메소드
@ToString // toString 메소드

public class Feed {
	
	private String feNo;
	private String refCno;
	private String feContent;
	private Date feDate;
	private String feWriter;
	private String feStatus;
	private String thumbnail;
	private int likeCount;
	private String img;
	
	private Attachment attachment;
	private Great Great;
	private String grNo;
	private String attNo;
	private String refFno;
	private String filePath;
	private String nickName;
	
}
