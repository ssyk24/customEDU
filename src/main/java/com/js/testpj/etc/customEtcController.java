package com.js.testpj.etc;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class customEtcController {
	
	@RequestMapping(value = "/wordle.go", method = RequestMethod.GET)
	public String wordlePage(HttpServletRequest request) {

		request.setAttribute("contentPage", "home.jsp");
		return "main";
	}
	

}
