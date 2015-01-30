package com.omg.dao;

import java.util.*;

import com.omg.dto.*;

public interface TeamDAO {
	List<Teams> loginManager();
	List<Teams> selectTeam();
	
	List<Teams> p_teamConSelect();
}
