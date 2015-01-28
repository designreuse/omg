package com.omg.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.omg.dao.*;
import com.omg.dto.*;

@Service
public class SalaryService {
	@Autowired
	private DepartmentDAO deptDAO;
	
	@Autowired
	private TechDAO techDAO;
	
	@Autowired
	private ProjectDAO projectDAO;
	
	
	// 기술 조회 하기
	public List<Techs> selectTechs(){
		List<Techs> list = techDAO.selectTechs();
		return list;
	}
	// 프로잭트 전체 조회
	public List<Projects> selectProject(int page, int date) {
		List<Projects> list = projectDAO.selectProject(page, date);
		return list;
	}
	
	// 프로젝트 전체 count 조회하기
	public int salProjectTotle(int date) {
		int ret = projectDAO.salProjectTotle(date);
		return ret;
	}
	
	// 프로젝트 업데이트
	public int salProjectUpdate(Projects pro) {
		String deptId = deptDAO.DeptIdByDeptName(pro.getDeptName());
		pro.setDepartmentId(deptId);
		int ret = projectDAO.salProjectUpdate(pro);
		System.out.println(ret);
		//return ret;
		return 0;
	}
	
	// detail 자세히 보기
	public Projects salProjectByProId(String proId) {
		Projects pro = projectDAO.salProjectByProId(proId);
		if(pro.getTeamName() == null){
			pro.setTeamName("배정중");
		}
		if(pro.getDeptName() == null){
			pro.setDeptName("미정");
		}
		if(pro.getApproval() == null){
			pro.setApproval("검토중...");
			pro.setApprovalName("확인중");
		}
		return pro;
	}
}
