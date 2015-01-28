package com.omg.dao;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.omg.dto.*;

@Repository
public class PositionDAOImpl implements PositionDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Position> selectposition() {
		List<Position> list =sqlSession.selectList("com.omg.position.selectAll");
		return list;
	}
	
}