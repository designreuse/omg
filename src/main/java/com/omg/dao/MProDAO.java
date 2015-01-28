package com.omg.dao;

import java.util.*;

import com.omg.dto.*;

public interface MProDAO {
	List<MProcess> relist(String employeeId);
	List<MProcess> colist(String employeeId);
	List<MProcess> exlist(String employeeId);
	
}
