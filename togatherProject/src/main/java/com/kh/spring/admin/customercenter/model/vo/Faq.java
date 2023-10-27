package com.kh.spring.admin.customercenter.model.vo;

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
public class Faq {
	 private String faqNo;
	 private String faqTitle;
	 private String faqContent;
	 private String faqStatus;
}
