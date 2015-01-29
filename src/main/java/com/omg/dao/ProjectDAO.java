package com.omg.dao;

import java.util.*;

import com.omg.dto.*;

public interface ProjectDAO {
	List<Projects> selectProject(int page, int date);
	int salProjectTotle(int date);
	Projects salProjectByProId(String proId);
	int salProjectUpdate(Projects pro);
	int salProjectInsert(Projects pro);
	public int deletePro(String[] proids);
}
