package com.kh.spring.admin.member.model.vo;

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

public class BlackList {

	private String blackNo;
	private String blackId;
	private String blackName;
	private String nickName;
	private String blackrpCount;
	private String gender;
	private String phone;
	private Date blackEnrollDate;
	private String blackStatus;

}
