package com.omg.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.omg.dao.*;
import com.omg.dto.*;

@Service
public class DashboardService {

	@Autowired
	private StudyDAO stdDAO; 
	
	@Autowired
	private MessageDAO msgDAO;
	
	@Autowired
	private NoticeDAO notDAO;
	
	public Integer studyCount(String id){
		Integer result = stdDAO.studyCount(id);
		return result;
	}
	
	public List<Messages> msgLatelyByDate(String userId){
		List<Messages> list = msgDAO.msgLatelyByDate(userId);
		return list;
	}
	
	public Integer Ocount() {
		return notDAO.Ocount();
	}
	
}
