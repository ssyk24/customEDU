package com.js.testpj.board;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class BoardDAO {
	
	@Autowired
	private SqlSession ss;

	public void showBoard(HttpServletRequest request, Board b) {

		Board[] dbBoard = ss.getMapper(BoardMapper.class).showAllBoard(b);
		
		request.setAttribute("boardList", dbBoard);
		
	}

	public void insertBoard(HttpServletRequest request, Board b) {
		
		String path = request.getSession().getServletContext().getRealPath("resources/board_img");
		MultipartRequest mr = null;
		
		System.out.println(path);
		
		try {
			
		mr = new MultipartRequest(request, path, 8*1024*1024, "utf-8", new DefaultFileRenamePolicy());
		
		String boardWriter = mr.getParameter("board_writer");
		String boardTitle = mr.getParameter("board_title");
		String boardText = mr.getParameter("board_text");
		String boardImg = mr.getFilesystemName("board_img_path");
		
		b.setBoard_writer(boardWriter);
		b.setBoard_title(boardTitle);
		b.setBoard_text(boardText);
		
		if (boardImg == null) {
			b.setBoard_img_path("noImage.png");
		} else {
			b.setBoard_img_path(boardImg);
		} 
		

		if (ss.getMapper(BoardMapper.class).saveBoard(b) == 1) {
			System.out.println("등록 성공");
		} else {
			System.out.println("등록 실패");
		}
		
		
		
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("등록 실패(오류)");
		}
		
	}
	
	

	public void boardDetail(HttpServletRequest request, Board b) {
		
//		b.setBoard_seq(request.getParameter("board_seq"));
		
		Board dbBoard = ss.getMapper(BoardMapper.class).showDetail(b);
		
		request.setAttribute("boardDetail", dbBoard);
		
		
	
	}

	public void deleteAll(HttpServletRequest request, Board b) {

//		for (iterable_type iterable_element : iterable) {
//			
//		}
		
			b.setBoard_seq(request.getParameter("board_seq"));
			
			if (ss.getMapper(BoardMapper.class).deletSelected(b) >= 1) {
				System.err.println("삭제 성공");
			} else {
				System.err.println("삭제 실패");
			}
		
	}
	
	
	
	
	public void deleteBoard(HttpServletRequest request, Board b) {
		
		b.setBoard_seq(request.getParameter("board_seq"));
		
		if (ss.getMapper(BoardMapper.class).deletContentOnBoard(b) == 1) {
			System.err.println("삭제 성공");
		} else {
			System.err.println("삭제 실패");
		}
		
	}

	
public void modifyBoard(HttpServletRequest request, Board b) {
		
		String path = request.getSession().getServletContext().getRealPath("resources/board_img");
		MultipartRequest mr = null;
		
		System.out.println(path);
		
		try {
			
		mr = new MultipartRequest(request, path, 8*1024*1024, "utf-8", new DefaultFileRenamePolicy());
		
		String boardSeqNum = mr.getParameter("board_seq");
		String boardTitle = mr.getParameter("board_title");
		String boardText = mr.getParameter("board_text");
		String boardImg = mr.getFilesystemName("board_img_path");
		
		b.setBoard_seq(boardSeqNum);
		b.setBoard_title(boardTitle);
		b.setBoard_text(boardText);
		
		if (boardImg == null) {
			b.setBoard_img_path("noImage.png");
		} else {
			b.setBoard_img_path(boardImg);
		} 
		

		if (ss.getMapper(BoardMapper.class).modiBoard(b) == 1) {
			System.out.println("수정 성공");
		} else {
			System.out.println("수정 실패");
		}
		
		
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("수정 오류 발생");
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
