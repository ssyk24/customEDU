package com.js.testpj.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.js.testpj.member.MemberDAO;


@Controller
public class customBoardController {
	
	@Autowired
	private MemberDAO mDAO;
	
//	@Autowired
//	private BoardDAO bDAO;
//	
//	@Autowired
//	private Board b;
	
	
	
	
	@RequestMapping(value = "/board.go", method = RequestMethod.GET)
	public String boardPage(HttpServletRequest request, HttpSession session) {
		
		mDAO.loginCheck(request, session);

		request.setAttribute("contentPage", "board/board.jsp");
		return "main";
	}
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/qna.go", method = RequestMethod.GET)
	public String qnaPage(HttpServletRequest request) {
		
		request.setAttribute("contentPage", "qna.jsp");
		return "main";
	}
	

}
