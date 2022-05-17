package com.js.testpj;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.js.testpj.member.MemberDAO;

@Controller
public class customEduController {
	
	
	@Autowired
	private MemberDAO mDAO;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request, HttpSession session) {

		
		mDAO.loginCheck(request, session);
		
		request.setAttribute("contentPage", "home.jsp");
		return "main";
	}
	
	
	// 로고를 클릭하면 메인 페이지로
	@RequestMapping(value = "/main.go", method = RequestMethod.GET)
	public String index(HttpServletRequest request, HttpSession session) {

		return home(request, session);
	}
	
	
	
	

}
