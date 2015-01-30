package com.omg.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.omg.dao.*;
import com.omg.dto.*;

@Service
public class LoginService  {
	@Autowired
	private EmployeeDAO empdao;
	@Autowired
	private DepartmentDAO deptdao;
	@Autowired
	private TeamDAO teamdao;

	public Employees selectPass(Employees inputEmp) {
		Employees emp = empdao.selectPass(inputEmp);
		return emp;
	}

	public Employees selectPass(String empId, String name, String email) {
		return empdao.password(empId, name, email);
	}
	
	
	
	
	public int selectManager(Employees emp){
		List<Departments> depts = deptdao.loginMeneger();
		List<Teams> teams = teamdao.loginManager();
		for(Departments dept :depts){							// 부장일경우 
			if(emp.getEmployeeId().equalsIgnoreCase(dept.getDepartmentManager())){
				return 2;
			}
		}
		for(Teams team :teams){									// 팀장일경우
			if(emp.getEmployeeId().equalsIgnoreCase(team.getTeamManager())){
				return 3;
			}
			if(emp.getTeamId().equalsIgnoreCase("R01")){		// 경영팀에 속해있는경우
				return 1;
			}
		}
		return 0;
	}
	
	public Teams teamManagerCk(String userid){
		List<Teams> teams = teamdao.loginManager();
		for(Teams t : teams){
			if(userid.equalsIgnoreCase(t.getTeamManager())){
				return t;
			}
		}
		return null;
	}
}