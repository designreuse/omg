package com.omg.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.omg.dao.*;
import com.omg.dto.*;

@Service
public class RunService {
	@Autowired
	private ProjectDAO proDAO;
	
	@Autowired
	private TechDAO techDAO;
	
	// 경영의 프로젝트 리스트 가져옴 끝나지 않는것
	public List<Projects> runSelectPro(int page) {
		List<Projects> list = proDAO.runSelectPro(page);
		return list;
	}
	
	// 총 프로젝트 갯수 구하기
	public int runSelectProTotle() {
		int ret = proDAO.runSelectProTotle();
		return ret;
	}
	
	// 프로젝트 승인부분(수정하는 것)
	public int runProInApp(String proId, String app, String appName){
		int ret = proDAO.runProInApp(proId, app, appName);
		if(ret >= 1){
			proDAO.clearProEmp(proId);
		}
		return ret;
	}
	
	// 회사 전체의 기술 목록 보여주기
	public List<Techs> selectTechs(){
		List<Techs> list = techDAO.selectTechs();
		return list;
	}
	
	public int jem( String techName) {
		return techDAO.jem( techName);
	}
}