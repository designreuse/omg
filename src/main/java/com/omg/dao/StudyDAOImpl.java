package com.omg.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.omg.dto.Studys;
@Repository
public class StudyDAOImpl implements StudyDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	//스터디 목록 들어왔을때 실행되는 부분. < 스터디 목록 조회 >
	@Override
	public List<Studys> Study_Select(int page) {
		Map pageInfo = new HashMap();
		int startPage = (page-1) * 10 + 1;
		int endPage = startPage + (10 - 1);
		pageInfo.put("startPage", startPage);
		pageInfo.put("endPage", endPage);
		
		List<Studys> list = sqlSession.selectList("com.omg.study.listStudy",pageInfo);
		return list;
	}

	@Override
	public List<Studys> Study_Select() { 
		List<Studys> list = sqlSession.selectList("com.omg.study.listStudy2" );
		return list;
	}
	//스터디 새로 만들때 실행되는 부분. < new 스터디 등록 >
	@Override
	public int Study_Register(Studys dto) {
		int result = sqlSession.insert("com.omg.study.insertStudy",dto);
		return result;
	}

	//내가 개설한 스터디 삭제할때 실행되는 부분. < 스터디 삭제 >
	@Override
	public int Study_Delete(Map map) {
		int result = sqlSession.delete("com.omg.study.deleteStudy",map);
		return result;
	}

	//스터디 신청할때 실행되는 부분. < 스터디 신청 >
	@Override
	public int Study_Join(Studys study) {
		int result = sqlSession.insert("com.omg.study.joinStudy",study);
		return result;
	}

	//스터디 신청할때 신청자 수 증가하는 부분. < 스터디 신청 인원 증가 >
	@Override
	public int Update_Join_Cnt(int num){
		int result = sqlSession.update("com.omg.study.updateJoinCnt",num);
		return result;	
	}
	//신청한 스터디 취소할때 실행되는 부분. < 스터디 신청 취소 >
	@Override
	public int Study_Cancel(Map map) {
		int result = sqlSession.delete("com.omg.study.cancelStudy",map);
		return result;
	}

	//내가 신청한 스터디 목록 조회할때 실행되는 부분. < 신청한 스터디 목록 조회 >
	@Override
	public List<Studys> JoinStudy_Select(String id) {
		List<Studys> list = sqlSession.selectList("com.omg.study.myStudy",id);
		return list;
	}

	//스터디 신청한 직원조회할때 실행되는 부분. < 스터디 신청한 직원 조회 >
	@Override
	public List<Studys>  Study_Emp(int num) {
		List<Studys>  list = sqlSession.selectList("com.omg.study.studentList",num);
		return list; 
	}

	//스터디 번호로 스터디 정보 조회
	@Override
	public Studys studyByNum(int num) {
		Studys study = sqlSession.selectOne("com.omg.study.studyByNum",num);
		return study;
	}
	
	//스터디 제한인원/요일 수정할때 실행되는 부분. < 스터디 내용 수정 >
	@Override
	public int Study_Update(Studys study) {
		 int result = sqlSession.update("com.omg.study.studyUpdate",study);
		 return result;
	}

	//스터디 삭제전 참여하고있는 직원들 삭제할때 실행되는 부분. < 스터디 멤버 삭제 >
	@Override
	public int Study_Delete_Mem(int num) {
		int result = sqlSession.delete("com.omg.study.deleteStudyMem",num);
		return result;
	}

	//스터디 취소하면 신청자 수 감소할때 실행되는 부분 < 스터디 신청자 감소 >
	@Override
	public int Minus_Join_Cnt(int num) {
		int result = sqlSession.update("com.omg.study.minusJoinCnt",num);
		return result;
	}

	//스터디 확인
	@Override
	public Studys infoStudy(Map dto) {
		Studys study = sqlSession.selectOne("com.omg.study.infostudy",dto);
		return study;
	}

	//스터디 개수 확인
	@Override
	public Integer totalCount() {
		Integer totalCount = sqlSession.selectOne("com.omg.study.totalStudy");
		return totalCount;
	}

	//기술조회
	@Override
	public List<String> selectTech() {	
		List<String> list = sqlSession.selectList("com.omg.study.selectTech");
		return list;
	}
	
	
 
}
