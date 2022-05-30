package com.js.testpj.board;

import java.util.Map;

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
	
	
	
	@RequestMapping(value = "/board.detail", method = RequestMethod.GET)
	public String detailBoardPage(HttpServletRequest request, HttpSession session, Board b) {
		
		mDAO.loginCheck(request, session);
		bDAO.boardDetail(request, b);
		
		request.setAttribute("contentPage", "board/boardDetail.jsp");
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
		bDAO.showBoard(request, b);
		
		request.setAttribute("contentPage", "board/board_go.jsp");
		return "main";
	}
	
	
	
	@RequestMapping(value = "/deleteBoard.do", method = RequestMethod.GET)
	public String deleteBoard(HttpServletRequest request, HttpSession session, Board b) {
		
		mDAO.loginCheck(request, session);
		
		bDAO.deleteBoard(request, b);
		bDAO.showBoard(request, b);
		
		request.setAttribute("contentPage", "board/board_go.jsp");
		return "main";
	}

	
	
	
	
	@RequestMapping(value = "/select.delete", method = RequestMethod.GET)
	public String deleteChecked(HttpServletRequest request, HttpSession session, Board b) {
		
		mDAO.loginCheck(request, session);
		
		bDAO.deleteAll(request, b);
		bDAO.showBoard(request, b);
		
		request.setAttribute("contentPage", "board/board_go.jsp");
		return "main";
	}
	
	
	
	
	
	@RequestMapping(value = "/modifyBoard.go", method = RequestMethod.GET)
	public String modifyPage(HttpServletRequest request, HttpSession session, Board b) {
		
		mDAO.loginCheck(request, session);
		bDAO.boardDetail(request, b);
		
		request.setAttribute("contentPage", "board/boardDetailModi.jsp");
		return "main";
	}
	

	
	@RequestMapping(value = "/modifyBoard.do", method = RequestMethod.POST)
	public String modifyContentOnBoard(HttpServletRequest request, HttpSession session, Board b) {
		
		mDAO.loginCheck(request, session);
		
		bDAO.modifyBoard(request, b);
		bDAO.boardDetail(request, b);
		
		request.setAttribute("contentPage", "board/boardDetail.jsp");
		return "main";
	}
	
	
	

}
