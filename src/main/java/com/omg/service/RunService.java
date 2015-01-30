package com.omg.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.omg.dao.*;
import com.omg.dto.*;

@Service
public class RunService {
	@Autowired
	private ProjectDAO proDAO;
	
	public List<Projects> runSelectPro(int page) {
		List<Projects> list = proDAO.runSelectPro(page);
		return list;
	}
	
	public int runSelectProTotle() {
		int ret = proDAO.runSelectProTotle();
		return ret;
	}
	
}