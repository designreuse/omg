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
	
	// 대현 -> 영업
	@RequestMapping("index_s")
	public String runProindex(HttpSession session){
		return "pages/pro/s_process";
	}
	
	@RequestMapping("techlist")
	public @ResponseBody List<Techs> techList(HttpSession session){
		List<Techs> list =salService.selectTechs();
		return list;
	}
	
	@RequestMapping("salProlist")
	public @ResponseBody List<Projects> salProList(HttpSession session, 
		   @RequestParam("page") int page,
		   @RequestParam("date") int date){
		//System.out.println(date);
		List<Projects> list = salService.selectProject(page,date);
		return list;
	}
	
	@RequestMapping("/salPrototle")
	public @ResponseBody String salProTotle(HttpSession session,
			@RequestParam("date") int date){
		//System.out.println(date);
		Integer total = salService.salProjectTotle(date);
		return total.toString();
	}
	
	@RequestMapping("/salProDetail")
	public String salProDetail(HttpSession session, @RequestParam("proNum") String proId, Model model){
		Projects pro = salService.salProjectByProId(proId);
		model.addAttribute("pro", pro);
		return "pages/pro/s_pro_det_up";
	}
	
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
		protemp.setDepartmentId(deptId);;
		salService.salProjectUpdate(protemp);
		return "redirect:index_s";
	}
	
	@RequestMapping("proDelete")
	public String proDelete(HttpSession session, @RequestParam("proIds") String[] proids){
		salService.deletePro(proids);
		return "redirect:index_s";
	}
	
	@RequestMapping("ProByTech")
	public @ResponseBody List<String> ProByTech(HttpSession session, @RequestParam("proid") String proId){
		List<String> techlist = salService.salSelectTechs(proId);
		return techlist;
	}
	
	@RequestMapping("protechIn")
	public String protechIn(HttpSession session,
			@RequestParam("proid") String proId,
			@RequestParam("techname") String techName){
		salService.salProTechInsert(proId, techName);
		return "redirect:index_s";
	}
	
	@RequestMapping("protechByDel")
	public String protechByDel(HttpSession session,
			@RequestParam("proid") String proId,
			@RequestParam("techname") String techName){
		salService.salProTechByDelete(proId, techName);
		return "redirect:index_s";
	}
	
	@RequestMapping("protechAllDel")
	public String protechAllDel(HttpSession session,
			@RequestParam("proid") String proId){
		salService.salProTechDelete(proId);
		return "redirect:index_s";
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
			@RequestParam("dept")String deptId){
	 
		List<Employees> list = empService.p_selectEmp(deptId);
		
		return list;
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

}
