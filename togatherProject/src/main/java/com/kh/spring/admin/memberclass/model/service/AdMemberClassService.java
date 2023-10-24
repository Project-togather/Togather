package com.kh.spring.admin.memberclass.model.service;

import java.util.ArrayList;

import com.kh.spring.club.model.vo.Club;
import com.kh.spring.common.model.vo.PageInfo;

public interface AdMemberClassService {
	
	int challengeListCount();
	
	ArrayList<Club> challengeList(PageInfo pi);

}
