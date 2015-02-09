package com.omg.dao;

import java.util.*;

import com.omg.dto.*;

public interface ProjectDAO {
	// 영업
	List<Projects> selectProject(int page, int date);
	int salProjectTotle(int date);
	Projects salProjectByProId(String proId);
	int salProjectUpdate(Projects pro);
	int salProjectInsert(Projects pro);
	public int deletePro(String[] proids);
	List<String> salSelectTechs(String proId);
	int salProTechInsert(String proId, String TechId);
	int salProTechByDelete(String proId, String TechId);
	int salProTechDelete(String proId);
	
	// 인사회계
	long sumProPrice(String year);
	long sumBydeptProPrice(Map map);
	
	
	// 경영
	List<Projects> runSelectPro(int page);
	int runSelectProTotle();
	int runProInApp(String proId, String app, String appName);
	int clearProEmp(String proId);
}