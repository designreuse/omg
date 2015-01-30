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
	public List<Teams> p_teamConSelect() {
		List<Teams> list = sqlSession.selectList("com.omg.team.p_teamConSelect");
		return list;
	}

}
