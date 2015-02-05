package com.omg.dao;

import java.util.*;

import com.omg.dto.*;

public interface TeamDAO {
	List<Teams> loginManager();
	List<Teams> selectTeam();
	
	List<Teams> p_teamConSelect(String deptid);
	int p_teamConInsert(Teams team);
	int p_teamConUpdate(Teams team);
	Teams p_NameById(String teamId);
}
