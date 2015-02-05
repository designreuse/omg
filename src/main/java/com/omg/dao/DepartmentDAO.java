package com.omg.dao;

import java.util.*;

import com.omg.dto.*;

public interface DepartmentDAO {
	List<Departments> loginMeneger();
	List<Departments> selectDeptName(String deptName);
	String DeptIdByDeptName(String deptName);
	
	List<Departments> p_deptConSelect();
	int p_deptConInsert(Departments dept);
	int p_deptConUpdate(Departments dept);
	Departments p_deptNameById(String id);
}
