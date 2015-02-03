package com.omg.company;

import java.sql.Date;
import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.omg.dto.*;
import com.omg.service.*;

@Controller
@RequestMapping("RUN")
public class RProComtroller {
	// 경영(경영,인사&회게, 영업) 관련된 컨틀롤러
	@Autowired
	private SalaryService salService;
	@Autowired
	private EmployeeService empService;
	@Autowired
	private RunService runService;
	@Autowired
	private EmpinfoService service;
	
	// 대현 -> 영업
	@RequestMapping("index_s")
	public String SalaryProindex(HttpSession session){
		return "pages/pro/s_process";
	}
	
	// 기술에 등록된 기술들 보여주기 (단. 아직 끝나지 안은 프로젝트에 관하여서)
	@RequestMapping("techlist")
	public @ResponseBody List<Techs> techList(HttpSession session){
		List<Techs> list =salService.selectTechs();
		return list;
	}
	
	// 프로젝트가 목록 보여 주기 (모두 지금 것 했던 모든것)
	@RequestMapping("salProlist")
	public @ResponseBody List<Projects> salProList(HttpSession session, 
		   @RequestParam("page") int page,
		   @RequestParam("date") int date){
		List<Projects> list = salService.selectProject(page,date);
		return list;
	}
	
	// 프로젝트가 총 몇개 있는지 (모두 지금것 진행한 모든것)
	@RequestMapping("/salPrototle")
	public @ResponseBody String salProTotle(HttpSession session,
			@RequestParam("date") int date){
		Integer total = salService.salProjectTotle(date);
		return total.toString();
	}
	
	// 프로젝트 자세히 보기
	@RequestMapping("/salProDetail")
	public String salProDetail(HttpSession session, @RequestParam("proNum") String proId, Model model){
		Projects pro = salService.salProjectByProId(proId);
		model.addAttribute("pro", pro);
		return "pages/pro/s_pro_det_up";
	}
	
	// 프로젝트 등록하기
	@RequestMapping(value="/insertpro", method=RequestMethod.POST)
	public String insertpro(HttpSession session, 
			@RequestParam("proid") String proId,
			@RequestParam("proname") String proName,
			@RequestParam("proprice") long price,
			@RequestParam("start") Date start,
			@RequestParam("end") Date end,
			@RequestParam("deptid") String deptId){
		Projects protemp = new Projects();
		protemp.setProjectId(proId);
		protemp.setProjectName(proName);
		protemp.setProjectPrice(price);
		protemp.setStartDate(start);
		protemp.setEndDate(end);
		protemp.setDepartmentId(deptId);
		salService.salProjectInsert(protemp);
		return "redirect:index_s";
	}
	
	// 프로젝트 수정하는 부분
	@RequestMapping(value="/salProUpdate", method=RequestMethod.POST)
	public String salProUpdate(HttpSession session, 
			@RequestParam("proId") String proId,
			@RequestParam("proname") String proName,
			@RequestParam("price") long price,
			@RequestParam("start") Date start,
			@RequestParam("end") Date end,
			@RequestParam("dept") String deptId,
			Model model){
		Projects protemp = new Projects();
		protemp.setProjectId(proId);
		protemp.setProjectName(proName);
		protemp.setProjectPrice(price);
		protemp.setStartDate(start);
		protemp.setEndDate(end);
		protemp.setDepartmentId(deptId);
		salService.salProjectUpdate(protemp);
		return "redirect:index_s";
	}
	
	// 프로젝트 삭제 하는 부분(1개 혹은 여러게)
	@RequestMapping("proDelete")
	public @ResponseBody String proDelete(HttpSession session, @RequestParam("proIds") String[] proids){
		Integer ret = salService.deletePro(proids);
		return ret.toString();
	}
	
	// 프로젝트에 등록된 기술목록 보여주기
	@RequestMapping("ProByTech")
	public @ResponseBody List<String> ProByTech(HttpSession session, @RequestParam("proid") String proId){
		List<String> techlist = salService.salSelectTechs(proId);
		return techlist;
	}
	
	// 프로젝트에 기술 입력
	@RequestMapping("protechIn")
	public @ResponseBody String protechIn(HttpSession session,
			@RequestParam("proid") String proId,
			@RequestParam("techname") String techName){
		Integer ret = salService.salProTechInsert(proId, techName);
		return ret.toString();
	}
	
	// 프로젝트에 등록된 기술중 하나만 선택 삭제
	@RequestMapping("protechByDel")
	public @ResponseBody String protechByDel(HttpSession session,
			@RequestParam("proid") String proId,
			@RequestParam("techname") String techName){
		Integer ret = salService.salProTechByDelete(proId, techName);
		return ret.toString();
	}
	
