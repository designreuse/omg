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
	
	// 프로젝트 수정
	public int salProjectUpdate(Projects pro) {
		int ret = projectDAO.salProjectUpdate(pro);
		return ret;
	}
	
	// project 입력하기 -> 팀장
	public int salProjectInsert(Projects pro) {
		int ret = projectDAO.salProjectInsert(pro);
		return ret;
	}
	
	// 선택된것 들 삭제 하기 -> 팀장의 권한
	public int deletePro(String[] proids) {
		int protechdel = -1;
		int ret = 0;
		for(String s : proids){
			protechdel += projectDAO.salProTechDelete(s);
		}
		if(protechdel != -1){
			ret = projectDAO.deletePro(proids);
		}
		return ret;
	}
	
	// 기술 등록 누르면 관련기술 가져가기
	public List<String> salSelectTechs(String proId) {
		List<String> techlist = projectDAO.salSelectTechs(proId);
		return techlist;
	}
	
	// 해당 프로젝트에 기술 등록하기
	public int salProTechInsert(String proId, String techName) {
		String techId = techDAO.techIdByName(techName);
		int ret = projectDAO.salProTechInsert(proId, techId);
		return ret;
	}
	
	// 헤당 프로젝트 기술 삭제 하기
	public int salProTechByDelete(String proId, String techName) {
		String techId = techDAO.techIdByName(techName);
		int ret = projectDAO.salProTechByDelete(proId, techId);
		return ret;
	}
	
	// 해당 프로젝트 기술 모두 삭제하기
	public int salProTechDelete(String proId) {
		int ret = projectDAO.salProTechDelete(proId);
		return ret;
	}
}
