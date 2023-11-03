package com.kh.spring.attachment.model.vo;

import java.sql.Date;
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
public class Attachment {
	private String attNo;
	private String refFno;
	private String originName;
	private String updateName;
	private String filePath;
	private String enrollDate;
	private String category;
	private int  thumbnail;
	
	private String classNo; 
	private String condition; // 등록인지 수정인지
}
