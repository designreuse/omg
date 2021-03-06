package com.omg.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omg.dao.DProDAO;
import com.omg.dto.DProcess;


@Service
public class DProService {

	@Autowired
	private DProDAO dProDAO;

	public List<DProcess> listColleague(String proId) {
		List<DProcess> listColleague = dProDAO.listColleague(proId);
		return listColleague;
	}

	public List<DProcess> listProjects(String employeeId) {
		List<DProcess> listPro = dProDAO.listProjects(employeeId);
		return listPro;
	}

	public List<DProcess> dPro(String employeeId) {
		List<DProcess> dp = dProDAO.dPro(employeeId);
		return dp;
	}

	public List<DProcess> startProjects(String employeeId) {
		List<DProcess> startPro = dProDAO.startProjects(employeeId);
		return startPro;
	}



	public List<DProcess> teams() {

		List<DProcess> teams = dProDAO.teams();
		return teams;

	}
	public List<DProcess> proing() {

		List<DProcess> proing = dProDAO.proing();
		return proing;

	}

	public int setTeams(Map map) {

		
		return dProDAO.setTeam(map);

	}
	
	public List<DProcess> sparelist(String teamId, String projectId) {
		List<DProcess> list = dProDAO.sparelist(teamId, projectId);
		return list;
	}
	public List<DProcess> putlist(String projectId) {
		List<DProcess> list = dProDAO.putlist(projectId);
		return list;
		}
	public List<DProcess> startpro(String teamId) {
		List<DProcess> list = dProDAO.startpro(teamId);
		return list;
	}
	
	public int setpeople(String proId, String empId) {
		int set = dProDAO.setpeople(proId, empId);
		return set;
	}
	
	public int delete(String proId, String empId) {
		int delete =dProDAO.delete(proId, empId);
		return delete;
	}
	
	public List<DProcess> viewlist(String proId) {
		List<DProcess> list = dProDAO.viewlist(proId);
		return list;
	}
	public int fk(String proId) {
		return dProDAO.fk(proId);
	}
}
