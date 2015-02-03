package com.omg.dao;

import java.util.*;

import com.omg.dto.*;

public interface MProDAO {
	List<MProcess> relist(String employeeId);
	List<MProcess> colist(String employeeId);
	List<MProcess> exlist(String employeeId);
	List<MProcess> sparelist(String teamId,String projectId);
	List<MProcess> putlist(String projectId);
	List<MProcess> startpro(String teamId);
	int setpeople(String proId,String empId);
	int delete(String proId, String empId);
	List<MProcess> viewlist(String proId);
	List<MProcess> proing();
	List<MProcess> teams();
	int setTeam(String projectId,String teamId);
	List<MProcess> startProjects(String employeeId);
	}
