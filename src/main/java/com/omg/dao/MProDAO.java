package com.omg.dao;

import java.util.*;

import com.omg.dto.*;

public interface MProDAO {
	List<MProcess> relist(String employeeId);
	List<MProcess> colist(String teamId);
	List<MProcess> exlist(String employeeId);
	List<MProcess> sparelist(String teamId);
	
}
