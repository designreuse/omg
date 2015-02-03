package com.omg.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.omg.dto.DProcess;
import com.omg.dto.MProcess;

@Repository
public class DProDAOImpl implements DProDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<DProcess> listColleague(String employeeId) {
		return sqlSession.selectList("com.omg.dpro.listColleague", employeeId);
	}

	@Override
	public List<DProcess> listProjects(String employeeId) {
		
		return sqlSession.selectList("com.omg.dpro.listProjects", employeeId);
	}

	@Override
	public DProcess dPro(String employeeId) {

		return sqlSession.selectOne("com.omg.dpro.dpro", employeeId);
	}
	//부장
	@Override
	public List<DProcess> startProjects(String employeeId) {
		return sqlSession.selectList("com.omg.dpro.startProjects", employeeId);
	}

	@Override
	public List<DProcess> teams() {

		return sqlSession.selectList("com.omg.dpro.team");
	}

	@Override
	public int setTeam(Map map) {

		return sqlSession.update("com.omg.dpro.setTeam", map);
	}

	@Override
	public List<DProcess> proing() {
		return sqlSession.selectList("com.omg.dpro.proing");

	}

	@Override
	public List<DProcess> sparelist(String teamId, String projectId) {

		Map<String, String> map = new HashMap<String, String>();
		map.put("teamId", teamId);
		map.put("projectId", projectId);

		List<DProcess> list = sqlSession.selectList("com.omg.dpro.spareList", map);

		return list;
	}

	@Override
	public List<DProcess> putlist(String projectId) {
		System.out.println(projectId);
		List<DProcess> list =sqlSession.selectList("com.omg.dpro.putList", projectId);

		return list;
	}
	//팀장
	@Override
	public List<DProcess> startpro(String teamId) {
		if(teamId == null){
			teamId ="";
		}
		List<DProcess> list =sqlSession.selectList("com.omg.dpro.startpro", teamId);

		return list;
	}

	@Override
	public int setpeople(String proId, String empId) {
		Map<String,String> map = new HashMap<String, String>();
		
		map.put("proId", proId);
		map.put("empId", empId);

		int set=sqlSession.insert("com.omg.dpro.setpeople",map);

		return set;
	}


	@Override
	public int delete(String proId, String empId) {
		Map<String,String> map = new HashMap<String, String>();
		
		map.put("proId", proId);
		map.put("empId", empId);
		
		int delete = sqlSession.delete("com.omg.dpro.delete", map);
		return delete;
	}

	@Override
	public List<DProcess> viewlist(String proId) {

		List<DProcess> list = sqlSession.selectList("com.omg.dpro.view", proId);
		return list;
	}

}