	// 프로젝트에 등록된 기술 모두삭제
	@RequestMapping("protechAllDel")
	public @ResponseBody String protechAllDel(HttpSession session,
			@RequestParam("proid") String proId){
		Integer ret = salService.salProTechDelete(proId);
		return ret.toString();
	}
	
//////////////////////////////////////////////////////////////////////////////////////	
	/// 윤지 -> 인사&회계
	@RequestMapping("index_p")
	public String personProindex(HttpSession session){
		return "pages/pro/p_process";
	}
	
	//직원 목록 조회 
	@RequestMapping("/p_selectEmp")
	public @ResponseBody List<Employees> selectEmpP(HttpSession session,
			@RequestParam("dept")String deptId,
			@RequestParam("page")int page){
	 
		List<Employees> list = empService.p_selectEmp(deptId,page);
		
		return list;
	}
	
	//부서별 직원 수 조회
	@RequestMapping("/total")
	public @ResponseBody String emptotal(HttpSession session,
			@RequestParam("dept") String dept){
		Integer ret = service.empListTotal(dept);
		return ret.toString();
	}
	
	//직원정보 수정 위한 정보 불러오기
	@RequestMapping("/p_update")
	public @ResponseBody Employees updateEmpP(HttpSession session,
			@RequestParam("id")String id){
		Employees emp = empService.p_Emp(id);
		return emp;
	}
	
	//직원정보 수정
	@RequestMapping(value="/p_update",method=RequestMethod.POST)
	public String updateEmp(HttpSession session,
			@RequestParam("id")String empId,
			@RequestParam("manager")String manager,
			@RequestParam("dept")String dept,
			@RequestParam("team")String team,
			@RequestParam("pos")String pos,
			@RequestParam("salary")int salary,
			@RequestParam("commition")double com
			){
		Employees emp = new Employees();
		
		emp.setEmployeeId(empId);
		emp.setManager(manager);
		emp.setDepartmentId(dept);
		emp.setTeamId(team);
		emp.setPositionId(pos);
		emp.setSalary(salary);
		emp.setCommition(com);
	
		empService.p_updateEmp(emp);
		
		return "redirect:index_p";
	}
	
	//직원 삭제
	@RequestMapping("/p_delete")
	public String p_deleteEmp(HttpSession session,
			@RequestParam("id")String empId) {
		empService.p_deleteEmp(empId);
		return "redirect:index_p";
	}
	
	//새로운 직원 등록
	@RequestMapping(value="/p_insert",method=RequestMethod.POST)
	public String p_insertEmp(HttpSession session,
			@RequestParam("id")String empId,
			@RequestParam("name")String name,
			@RequestParam("phone")String phone,
			@RequestParam("address")String address,
			@RequestParam("hiredate")Date hiredate,
			@RequestParam("password")String password,
			@RequestParam("gender")String gender,
			@RequestParam("manager")String manager,
			@RequestParam("dept")String dept,
			@RequestParam("team")String team,
			@RequestParam("pos")String pos,
			@RequestParam("salary")int salary){
		Employees emp = new Employees();
		emp.setEmployeeId(empId);
		emp.setName(name);
		emp.setPhone(phone);
		emp.setAddress(address);
		emp.setHiredate(hiredate);
		emp.setPassword(password);
		emp.setGender(gender);
		emp.setManager(manager);
		emp.setDepartmentId(dept);
		emp.setTeamId(team);
		emp.setPositionId(pos);
		emp.setSalary(salary);
		
		empService.p_insertEmp(emp);
		
		return "redirect:index_p";
	}
	
	@RequestMapping("/p_deptSelect")
	public @ResponseBody List<Departments> p_deptSelect(){
		List<Departments> dept = empService.p_deptSelect();
		return dept;
	}
	
	@RequestMapping("/p_teamSelect")
	public @ResponseBody List<Teams> p_teamSelect(){
		List<Teams> team = empService.p_teamSelect();
		return team;
	}
	
	@RequestMapping("/p_posSelect")
	public @ResponseBody List<Position> p_posSelect(){
		List<Position> pos = empService.p_posSelect();
		return pos;
	}
	
	@RequestMapping("/p_salarySelect")
	public @ResponseBody Position p_salarySelect(HttpSession session,
                 @RequestParam("posid")String id){
		Position pos = empService.p_salarySelect(id);
		return pos;
	}
	
	@RequestMapping("/p_empSelect")
	public @ResponseBody Employees p_empSelect(HttpSession session,
                 @RequestParam("posid")String id){
		Employees emp = empService.p_empSelect(id);
		return emp;
	}
	
	//회사 연도별 매출 조회
	@RequestMapping("/p_sumProPrice")
	public @ResponseBody long p_sumProPrice(HttpSession session,
			@RequestParam("year")String year){
		long price = empService.p_sumProPrice(year);
		return price;
	}
	
