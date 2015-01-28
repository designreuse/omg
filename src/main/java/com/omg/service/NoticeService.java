package com.omg.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.omg.dao.*;
import com.omg.dto.*;
@Repository
public class NoticeService {

	@Autowired
	private NoticeDAO noticedao;
	
	@Autowired
	private EmployeeDAO empdao;
	
	public List<Notice> listnotice(int page) {
		List<Notice> list = noticedao.listnotice(page);
		return list;
	}

	public int insertnotice(Notice notice) {
		int insert = noticedao.insertnotice(notice);
		return insert;
	}
	
	
	public Notice detailNotice(int notice_num) {
		Notice detail = noticedao.detailNotice(notice_num);
		return detail;
	}
	
	//삭제하기
	public int delectNotice(String notice_num) {
		int delete =noticedao.deleteNotice(notice_num);
		return delete;
	}
	
	
	//업데이트
	public int updateNotice(Notice notice) {
		int update = noticedao.updateNotice(notice);

		return update;
	}
	
	
	
	//페이지넘기기
	public int totalCount(String dept,String checked) {
		
		int total=noticedao.totalCount(dept,checked);
		return total;
	}
	
	//조회수하기
	public int countNotice(int notice_num) {
		
		int count=noticedao.countNotice(notice_num);
		return count;
	}
	
	//checked가 x일때 카운트
	public int deptCount(String dept, String checked) {
		
		int count = noticedao.deptCount(dept, checked);
		return count;
	}
	
	//checked가 여러일때 리스트뿌리기
	public List<Notice> listdept(int page, String dept,String checked) {
		List<Notice> list = noticedao.listdept(page, dept,checked);
		return list;
	}
	
	
	public List<Notice> selectEmpName(List<Notice> notices){
		List<Employees> emps = empdao.selectEmp();
		List<Notice> list = new ArrayList<Notice>();
		for(Notice notice : notices){
			for(Employees names : emps){
				if((notice.getWriter()).equalsIgnoreCase(names.getEmployeeId())){
					notice.setWriterName(names.getName());
					list.add(notice);
				}
			}
		}
		return list;
	}

	

	
	
}
