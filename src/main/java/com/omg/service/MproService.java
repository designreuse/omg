package com.omg.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.omg.dao.*;
import com.omg.dto.*;
@Service
public class MproService {

	@Autowired
	private MProDAO dao;
	
	
	
	public List<MProcess> relist(String employeeId) {
		List<MProcess> list =dao.relist(employeeId);
		return list;
	}
	
	public List<MProcess> colist(String proId) {
		List<MProcess> list = dao.colist(proId);
		return list;
	}
	
	public List<MProcess> exlist(String employeeId) {
		List<MProcess> list = dao.exlist(employeeId);
		return list;
		
	}
	public List<MProcess> sparelist(String teamId,String projectId) {
		List<MProcess> list = dao.sparelist(teamId,projectId);
		return list;
	}
	public List<MProcess> putlist(String projectId) {
		List<MProcess> list = dao.putlist(projectId);
		return list;
		}
	public List<MProcess> startpro(String teamId) {
		List<MProcess> list = dao.startpro(teamId);
		return list;
	}
	
	public int setpeople(String proId, String empId) {
		int set = dao.setpeople(proId, empId);
		return set;
	}
	
	public int delete(String proId, String empId) {
		int delete =dao.delete(proId, empId);
		return delete;
	}
	
	public List<MProcess> viewlist(String proId) {
		List<MProcess> list = dao.viewlist(proId);
		return list;
	}
	
	public List<MProcess> proing() {
		List<MProcess> list = dao.proing();
		return list;
	}
	
	public List<MProcess> teams() {
		List<MProcess> list = dao.teams();
		return list;
	}
	
	public int setTeam(String projectId, String teamId) {
		
		int setteam = dao.setTeam(projectId, teamId);
		return setteam;
		
	}
	public List<MProcess> startProjects(String employeeId) {
		List<MProcess> list =dao.startProjects(employeeId);
		return list;
	}
	public int fk(String proId) {
		return dao.fk(proId);
	}
}
