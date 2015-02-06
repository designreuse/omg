package com.omg.dao;

import java.util.*;

import com.omg.dto.*;

public interface NoticeDAO {
	List<Notice> listnotice(int page);//공지사항 리스트
	int totalCount(String dept,String checked);//공지사항 페이징카운트
	int insertnotice(Notice notice);//글쓰기
	Notice detailNotice(int notice_num);//상세보기
	int deleteNotice(String notice_num);//삭제하기
	int updateNotice(Notice notice);//업뎃하기

	int deptCount(String dept, String checked);//부서별 카운트
	int countNotice(int notice_num);//조회수
	List<Notice> listdept(int page, String dept,String checked);//리스트 부서별로
	
	Integer Ocount();
}
