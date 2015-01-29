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
	public List<MProcess> colist(String teamId) {
		List<MProcess> list =session.selectList("com.omg.mpro.colist",teamId);
		return list;
	}

	@Override
	public List<MProcess> exlist(String employeeId) {
		List<MProcess> list =session.selectList("com.omg.mpro.exlist",employeeId);
		return list;
	}

	@Override
	public List<MProcess> sparelist(String teamId) {
		List<MProcess> list = session.selectList("com.omg.mpro.sparelist",teamId);
		return list;
	}

	
	
	
}