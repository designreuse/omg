package com.omg.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.omg.dao.*;
import com.omg.dto.*;

@Service
public class EmpinfoService {
	@Autowired
	private EmployeeDAO empDAO;
	
	@Autowired
	private PositionDAO posDAO;
	
	@Autowired
	private TeamDAO teamDAO;
	/// 수정
	public List<Employees> empList(int page, String dept){
		List<Employees> list = empDAO.empList(page, dept);
		return list;
	}
	
	public int empListTotal(String dept) {
		int totalconut = empDAO.empListTotal(dept);
		return totalconut;
	}
	/////////////////////////////
	public List<Employees> selectEmpinfo(String dept) {
		List<Employees> list = empDAO.selectEmpinfo(dept);
		return list;
	}
	
	
	public Employees selectlist(String empId) {
		Employees emp = empDAO.selectlist(empId);
		return emp;
	}
	
	
	public int updateinfo(Employees emp) {
		int update = empDAO.updateinfo(emp);
		return update;
	}
	
	
	public List<Employees> selectByName(List<Employees> emps){
		List<Position> pos = posDAO.selectposition();
		List<Teams> teams = teamDAO.selectTeam();
		List<Employees> list = new ArrayList<Employees>();
 		for(Employees e : emps){
			for(Position p : pos){
				if((e.getPositionId()).equalsIgnoreCase(p.getPositionId())){
					e.setPosName(p.getPositionName());
				}
			}
			if(e.getTeamId() != null){
				for(Teams t : teams){
					if((e.getTeamId()).equalsIgnoreCase(t.getTeamId())){
						e.setTeamName(t.getTeamName());
					}
				}
			}else{
				e.setTeamName("☆관리자☆");
			}
			list.add(e);
		}
		return list;
	}
}
