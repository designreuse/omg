package com.omg.dao;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.omg.dto.*;
@Repository
public class NoticeDAOImpl implements NoticeDAO {

	@Autowired
	private SqlSession session;
	
	
	//공지사항 리스트만
	@Override
	public List<Notice> listnotice(int page) {
		
		Map<String, Object> searchInfo = new HashMap<String, Object>();
		
		int startPage = (page-1) * 10 + 1;
		int endPage = startPage + (10 - 1);

		searchInfo.put("startPage", startPage);
		searchInfo.put("endPage", endPage);

		
		
		List<Notice> list = session.selectList("exam.notice.mapper.listboard", searchInfo);
		return list;
	}

	
	//공지사항 토탈카운트
	@Override
	public int totalCount(String dept, String checked) {
		
		Map<String, String> map = new HashMap<String, String>();

		if(checked.equalsIgnoreCase("O")){
			map.put("checked", checked);
			
		}else{
			map.put("checked", checked);
			map.put("dept", dept);
		}
		int count=session.selectOne("exam.notice.mapper.totalCount",map);
		return count;
	}
	
	
	
	
	@Override
	public int insertnotice(Notice notice) {
	//	안해도됨 String sql="insert into notices(?,?,?,?,?,?,?)";
			int insert=session.insert("exam.notice.mapper.insertboard",notice);
		return insert;
	}


	@Override
	public Notice detailNotice(int notice_num) {
		
		Notice detail = session.selectOne("exam.notice.mapper.detailNotice",notice_num);
		
		return detail;
	}
	
	
	@Override
	public int deleteNotice(String notice_num) {
	
		int delete = session.delete("exam.notice.mapper.deleteNotice",notice_num);
		
		return delete;
	}

	
	@Override
	public int updateNotice(Notice notice) {

		int update = session.update("exam.notice.mapper.updateNotice",notice);

		return update;
	}
	
	//count 해주는거
	@Override
	public int countNotice(int notice_num) {
		int count=session.update("exam.notice.mapper.countNotice",notice_num);
		return count;
	}

	@Override
	public int deptCount(String dept, String checked) {
		Map<String , String> map= new HashMap<String, String>();
		map.put("dept", dept);
		map.put("checked", checked);
		int count=session.selectOne("exam.notice.mapper.totalCountdept",map);
		return count;
	}

	
	
	//dept 여러개일때 리스트
	@Override
	public List<Notice> listdept(int page, String dept,String checked) {
		Map<String, Object> searchInfo = new HashMap<String, Object>();
		
		int startPage = (page-1) * 10 + 1;
		int endPage = startPage + (10 - 1);
		
		searchInfo.put("startPage", startPage);
		searchInfo.put("endPage", endPage);
		if(checked.equals("O")){
			searchInfo.put("checked", checked);
		}else{
			searchInfo.put("dept", dept);
			searchInfo.put("checked", checked);
		}
		List<Notice> list = session.selectList("exam.notice.mapper.listdept",searchInfo);
		return list;
	}


	@Override
	public int Ocount() {
		return session.selectOne("exam.notice.mapper.ocount");
		
	}



}
