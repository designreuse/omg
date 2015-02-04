package com.omg.dao;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.omg.dto.*;
@Repository
public class MProDAOImpl implements MProDAO {

	@Autowired
	private SqlSession session;
	
	
	@Override
	public List<MProcess> relist(String employeeId) {
			List<MProcess> list =session.selectList("com.omg.mpro.relist",employeeId);
		return list;
	}

	@Override
	public List<MProcess> colist(String employeeId) {
		List<MProcess> list =session.selectList("com.omg.mpro.colist",employeeId);
		return list;
	}

	@Override
	public List<MProcess> exlist(String employeeId) {
		List<MProcess> list =session.selectList("com.omg.mpro.exlist",employeeId);
		return list;
	}

	@Override
	public List<MProcess> sparelist(String teamId,String projectId) {
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("teamId", teamId);
		map.put("projectId", projectId);

		List<MProcess> list = session.selectList("com.omg.mpro.sparelist",map);

		return list;
	}

	@Override
	public List<MProcess> putlist(String projectId) {

		List<MProcess> list =session.selectList("com.omg.mpro.putlist",projectId);

		return list;
	}

	@Override
	public List<MProcess> startpro(String teamId) {
		if(teamId == null){
			teamId = "";
		}
		List<MProcess> list =session.selectList("com.omg.mpro.startpro",teamId);
		return list;
	}

	@Override
	public int setpeople(String proId, String empId) {
		Map<String,String> map = new HashMap<String, String>();
		
		map.put("proId", proId);
		map.put("empId", empId);

		int set=session.insert("com.omg.mpro.setpeople",map);

		return set;
	}

	@Override
	public int delete(String proId, String empId) {
		Map<String,String> map = new HashMap<String, String>();
		
		map.put("proId", proId);
		map.put("empId", empId);
		
		int delete = session.delete("com.omg.mpro.delete",map);
		return delete;
	}

	@Override
	public List<MProcess> viewlist(String proId) {

		List<MProcess> list = session.selectList("com.omg.mpro.view",proId);
		return list;
	}

	@Override
	public List<MProcess> proing() {
		List<MProcess> list = session.selectList("com.omg.mpro.proing");
		return list;
	}

	@Override
	public List<MProcess> teams() {
		List<MProcess> list=session.selectList("com.omg.mpro.team");
		return list;
	}



	@Override
	public List<MProcess> startProjects(String employeeId) {
		List<MProcess> list = session.selectList("com.omg.mpro.startProjects",employeeId);
		return list;
	}

	@Override
	public int setTeam(String projectId, String teamId) {
	
		Map<String, String> map = new HashMap<String,String>();
		map.put("projectId",projectId);
		map.put("teamId", teamId);
		
		int setteam = session.update("com.omg.mpro.setTeam",map);
		
		return setteam;
	}


	
	
}