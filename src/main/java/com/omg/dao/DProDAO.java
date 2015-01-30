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
}
