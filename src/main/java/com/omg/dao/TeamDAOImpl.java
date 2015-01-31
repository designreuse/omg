package com.omg.dao;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.omg.dto.*;

@Repository
public class TeamDAOImpl implements TeamDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Teams> loginManager() {
		List<Teams> list =sqlSession.selectList("com.omg.team.selectTeam");	
		return list;
	}

	@Override
	public List<Teams> selectTeam() {
		List<Teams> list = sqlSession.selectList("com.omg.team.selectTeam");
		return list;
	}

	@Override
	public List<Teams> p_teamConSelect(String deptid) {
		List<Teams> list = sqlSession.selectList("com.omg.team.p_teamConSelect",deptid);
		return list;
	}

	@Override
	public int p_teamConInsert(Teams team) {
		int result = sqlSession.insert("com.omg.team.p_teamConInsert",team);
		return result;
	}

	@Override
	public int p_teamConUpdate(Teams team) {
		int result = sqlSession.update("com.omg.team.p_teamConUpdate",team);
		return result;
	}

}
