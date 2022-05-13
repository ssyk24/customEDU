package com.js.testpj.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class MemberDAO {

	@Autowired
	private SqlSession ss;

	// 회원가입 기능
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

			// 전화번호 하이픈('-') 제거
			custom_user_phone = custom_user_phone.replaceAll("-", "");

			// 비밀번호 암호화
			BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();
			String securePassword = pwEncoder.encode(custom_user_pswd);

			// 받아오는 값 확인 용
			System.out.println(custom_user_name);
			System.out.println(custom_user_birth);
			System.out.println(custom_user_nick);
			System.out.println(custom_user_email);
			System.out.println(custom_user_address);
			System.out.println(custom_user_phone);
			System.out.println(custom_user_pswd);
			System.out.println(securePassword);

			m.setCustom_user_name(custom_user_name);
			m.setCustom_user_birth(custom_user_birth);
			m.setCustom_user_nick(custom_user_nick);
			m.setCustom_user_email(custom_user_email);
			m.setCustom_user_address(custom_user_address);
			m.setCustom_user_phone(custom_user_phone);
//			m.setCustom_user_pswd(custom_user_pswd);
			m.setCustom_user_pswd(securePassword);

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

	public int nicknameCheck(String custom_user_nick) {
		MemberMapper MemberDAO = ss.getMapper(MemberMapper.class);

		return MemberDAO.nickCheck(custom_user_nick);
	}

	public int emailCheck(String custom_user_email) {
		MemberMapper MemberDAO = ss.getMapper(MemberMapper.class);

		return MemberDAO.mailCheck(custom_user_email);
	}
	
	
	
	
	
	
	

	// 로그인 기능
	public void userLogin(Member m, HttpSession httpSession, HttpServletResponse response, HttpServletRequest request) {
		
		Member dbMember = ss.getMapper(MemberMapper.class).loginUser(m);
		
		System.out.println(dbMember.getCustom_user_email());
		
		BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();
		String custom_user_pswd = request.getParameter("custom_user_pswd");
        
//	    if(pwEncoder.matches(custom_user_pswd, dbMember.getCustom_user_pswd())) {
//	    	httpSession.setAttribute("id", dbMember.getCustom_user_email());
//	    	httpSession.setAttribute("name", dbMember.getCustom_user_name());
//	    	httpSession.setAttribute("nickname", dbMember.getCustom_user_nick());
//	            
//	        out.println("<script>alert('반갑습니다.'); location.href='/';</script>");
//	        out.flush();
//	    } else {
//	        out.println("<script>alert('아이디 또는 비밀번호가 일치하지 않습니다.'); location.href='/app/login/index';</script>");
//	        out.flush();
//	    }


		if (dbMember != null) {
//			if (m.getCustom_user_pswd().equals(dbMember.getCustom_user_pswd())) {
			if(pwEncoder.matches(custom_user_pswd, dbMember.getCustom_user_pswd())) {
				request.getSession().setAttribute("loginMember", dbMember);
				request.getSession().setMaxInactiveInterval(60 * 30);
				System.out.println("로그인 성공");
			} else {
				System.out.println("패스워드가 올바르지 않습니다.");
			}
		} else {
				System.out.println("이메일을 확인해주세요");
		}
		
		
		
		
		
		// 로그인 결과값

		// 회원 정보가 없을 시
//		if (dbMember == null) {
//			result = 0;
//			return result;
//		}
	
//		System.out.println("UserLoginService // 로그인 객체 확인 MemberDAO : " + m);
//		String user_email = m.getCustom_user_email();
//		String user_pw = m.getCustom_user_pswd();
//
//		  
//		Member dbMember = ss.getMapper(MemberMapper.class).loginUser(user_email);
//
//		
//		// 로그인 결과값
//		int result = 0;
//
//		// 회원 정보가 없을 시
//		if (dbMember == null) {
//			result = 0;
//			return result;
//		}
//
//
//		// 입력한 아이디와 스토어id값을 통해 정보가 존재 할 경우
//		if (dbMember != null) {
//			
//			// 아이디,비번,스토어id가 모두 같은경우
//			System.out.println("1단계");
//			if (dbMember.getCustom_user_email().equals(user_email) && dbMember.getCustom_user_pswd().equals(user_pw)) {
//				System.out.println("2단계");
//				
//				// 쿠키 체크 검사
//				Cookie cookie = new Cookie("user_check", user_email);
//				if (user_check.equals("true")) {
//					response.addCookie(cookie);
//					System.out.println("3단계-쿠키 아이디저장 O");
//					  // 쿠키 확인
//					  System.out.println("Cookie : " + cookie);
//				} else {
//					System.out.println("3단계-쿠키 아이디저장 X");
//					cookie.setMaxAge(0);
//					response.addCookie(cookie);
//				}
//
//				System.out.println("3단계-로그인단계");
//				// 세션 저장하기 전에 비밀번호 가리기
//				m.setM_pw("");
//
//				// 세션에 vo 객체 저장
//				request.getSession().setAttribute("loginMember", dbMember);
//				request.getSession().setMaxInactiveInterval(60 * 30);
//
//				result = 1;
//
//				// 중복로그인 end
//			} else {
//				System.out.println("로그인 정보를 정확히 입력해주세요.");
//				result = -4;
//				return result;
//			}
//		
//	
//
//		}
//		return result;
	}

	public boolean loginCheck(HttpServletRequest request) {

		Member m = (Member) request.getSession().getAttribute("loginMember");
		if (m != null) {
			return true;
		} else {
			return false;
		}
		
	}

	public void logout(HttpServletRequest req) {
		req.getSession().setAttribute("loginMember", null);
	}

}
