package com.omg.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omg.dao.EmployeeDAO;
import com.omg.dao.FreeBoardDAO;
import com.omg.dto.Employees;
import com.omg.dto.FreeBoard;

@Service
public class FreeBoardService {
	@Autowired
	private FreeBoardDAO freeBoardDAO;
	@Autowired
	private EmployeeDAO employeeDAO;

	public FreeBoard freeBoard(int freeboardNum) {
		return freeBoardDAO.board(freeboardNum);
	}

	public int insertList(FreeBoard Board) {
		return freeBoardDAO.insertList(Board);
	}

	public List<FreeBoard> listBoard(int page) {
		List<FreeBoard> list = freeBoardDAO.listBoard(page);
		
		System.out.println(list.size());
		
		return list;
	}
	public List<FreeBoard> selectListBoard(int page, String title) {
		List<FreeBoard> list = freeBoardDAO.selectList(page, title);
		
		System.out.println(list.size());
		
		return list;
	}
	
	public List<FreeBoard> selectEmpName(List<FreeBoard> freeBoards){
		List<Employees> emps = employeeDAO.selectEmp();
		List<FreeBoard> list = new ArrayList<FreeBoard>();
		for(FreeBoard freeBoard : freeBoards){
			for(Employees names : emps){
				if((freeBoard.getWriter()).equalsIgnoreCase(names.getEmployeeId())){
					freeBoard.setWriterName(names.getName());
					list.add(freeBoard);
				}
			}
		}
		return list;
	}
	public int delete(int freeboardNum){
		return freeBoardDAO.deleteBoard(freeboardNum);
	}
	public int update(FreeBoard Board){
		return freeBoardDAO.updateList(Board);
	}
	public int totalCount() {
		int totalCount = freeBoardDAO.totalCount();
		return totalCount;
	
	}
	public int count(int freeboardNum){
		int count = freeBoardDAO.count(freeboardNum);
		System.out.println(count);
		return count;
	}

}
