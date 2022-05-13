package com.js.testpj;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class customEduController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request) {

		request.setAttribute("contentPage", "home.jsp");
		return "main";
	}
	
	
	// 로고를 클릭하면 메인 페이지로
	@RequestMapping(value = "/main.go", method = RequestMethod.GET)
	public String index(HttpServletRequest request) {

		return home(request);
	}
	
	
	
	

}