	//부서별 매출조회
	@RequestMapping("p_sumBydeptProPrice")
	public @ResponseBody long p_sumBydeptProPrice(HttpSession session,
			@RequestParam("year")String year,
			@RequestParam("dept")String dept){
		Map<String,String> map = new HashMap<String,String>();
		map.put("year", year);
		map.put("departmentId",	dept);
		long price = empService.p_sumBydeptProPrice(map);
		return price;
	}
	
	//부서관리 부서 조회
	@RequestMapping("p_deptConSelect")
	public @ResponseBody List<Departments> p_deptConSelect(HttpSession session){
		List<Departments> list = empService.p_deptConSelect();
		return list;
	}
	
	//부서관리 부서 등록
	@RequestMapping("p_deptConInsert")
	public String p_deptConInsert(HttpSession session,
		@RequestParam("deptId")String deptId,
		@RequestParam("deptName")String deptName,
		@RequestParam("deptManager")String deptManager){
		
		Departments dept = new Departments();
		dept.setDepartmentId(deptId);
		dept.setDepartmentName(deptName);
		dept.setDepartmentManager(deptManager);
		
		empService.p_deptConInsert(dept);
		return "redirect:index_p";
	}
	
	//부서관리 부서 수정
	@RequestMapping("p_deptConUpdate")
	public String p_deptConUpdate(HttpSession session,
		@RequestParam("deptId")String deptId,
		@RequestParam("deptManager")String deptManager){
		Departments dept = new Departments();
		dept.setDepartmentId(deptId);
		dept.setDepartmentManager(deptManager);
		empService.p_deptConUpdate(dept);
		return "redirect:index_p";
	}
	//부서관리 팀 조회
	@RequestMapping("p_teamConSelect")
	public @ResponseBody List<Teams> p_teamConSelect(HttpSession session,
			@RequestParam("deptid")String deptid){
		List<Teams> list = empService.p_teamConSelect(deptid);
		return list;
	}	
	//부서관리 팀 등록
	@RequestMapping("p_teamConInsert")
	public String p_teamConInsert(HttpSession session,
			@RequestParam("teamId")String teamId,
			@RequestParam("teamName")String teamName,
			@RequestParam("teamManager")String teamManager,
			@RequestParam("deptId")String deptId){
		Teams team = new Teams();
		team.setTeamId(teamId);
		team.setTeamName(teamName);
		team.setTeamManager(teamManager);
		team.setDepartmentId(deptId);
		empService.p_teamConInsert(team);
		return "redirect:index_p";
	}
	
	//부서관리 팀 수정
	@RequestMapping("p_teamConUpdate")
	public String p_teamConUpdate(HttpSession session,
			@RequestParam("teamId")String teamId,
			@RequestParam("teamManager")String teamManager){
		Teams team = new Teams();
		team.setTeamId(teamId);
		team.setTeamManager(teamManager);
		
		Employees emp = new Employees();
		emp.setEmployeeId(teamManager);
		emp.setTeamId(teamId);
		
		empService.p_teamConEmpUpdate(emp);
		empService.p_teamConUpdate(team);
		return "redirect:index_p";
	}
	
	
//////////////////////////////////////////////////////////////////////////////////////
	// 경엉 (대현 & 윤지)
	@RequestMapping("index_r")
	public String RunProIndex(HttpSession session){
		return "pages/pro/r_process";
	}
	
	// 경영에서 프로젝트 목록 보기 (단. 아직 끝나지 안은 프로젝트에 관하여서)
	@RequestMapping("runProList")
	public @ResponseBody List<Projects> runProList(HttpSession session, @RequestParam("page") int page){
		List<Projects> prolist =runService.runSelectPro(page);
		return prolist;
	}
	
	// 경영에서 프로젝트 총 갯수 구하기 (단. 아직 끝나지 안은 프로젝트에 관하여서)
	@RequestMapping("runProTotle")
	public @ResponseBody String runProTotle(HttpSession session){
		Integer r = runService.runSelectProTotle();
		return r.toString();
	}
	
	// 프로 승인하거나 중지하거나 불가라고 하기 
	@RequestMapping(value="appInsert", method=RequestMethod.POST)
	public @ResponseBody String appInsert(HttpSession session,
			@RequestParam("proid") String proId,
			@RequestParam("app") String app){
		Employees user = (Employees)session.getAttribute("user");
		if(app.equals("승인")){
			app = "O";
		}else if(app.equals("불가")){
			app = "X";
		}else if(app.equals("STOP")){
			app = "";
			user.setName("");
		}
		Integer ret = runService.runProInApp(proId, app, user.getName());
		return ret.toString();
	}
	
}
