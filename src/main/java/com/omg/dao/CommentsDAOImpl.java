package com.omg.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.omg.dto.Comments;

@Repository
public class CommentsDAOImpl implements CommentsDAO{
	@Autowired
	private SqlSession sqlSession;
	@Override
	public int insertComments(Comments comments) {
		return sqlSession.insert("com.omg.freeboard.insertComments", comments);
	}

	@Override
	public List<Comments> commentsList(int freeboardNum) {
		
		/*Map<String, Integer> pageInfo = new HashMap<String, Integer>();

		int startPage = (page - 1) * 10 + 1;
		int endPage = startPage + (10 - 1);
		
		System.out.println("d " + page)*/;
		
		
		/*pageInfo.put("startPage", startPage);
		pageInfo.put("endPage", endPage);*/
		
		List<Comments> list = sqlSession.selectList("com.omg.freeboard.listComments"/*, pageInfo*/, freeboardNum);
		System.out.println("d " + list.size());
		return list;
	}

	@Override
	public int deleteComments(int commentsNum) {
		return sqlSession.delete("com.omg.freeboard.deleteComment", commentsNum);
	}

	@Override
	public int commentsTotal() {
		int commentsTotal= sqlSession.selectOne("com.omg.freeboard.deleteComments");
		return commentsTotal;
	}

}
