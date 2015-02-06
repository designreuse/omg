package com.omg.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omg.dao.StudyDAO;

@Service
public class DashboardService {

	@Autowired
	private StudyDAO dao; 
	
	public Integer studyCount(String id){
		Integer result = dao.studyCount(id);
		return result;
	}
}
