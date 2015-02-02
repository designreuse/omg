package com.omg.dao;

import java.util.*;

import com.omg.dto.*;

public interface EmployeeDAO {
	List<Employees> empList(int page, String dept);
	int empListTotal(String dept);
	
	List<Employees> selectEmp();
	List<Employees> selectEmpinfo(String dept);
	Employees selectPass(Employees emp);
	Employees password(String empId, String name, String email);
	Employees selectlist(String empId);
	int updateinfo(Employees emp);
	
	List<Employees> p_selectEmp(String dept,int page);
	Employees p_Emp(String id);
	int p_updateEmp(Employees emp);
	int p_deleteEmp(String empId);
	int p_insertEmp(Employees emp);
	
	//직원등록 안에서 사용될 부분 (select)
	List<Departments> p_deptSelect();
	List<Teams> p_teamSelect();
	List<Position> p_posSelect();
	Position p_salarySelect(String posid);
	Employees p_empSelect(String empid);
	
	int p_teamConEmpUpdate(Employees emp);
}