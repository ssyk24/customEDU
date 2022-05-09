package com.js.testpj.member;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberDAO {
	
	@Autowired
	private SqlSession ss;
	
	//회원가입
	public void registerMember(Member m, HttpServletRequest request) {
		
		try {
			
			// register.jsp에서 값 받아오기
			String custom_user_name = request.getParameter("custom_user_name");
			String custom_user_birth = request.getParameter("custom_user_birth");
			String custom_user_nick = request.getParameter("custom_user_nick");
			String custom_user_email = request.getParameter("custom_user_email");
			String custom_user_address = request.getParameter("custom_user_address");
			String custom_user_phone = request.getParameter("custom_user_phone");
			String custom_user_pswd = request.getParameter("custom_user_pswd");
			String custom_user_pswd_check = request.getParameter("custom_user_pswd_check");
			// Date는 sql에 sysdate
			
			System.out.println(custom_user_name);
			System.out.println(custom_user_birth);
			System.out.println(custom_user_nick);
			System.out.println(custom_user_email);
			System.out.println(custom_user_address);
			System.out.println(custom_user_phone);
			System.out.println(custom_user_pswd);
			System.out.println(custom_user_pswd_check);
			
			
			m.setCustom_user_name(custom_user_name);
			m.setCustom_user_birth(custom_user_birth);
			m.setCustom_user_nick(custom_user_nick);
			m.setCustom_user_email(custom_user_email);
			m.setCustom_user_address(custom_user_address);
			m.setCustom_user_phone(custom_user_phone);
			m.setCustom_user_name(custom_user_pswd);
			
			if (ss.getMapper(MemberMapper.class).register(m) == 1) {
				System.out.println("가입 성공");
			} else {
				System.out.println("가입 실패");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("오류 발생");
		}
		
	}

}
