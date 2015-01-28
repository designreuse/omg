package com.omg.dao;

import java.util.List;

import com.omg.dto.FreeBoard;

public interface FreeBoardDAO {

	FreeBoard board(int freeboardNum);
	int insertList(FreeBoard Board);
	List<FreeBoard> listBoard(int page);
	int deleteBoard(int freeboardNum);
	int updateList(FreeBoard Board);
	int totalCount();
	int count(int freeboardNum);//조회수
	List<FreeBoard> selectList(int page, String title);
}
