package com.omg.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omg.dao.EmployeeDAO;
import com.omg.dao.StudyDAO;
import com.omg.dto.Employees;
import com.omg.dto.Studys;

@Service
public class StudyService {

	@Autowired
	private StudyDAO dao; 
	
	public List<Studys>Study_Select(int page){
		List<Studys> list = dao.Study_Select(page);
		return list;
	}
	public List<Studys>Study_Select( ){
		List<Studys> list = dao.Study_Select( );
		return list;
	}
	
	public int Study_Register(Studys dto) {
		int result = dao.Study_Register(dto);
		return result;
	}

	public int Study_Delete(Map map) {
		int result = dao.Study_Delete(map);
		return result;
	}

	public int Study_Join(Studys study) {
		int result = dao.Study_Join(study);		
		return result;
	}
	
	public List<Studys> JoinStudy_Select(String id){
		List<Studys> list = dao.JoinStudy_Select(id);
		return list;		
	}

	
	public int Study_Cancel(Map map) {
		int result = dao.Study_Cancel(map);
		return result;
	}

	public List<Studys>  Study_Emp(int num) {
		List<Studys> list = dao.Study_Emp(num);
		return list;
	}
	
	public Studys studyByNum(int num) {
		Studys study = dao.studyByNum(num);
		return study;
	}
	
	public int Study_Update(Studys study) {
		int result = dao.Study_Update(study);
		return result;
	}
	
	public int Study_Delete_Mem(int num) {
		int result = dao.Study_Delete_Mem(num);
		return result;
	}

	public int Update_Join_Cnt(int num){
		int result = dao.Update_Join_Cnt(num);
		return result;
	}
	
	public int Minus_Join_Cnt(int num) {
		int result = dao.Minus_Join_Cnt(num);
		return result;
		
	}
	
	public Studys infoStudy(Map dto) {
		Studys study = dao.infoStudy(dto);
		return study;
	}
	
	public Integer totalCount(){
		Integer totalCount = dao.totalCount();
		return totalCount;
	}
	
	public List<String> selectTech(){
		 
		List<String> list = dao.selectTech();
		return list;
	}
}
