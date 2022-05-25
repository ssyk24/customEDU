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
	
	@Autowired
	private BoardDAO bDAO;
	
	
	
	
	@RequestMapping(value = "/board.go", method = RequestMethod.GET)
	public String boardPage(HttpServletRequest request, HttpSession session, Board b) {
		
		mDAO.loginCheck(request, session);
		bDAO.showBoard(request, b);

		request.setAttribute("contentPage", "board/board.jsp");
		return "main";
	}
	
	
	
	
	@RequestMapping(value = "/writeBoard.go", method = RequestMethod.GET)
	public String writePage(HttpServletRequest request, HttpSession session, Board b) {
		
		mDAO.loginCheck(request, session);
		
		request.setAttribute("contentPage", "board/boardInsert.jsp");
		return "main";
	}
	
	
	
	
	@RequestMapping(value = "/writeBoard.do", method = RequestMethod.POST)
	public String writeOnBoard(HttpServletRequest request, HttpSession session, Board b) {
		
		mDAO.loginCheck(request, session);
		
		bDAO.insertBoard(request, b);
		
		request.setAttribute("contentPage", "board/boardInsert.jsp");
		return "main";
	}
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/qna.go", method = RequestMethod.GET)
	public String qnaPage(HttpServletRequest request, HttpSession session) {
		
		mDAO.loginCheck(request, session);
		
		request.setAttribute("contentPage", "board/qna.jsp");
		return "main";
	}
	

}
