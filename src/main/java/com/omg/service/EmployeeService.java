package com.omg.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.omg.dao.*;
import com.omg.dto.*;

@Service
public class EmployeeService {
	@Autowired
	private EmployeeDAO empdao;
	
	public List<Employees> selectEmpName(){
		List<Employees> list= empdao.selectEmp();
		return list;
	}
	public List<Employees> p_selectEmp(String dept) {
		List<Employees> list = empdao.p_selectEmp(dept);
		return list;
	}
	public Employees p_Emp(String id){
		Employees emp = empdao.p_Emp(id);
		return emp;
	}
	public int p_updateEmp(Employees emp){
		int result = empdao.p_updateEmp(emp);
		return result;
	}
	public int p_deleteEmp(String empId) {
		int result = empdao.p_deleteEmp(empId);
		return result;
	}
	public int p_insertEmp(Employees emp) {
		int result = empdao.p_insertEmp(emp);
		return result;
	}
	public List<Departments> p_deptSelect() {
		List<Departments> list = empdao.p_deptSelect();
		return list;
	}
	public List<Teams> p_teamSelect() {
		List<Teams> list = empdao.p_teamSelect();
		return list;
	}
	public List<Position> p_posSelect() {
		List<Position> list = empdao.p_posSelect();
		return list;
	}
	public Position p_salarySelect(String posid) {
		Position pos = empdao.p_salarySelect(posid);
		return pos;
	}
	
}
