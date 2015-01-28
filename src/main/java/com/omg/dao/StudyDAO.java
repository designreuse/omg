package com.omg.dao;

import java.util.List;
import java.util.Map;

import com.omg.dto.Employees;
import com.omg.dto.Studys;

public interface StudyDAO {

	List<Studys> Study_Select();
	List<Studys> Study_Select(int page);
	int Study_Register(Studys dto);
	int Study_Delete(Map map);
	int Study_Join(Studys study);
	List<Studys> JoinStudy_Select(String id);
	int Study_Cancel(Map map);
	List<Studys>  Study_Emp(int num);
	int Study_Update(Studys study);
	int Study_Delete_Mem(int num);
	
	Studys studyByNum(int num);
	int Update_Join_Cnt(int num);
	int Minus_Join_Cnt(int num);
	
	Studys infoStudy(Map dto);
	Integer totalCount();
	
	List<String> selectTech();	
	 
	
}
