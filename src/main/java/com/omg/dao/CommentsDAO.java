package com.omg.dao;

import java.util.List;

import com.omg.dto.Comments;


public interface CommentsDAO {
	
	int insertComments(Comments comments);
	List<Comments> commentsList(int freeboardNum);
	int deleteComments(int commentsNum);
	int commentsTotal();
}
