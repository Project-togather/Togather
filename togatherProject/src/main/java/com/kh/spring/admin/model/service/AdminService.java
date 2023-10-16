package com.kh.spring.admin.model.service;

import java.util.ArrayList;

import com.kh.spring.member.model.vo.Member;

public interface AdminService  {
	
	ArrayList<Member> selectMemberList();

}
