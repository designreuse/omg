package com.omg.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.omg.dto.DProcess;
@Repository
public class DProDAOImpl implements DProDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<DProcess> listColleague(String employeeId) {
		return sqlSession.selectList("com.omg.dpro.listColleague", employeeId);
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<DProcess> listProjects(String employeeId) {
		System.out.println(employeeId);
		return sqlSession.selectList("com.omg.dpro.listProjects", employeeId);
	}

	@Override
	public DProcess dPro(String employeeId) {
		
		return sqlSession.selectOne("com.omg.dpro.dpro", employeeId);
	}

	@Override
	public List<DProcess> startProjects(String employeeId) {
		return sqlSession.selectList("com.omg.dpro.startProjects", employeeId);
	}
	
	@Override
	public List<DProcess> SCVList() {
		return sqlSession.selectList("com.omg.dpro.SCV");
		
	}

	@Override
	public List<DProcess> teams() {
		
		return sqlSession.selectList("com.omg.dpro.team");
	}

	@Override
	public int setTeam(Map map) {
		
		return sqlSession.update("com.omg.dpro.setTeam", map);
	}

}
