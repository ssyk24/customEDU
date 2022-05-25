package com.js.testpj.member;


import javax.servlet.http.Cookie;
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
	
	
	
	
		
//		String delCheck = ss.getMapper(MemberMapper.class).checkingDelete(m);
//	
//		if (delCheck == "y") {
//			System.out.println(delCheck);
//	
//			System.out.println("탈퇴된 회원");
//			request.setAttribute("contentPage", "member/login_failed.jsp");
//			request.setAttribute("result", "로그인 실패 <br><br> 이미 탈퇴된 회원입니다.");
//		}
	
	

	// 로그인 기능
	public void userLogin(Member m, HttpSession session, HttpServletResponse response, HttpServletRequest request) {
		
		session = request.getSession();
		
		Member dbMember = ss.getMapper(MemberMapper.class).loginUser(m);
		String delCheck = ss.getMapper(MemberMapper.class).checkingDelete(m);
		
		// pw 암호화 기능
		BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();
		// input에 입력한 pw값
		String custom_user_pswd = request.getParameter("custom_user_pswd");
		// Remember Me 체크
		String idRemember = request.getParameter("loginRemember");
		
		// 회원 정보가 있을 경우
		if (dbMember != null) {
			////////////// 암호화된 패스워드 복원/////////////////////////////////
			if(pwEncoder.matches(custom_user_pswd, dbMember.getCustom_user_pswd())) {
				
				//////////// 자동 로그인 하지 않음//////////////////////
				if (idRemember == null) {
				System.out.println(idRemember + "-자동 로그인 X");
				/////////////////////////////////////////////////
				} else {
					//////////// 자동 로그인 체크 //////////////////////////
					System.out.println(idRemember + "-자동 로그인 V");
					
					//loginCookie라는 키로 세션아이디를 담아 쿠키를 생성합니다.
				    Cookie loginCookie = new Cookie("loginCookie", session.getId());
				    
				    loginCookie.setPath("/testpj"); //쿠키의 저장경로는 기본 uri 경로 홈페이지 시작uri
				    loginCookie.setMaxAge(60*60*24*7); //쿠키유지시간 7일로 설정
				    
				    //쿠키는 클라이언트에 보낼떄 응답객체에 담아서 보냅니다.
				    response.addCookie(loginCookie);//response에 쿠키를담아 클라이언트에게 보냅니다.
				 ///////////////////////////////////////////////////////
				}
				
				if (delCheck.equals("n")) {
				////////////////////////////////////////////////
				session.setAttribute("loginMember", dbMember);
				
				System.out.println(dbMember.getCustom_user_email());
				System.out.println("로그인 성공");
				request.setAttribute("contentPage", "member/member_success.jsp");
				request.setAttribute("result", "Login Success!");
				///////////////////////////////////////////////
				} else {
				//////////////////////////////////////////////
					System.out.println("탈퇴된 회원");
					request.setAttribute("contentPage", "member/login_failed.jsp");
					request.setAttribute("result", "로그인 실패 <br><br> 이미 탈퇴된 회원입니다.");
				//////////////////////////////////////////////
					
				}
			
			
			} else {
				System.out.println("로그인 실패(PW)");
				request.setAttribute("contentPage", "member/login_failed.jsp");
				request.setAttribute("result", "로그인 실패 <br><br> 패스워드를 확인해주세요!");
			}
			
		} else { 
			// 회원 정보가 없을 경우
			System.out.println("로그인 실패(eMail)");
			request.setAttribute("contentPage", "member/login_failed.jsp");
			request.setAttribute("result", "로그인 실패 <br><br> 이메일을 확인해주세요!");
		}
		

	}
	
	
	
	
	
	
	
	
	// 로그인 체크
	public boolean loginCheck(HttpServletRequest request, HttpSession session) {
		
		session = request.getSession();
		session.setMaxInactiveInterval(60 * 10);
		
		Member m = (Member) session.getAttribute("loginMember");
		
		if (m != null) {
			System.out.println("로그인 세션 O");
			return true;
		} else {
			System.out.println("로그인 세션 X");
			return false;
		}
		
	}


	
	
	
	
	// 로그아웃 - 세샨, 쿠키 삭제
	public void logout(HttpServletRequest request,HttpServletResponse response, HttpSession session) {
		session.setAttribute("loginMember", null);

		Cookie delCookie =  new Cookie("loginCookie", null);
		delCookie.setMaxAge(0);
		response.addCookie(delCookie);
	}

	
	
	
	// 프로필 정보 Select
	public void letGoProfile(HttpServletRequest request, Member m) {
			
		m.setCustom_user_seq(request.getParameter("custom_user_seq"));
		
//		System.out.println(m.getCustom_user_seq());
		
		Member user = ss.getMapper(MemberMapper.class).myProfile(m);
		
		
		request.setAttribute("user", user);
		
		
	}
	
	


	public void modProfile(HttpServletRequest request, Member m) {

			// register.jsp에서 값 받아오기
			String custom_user_seq = request.getParameter("custom_user_seq");
			String custom_user_name = request.getParameter("custom_user_name");
			String custom_user_nick = request.getParameter("custom_user_nick");
			String custom_user_address = request.getParameter("custom_user_address");
			String custom_user_phone = request.getParameter("custom_user_phone");

			// 전화번호 하이픈('-') 제거
			custom_user_phone = custom_user_phone.replaceAll("-", "");

			// 받아오는 값 확인 용
			System.out.println(custom_user_seq);
			System.out.println(custom_user_name);
			System.out.println(custom_user_nick);
			System.out.println(custom_user_address);
			System.out.println(custom_user_phone);

			m.setCustom_user_seq(custom_user_seq);
			m.setCustom_user_name(custom_user_name);
			m.setCustom_user_nick(custom_user_nick);
			m.setCustom_user_address(custom_user_address);
			m.setCustom_user_phone(custom_user_phone);

			if (ss.getMapper(MemberMapper.class).modifyProfile(m) == 1) {
				System.out.println("수정 성공");
			} else {
				System.out.println("수정 실패");
			}
	}


	public void delMember(HttpServletRequest request, Member m) {

		String custom_user_seq = request.getParameter("custom_user_seq");

		m.setCustom_user_seq(custom_user_seq);
		
		if (ss.getMapper(MemberMapper.class).deleteMem(m) == 1) {
			System.out.println("회원 탈퇴");
		} else {
			System.out.println("탈퇴 실패");
		}
		
	}


	public void viewAllMember(HttpServletRequest request, Member m) {

		Member[] dbMember = ss.getMapper(MemberMapper.class).selectAllMem(m);
		
		for (Member member : dbMember) {
			
			if (member.getCustom_user_auth().equals("1")) {
				member.setCustom_user_auth("관리자");
			} else {
				member.setCustom_user_auth("사용자");
			}
			
//			System.out.println(member.getCustom_user_auth());
		}
		
		
		request.setAttribute("membersInfo", dbMember);
		
	}


}
