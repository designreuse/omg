package com.omg.company;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.spi.DirStateFactory.Result;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.omg.dto.Employees;
import com.omg.dto.Studys;
import com.omg.service.StudyService;

@Controller
@RequestMapping("/studys") 
public class StudyController {
	@Autowired
	private StudyService studyService;
	

	//study 페이지에서 new 버튼 누르면 동작해서 페이지 넘어가는 부분
	@RequestMapping("/studySupply")
	public String studySupply(HttpSession session,Model model){
		List<String> list = studyService.selectTech();
		model.addAttribute("techs",list); 
		return "pages/studys/studySupply";
	}
	
	//스터디 개설해서 추가하는 부분. (studysupply에서 post방식으로 넘어오는곳)
	@RequestMapping(value="/study",method=RequestMethod.POST)
	public String studyInsert(
			HttpSession session, 
			@RequestParam("study_name") String studyName,
			@RequestParam("writer") String writer,
			@RequestParam("member_cnt") int memberCnt, 
			@RequestParam("studyday") String studyday,
			@RequestParam("startDate")Date startDate, 
			@RequestParam("techname")String techName,
			Model model){
		 
		List<Studys> std = studyService.Study_Select();
		Studys dto = new Studys(); 
		dto.setStudyName(studyName);
		dto.setStudyday(studyday);
		dto.setMemberCnt(memberCnt);
		dto.setWriter(writer);
		dto.setStartDate(startDate);
		dto.setTechName(techName);
		std.add(dto); 
		int result = studyService.Study_Register(dto);
		
		return "redirect:index";
	}
	
	//스터디 전체 목록 출력하는 부분.(select)
	@RequestMapping("/index")
	public String study(HttpSession session ){
		Employees emp = (Employees)session.getAttribute("user");
		if(emp == null){
			return "redirect:../login";
		}
		return "pages/studys/study";
	}
	
	@RequestMapping("/studylist")
	public @ResponseBody List<Studys> studyList(HttpSession session, Model model, @RequestParam("page") int page){
		List<Studys> list = studyService.Study_Select(page);
		return list;
	}
	
	@RequestMapping("/supplylist")
	public @ResponseBody List<Studys> supplyList(HttpSession session){
		Employees log = (Employees)session.getAttribute("user");
		String ID = log.getEmployeeId();
		List<Studys> list = studyService.JoinStudy_Select(ID);
		return list;
	}
	
	@RequestMapping("/supplylistNum")
	public @ResponseBody List<Integer> supplyListnum(HttpSession session){
		Employees log = (Employees)session.getAttribute("user");
		String ID = log.getEmployeeId();
		List<Studys> list = studyService.JoinStudy_Select(ID);
		List<Integer> number = new ArrayList<Integer>();
		for(Studys s : list){
			number.add(s.getStudyNum());
		}
		return number;
	}
	
	//스터디 담당자가 삭제하기.
	@RequestMapping("/del")
	public String studyDelete(
			HttpSession session,
			@RequestParam("writer")String writer1,
			@RequestParam("studyN")String studyCnt 
			){
		Employees log  =(Employees)session.getAttribute("user");
		String empId = log.getEmployeeId();
	
		int result;
		int result1;
		 
		
		if(writer1.equals(empId)){
			//study_supply에 참여하고 있는 인원들 먼저 삭제
			result1 = studyService.Study_Delete_Mem(Integer.parseInt(studyCnt));
			//Studys 테이블에서 study 삭제
			Map<String,String> map = new HashMap<String,String>();
			map.put("writer", empId);
			map.put("studyNum", studyCnt);
			
			result = studyService.Study_Delete(map);
		 
		}
		else{
			 
		}			
		return "redirect:index";
	}


	//일반 직원들이 스터디 신청하기
	@RequestMapping("/join")
	public @ResponseBody String studyJoin(
			HttpSession session,
			@RequestParam("studynum")String studyN 
			){
		//로그인한 사람 사번
		Employees log =(Employees)session.getAttribute("user");
		String ID = log.getEmployeeId();
		 
		//신청한 스터디 번호-> 그 스터디장 사번
		Studys study1 = studyService.studyByNum(Integer.parseInt(studyN)); //studyN해당 스터디 모든 정보 조회 
		String leader = study1.getWriter();				//leader = 스터디장 사번
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("employeeId", ID);
		map.put("studyNum", studyN);
		
		int num;
		int check=0;
		int result =0;
		String txt = "";

	
		Studys temp = studyService.infoStudy(map);
		if(temp==null){
				if(study1.getJoincnt()<study1.getMemberCnt()){
					Studys study = new Studys();
					study.setUserId(ID);
					study.setStudyNum(Integer.parseInt(studyN));
					
					//신청 인원 증가
					studyService.Update_Join_Cnt(Integer.parseInt(studyN));
					//스터디 신청
					result = studyService.Study_Join(study);	
				}
		}
		if(result >= 1){
			txt = "성공";
		}else{
			txt = "실패";
		}
		return txt;
	}
	
	//내가 신청한 스터디 목록 보기. 
	@RequestMapping("/studyJoinlist")
	public String studyJoinlist(HttpSession session, Model model){
		Employees log =(Employees)session.getAttribute("user");
		String ID = log.getEmployeeId();
		 
		List<Studys> list = studyService.JoinStudy_Select(ID);
		 
		model.addAttribute("joinstudy",list);
		return "pages/studys/studyJoinlist";
	}
	
	//신청한 스터디 취소하기.
	@RequestMapping("/cancel")
	public String studyCancel(
			HttpSession session, 
			@RequestParam("studyN")String num){
		Employees log =(Employees)session.getAttribute("user");
		String ID = log.getEmployeeId();
		 
		Map<String,String> map = new HashMap<String,String>();
		map.put("employeeId", ID);
		map.put("studyNum", num);
	 
		int result1 = studyService.Minus_Join_Cnt(Integer.parseInt(num));
		int result = studyService.Study_Cancel(map);

		return "redirect:studyJoinlist";
	}
	
	//해당 스터디 신청한 직원 목록보기
	@RequestMapping("/stuList")
	public String studentList(
			HttpSession session,
			@RequestParam("Num2")int num,
			Model model){
		
		List<Studys> list = studyService.Study_Emp(num);
		model.addAttribute("studyemp",list);
		
		return "pages/studys/stuList";
	}
	
	//스터디 내용 수정페이지로 넘어가기
	@RequestMapping("/update")
	public String Update(
			HttpSession session,
			@RequestParam("num")int stNum,
			Model model){
		Employees log =(Employees)session.getAttribute("user");
		String id = log.getEmployeeId();
		 
		Studys study = studyService.studyByNum(stNum);
		String leader = study.getWriter();
		 
		if(id.equals(leader)){
			model.addAttribute("study1",study);
			return "pages/studys/studyUpdate";
		}
		else{
			return "redirect:index";
		}
	}
	
	//스터디 내용 수정하기
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String studyUpdate(
			HttpSession session,
			@RequestParam("member_cnt") int num,
			@RequestParam("studyday") String day,
			@RequestParam("study_num")int studyN){ 
		Studys study = new Studys();
		study.setStudyday(day);
		study.setMemberCnt(num);
		study.setStudyNum(studyN);
		 
		int result = studyService.Study_Update(study);
		
		return "redirect:index";
	}
	
	//스터디 개수
	@RequestMapping("/total")
	public @ResponseBody String msgTotle(HttpSession session){
		Integer totalCount = studyService.totalCount();
		return totalCount.toString();
	}
	
}
