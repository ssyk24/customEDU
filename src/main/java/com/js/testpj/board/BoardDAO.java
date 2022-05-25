package com.js.testpj.board;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardDAO {
	
	@Autowired
	private SqlSession ss;

	public void showBoard(HttpServletRequest request, Board b) {

		Board[] dbBoard = ss.getMapper(BoardMapper.class).showAllBoard(b);
		
		request.setAttribute("boardList", dbBoard);
		
	}

	public void insertBoard(HttpServletRequest request, Board b) {

		if (ss.getMapper(BoardMapper.class).saveBoard(b) == 1) {
			System.out.println("등록 성공");
		} else {
			System.out.println("등록 실패");
		}
		
	}

	public void boardDetail(HttpServletRequest request, Board b) {

		
	
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
