package com.js.testpj.member;

import javax.servlet.http.HttpServletRequest;

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
	public String registerPage(HttpServletRequest request) {

		return "member/register";
	}
	
	
	@RequestMapping(value = "/register.do", method = RequestMethod.POST)
	public String registerInsert(HttpServletRequest request, Member m) {
		
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
	
	
	
	
	
	@RequestMapping(value = "/login.go", method = RequestMethod.GET)
	public String loginPage(HttpServletRequest request) {
		
		return "member/login";
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
