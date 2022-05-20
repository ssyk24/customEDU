package com.js.testpj.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class customUserController {
	
	@Autowired
	private MemberDAO mDAO;
	
	
	
	@RequestMapping(value = "/register.go", method = RequestMethod.GET)
	public String registerPage(HttpServletRequest request, HttpSession session) {
		
		mDAO.loginCheck(request, session);
		
		return "member/register";
	}
	
	
	@RequestMapping(value = "/register.do", method = RequestMethod.POST)
	public String registerInsert(HttpServletRequest request, Member m, HttpSession session) {
		
		mDAO.registerMember(m, request);
		
		return "member/login";
	}
	
	
	
		// 닉네임 중복 체크 컨트롤러
		@RequestMapping(value = "/register.nicknameCheck", method = RequestMethod.GET)
		@ResponseBody
			public int nicknameCheck(@RequestParam("custom_user_nick") String custom_user_nick) {

				return mDAO.nicknameCheck(custom_user_nick);
		}
		
		
		// email 중복 체크 컨트롤러
		@RequestMapping(value = "/register.emailCheck", method = RequestMethod.GET)
		@ResponseBody
		public int emailCheck(@RequestParam("custom_user_email") String custom_user_email) {
			
			return mDAO.emailCheck(custom_user_email);
		}
	
	
		
		
		
		
		
		// 프로필 페이지로
		@RequestMapping(value = "/profile.go", method = RequestMethod.GET)
		public String profilePage(HttpServletRequest request, HttpSession session, Member m) {
			
			mDAO.loginCheck(request, session);
			mDAO.letGoProfile(request, m);
			
			request.setAttribute("contentPage", "member/profile.jsp");
			return "main";
		}
		
		
		
		
	
	
	// 로그인 페이지로
	@RequestMapping(value = "/login.go", method = RequestMethod.GET)
	public String loginPage(HttpServletRequest request, HttpSession session) {
		
		mDAO.loginCheck(request, session);
		
		return "member/login";
	}
	
	
	
	// 로그인하기
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String doingLogin(Member m, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		mDAO.userLogin(m, session, response, request);
		mDAO.loginCheck(request, session);
		
		return "main";
	}
	
	
		// 로그아웃
		@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
		public String logout(Member m, HttpServletRequest request, HttpSession session, HttpServletResponse response) {
			mDAO.logout(request,response);
			mDAO.loginCheck(request, session);
			request.setAttribute("contentPage", "member/member_success.jsp");
			return "main";
		}
	
	
	
	
	
	
	
	@RequestMapping(value = "/forgetPswd.go", method = RequestMethod.GET)
	public String forgetPage(HttpServletRequest request) {
		
		return "member/forgetPswd";
	}
	
	
	
	@RequestMapping(value = "/manage.go", method = RequestMethod.GET)
	public String managePage(HttpServletRequest request) {
		
		request.setAttribute("contentPage", "member/memInfo.jsp");
		return "main";
	}
	

}
