package com.js.testpj.member;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
