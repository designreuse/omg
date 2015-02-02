package com.omg.dao;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.omg.dto.*;

@Repository
public class ProjectDAOImpl implements ProjectDAO {
	@Autowired
	private SqlSession sqlSession;
	
	// sal 프로젝트 등록 부분
	@Override
	public int salProjectInsert(Projects pro) {
		int ret = sqlSession.insert("com.omg.projects.proInsert", pro);
		return ret;
	}	
	
	@Override
	public int salProjectUpdate(Projects pro) {
		int ret = sqlSession.update("com.omg.projects.proUpdate", pro);
		return ret;
	}
	
	@Override
	public int deletePro(String[] proids) {
		int ret = sqlSession.delete("com.omg.projects.proDelete", proids);
		return ret;
	}
	
	@Override
	public List<Projects> selectProject(int page, int date) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		int startPage = (page-1) * 15 + 1;
		int endPage = startPage + (15 - 1);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		if(date == 1){
			map.put("apping", 1);
		}else if(date == 2){
			map.put("appnot", 1);
		}else if(date == 3){
			map.put("append", 1);
		}
		List<Projects> list = sqlSession.selectList("com.omg.projects.salProjects", map);
		return list;
	}
	
	@Override
	public int salProjectTotle(int date) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		if(date == 1){
			map.put("apping", 1);
		}else if(date == 2){
			map.put("appnot", 1);
		}else if(date == 3){
			map.put("append", 1);
		}
		int totalCount = sqlSession.selectOne("com.omg.projects.salProjectTotle", map);
		return totalCount;
	}

	@Override
	public Projects salProjectByProId(String proId) {
		Projects pro = sqlSession.selectOne("com.omg.projects.salProjectByProId", proId);
		return pro;
	}
	
	@Override
	public List<String> salSelectTechs(String proId) {
		List<String> techlist = sqlSession.selectList("com.omg.projects.proContTech", proId);
		return techlist;
	}

	@Override
	public int salProTechInsert(String proId, String TechId) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("proId", proId);
		map.put("techId", TechId);
		int ret = sqlSession.insert("com.omg.projects.proContTechIn", map);
		return ret;
	}

	@Override
	public int salProTechByDelete(String proId, String TechId) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("proId", proId);
		map.put("techId", TechId);
		int ret = sqlSession.delete("com.omg.projects.proContTechByDel", map);
		return ret;
	}

	@Override
	public int salProTechDelete(String proId) {
		int ret = sqlSession.delete("com.omg.projects.proContTechAllDel", proId);
		return ret;
	}
	
	// 인사&회계 회사 매출 조회
	@Override
	public long sumProPrice(String year) {
		long price = 0;
		try{
			price = sqlSession.selectOne("com.omg.projects.sumProPrice",year);
		}catch(NullPointerException e){
			
		}
		return price;
	}

	@Override
	public long sumBydeptProPrice(Map map) {
		 long price =0;
		 try{
			 price = sqlSession.selectOne("com.omg.projects.sumBydeptProPrice",map);
		 }catch(NullPointerException e){
			 
		 }
			return price;
	}

	// 경영부
	// 프로젝트 리스트 (경영부에서 확인해야 될)
	@Override
	public List<Projects> runSelectPro(int page) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		int startPage = (page-1) * 10 + 1;
		int endPage = startPage + (10 - 1);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		List<Projects> list = sqlSession.selectList("com.omg.projects.runProjects", map);
		return list;
	}

	// 프로젝트 총 갯수 (경영부에서 확인해야될)
	@Override
	public int runSelectProTotle() {
		Map<String, Integer> map = new HashMap<String, Integer>();
		int totalCount = sqlSession.selectOne("com.omg.projects.runProjectTotle", map);
		return totalCount;
	}

	@Override
	public int runProInApp(String proId, String app, String appName) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("projectId", proId);
		map.put("approval", app);
		map.put("approvalName", appName);
		int ret = sqlSession.update("com.omg.projects.runProInApp", map);
		return ret;
	}
}