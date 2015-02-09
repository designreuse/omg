package com.omg.dao;

import java.util.List;
import java.util.Map;

import com.omg.dto.DProcess;

public interface DProDAO {
	
	DProcess dPro(String employeeId);
	List<DProcess> listProjects(String employeeId);
	List<DProcess> listColleague(String employeeId);
	List<DProcess> startProjects(String employeeId);
	List<DProcess> teams();
	List<DProcess> proing();
	int setTeam(Map map);
	List<DProcess> sparelist(String teamId,String projectId);
	List<DProcess> putlist(String projectId);
	List<DProcess> startpro(String teamId);
	int setpeople(String proId,String empId);
	int delete(String proId, String empId);
	List<DProcess> viewlist(String proId);
	int fk(String proId);
}
