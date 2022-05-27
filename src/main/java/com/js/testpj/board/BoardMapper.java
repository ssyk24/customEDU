package com.js.testpj.board;

public interface BoardMapper {

	Board[] showAllBoard(Board b);

	int saveBoard(Board b);

	Board showDetail(Board b);

	int deletContentOnBoard(Board b);

	int modiBoard(Board b);

	int deletSelected(Board b);

}
