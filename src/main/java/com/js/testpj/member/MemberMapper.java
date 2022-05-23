package com.js.testpj.member;

public interface MemberMapper {
	
	int register(Member m);
	
	int nickCheck(String custom_user_nick);

	int mailCheck(String custom_user_email);

	
	Member loginUser(Member m);

	Member myProfile(Member m);

	int modifyProfile(Member m);

	int deleteMem(Member m);

	String checkingDelete(Member m);

	
	
}
