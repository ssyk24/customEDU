package com.js.testpj.board;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class customBoardController {
	
//	@Autowired
//	private BoardDAO bDAO;
//	
//	@Autowired
//	private Board b;
//	
	
	
	
	@RequestMapping(value = "/board.go", method = RequestMethod.GET)
	public String boardPage(HttpServletRequest request) {

		request.setAttribute("contentPage", "board.jsp");
		return "main";
	}
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/qna.go", method = RequestMethod.GET)
	public String qnaPage(HttpServletRequest request) {
		
		request.setAttribute("contentPage", "qna.jsp");
		return "main";
	}
	

}
