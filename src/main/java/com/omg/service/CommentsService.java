package com.omg.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omg.dao.CommentsDAO;
import com.omg.dao.EmployeeDAO;
import com.omg.dto.Comments;
import com.omg.dto.Employees;

@Service
public class CommentsService {
	@Autowired
	private CommentsDAO commentsDAO;
	@Autowired
	private EmployeeDAO employeeDAO;
	
	public int insertComments(Comments comments) {
		return commentsDAO.insertComments(comments);
	}
	public List<Comments> commentsList(int freeboardNum) {
		List<Comments> commentsList = commentsDAO.commentsList(freeboardNum);
		return commentsList;
	}
	public int deleteComments(int commentsNum) {
		return commentsDAO.deleteComments(commentsNum);
	}
	public List<Comments> selectEmpName(List<Comments> commentss){
		List<Employees> emps = employeeDAO.selectEmp();
		List<Comments> commentsList = new ArrayList<Comments>();
		for(Comments comments : commentss){
			for(Employees names : emps){
				if((comments.getCommentsWriter()).equalsIgnoreCase(names.getEmployeeId())){
					comments.setCommentsWriterName(names.getName());
					commentsList.add(comments);
				}
			}
		}
		return commentsList;
	}
	public int commentsTotal() {
		int totalcount = commentsDAO.commentsTotal();
		return totalcount;
	}
	
}
