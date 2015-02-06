package com.omg.dao;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.omg.dto.*;

@Repository
public class TechDAOImpl implements TechDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Techs> selectTechs() {
		List<Techs> list = sqlSession.selectList("com.omg.techs.selectTechs");
		return list;
	}

	@Override
	public String techIdByName(String techName) {
		String techId = sqlSession.selectOne("com.omg.techs.techIdByName", techName);
		return techId;
	}

	@Override
	public int jem(String techId, String techName) {
		
		Map<String, String> map =new HashMap<String, String>();
		
		map.put("techId", techId);
		map.put("techName", techName);
		
		return sqlSession.insert("com.omg.techs.jem",map);
		
	}
}
