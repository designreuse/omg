package com.omg.dao;

import java.util.*;

import com.omg.dto.*;

public interface EmployeeDAO {
	List<Employees> selectEmp();
	List<Employees> selectEmpinfo(String dept);
	Employees selectPass(Employees emp);
	Employees password(String empId, String name, String email);
	Employees selectlist(String empId);
	int updateinfo(Employees emp);
	
	List<Employees> p_selectEmp(String dept);
	Employees p_Emp(String id);
	int p_updateEmp(Employees emp);
	int p_deleteEmp(String empId);
	int p_insertEmp(Employees emp);
	
	//직원등록 안에서 사용될 부분 (select)
	List<Departments> p_deptSelect();
	List<Teams> p_teamSelect();
	List<Position> p_posSelect();
}