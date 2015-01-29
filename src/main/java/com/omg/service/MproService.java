package com.omg.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.omg.dao.*;
import com.omg.dto.*;
@Service
public class MproService {

	@Autowired
	private MProDAO dao;
	
	
	
	public List<MProcess> relist(String employeeId) {
		List<MProcess> list =dao.relist(employeeId);
		return list;
	}
	
	public List<MProcess> colist(String teamId) {
		List<MProcess> list = dao.colist(teamId);
		return list;
	}
	
	public List<MProcess> exlist(String employeeId) {
		List<MProcess> list = dao.exlist(employeeId);
		return list;
		
	}
	public List<MProcess> sparelist(String teamId) {
		List<MProcess> list = dao.sparelist(teamId);
		return list;
	}
	
}
