package com.omg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omg.dao.DProDAO;
import com.omg.dto.DProcess;
import com.omg.dto.FreeBoard;

@Service
public class DProService {

	
	@Autowired
	private DProDAO dProDAO;
	
	public List<DProcess> listColleague(String employeeId){
		List<DProcess> listColleague = dProDAO.listColleague(employeeId);
		return listColleague;
	}
	
	public List<DProcess> listProjects(String employeeId){
		List<DProcess> listPro = dProDAO.listProjects(employeeId);
		return listPro;
	}
	
	public DProcess dPro(String employeeId) {
		DProcess dp =dProDAO.dPro(employeeId);
		return dp;
	} 
	
	public List<DProcess> startProjects(String employeeId){
		List<DProcess> startPro = dProDAO.startProjects(employeeId);
		return startPro;
	}
	
	public List<DProcess> SCVList(){
		System.out.println("zz");
		List<DProcess> SCVList = dProDAO.SCVList();
		return SCVList;
		//return null;
	}
	
	public List<DProcess> teams(){
		
		List<DProcess> teams = dProDAO.teams();
		return teams;
		
	}
}
