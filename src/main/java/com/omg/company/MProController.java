package com.omg.company;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.omg.dto.*;
import com.omg.service.*;

@Controller
@RequestMapping("MAINTENANC")
public class MProController {
	 
	
	@Autowired
	private MproService mproService;
	
	
	@RequestMapping("/index")
	public String mproList(HttpSession session, Model model, String employeeId){
		
		
		return "pages/pro/m_process";
	}
	
	
	
	@RequestMapping("/relist")
	public @ResponseBody List<MProcess> relist(HttpSession session, Model model, String employeeId){
		
		Employees emps = (Employees)session.getAttribute("user"); 
		
		List<MProcess> list = mproService.relist(emps.getEmployeeId());
		
		
		return list;
	}
	@RequestMapping("/colist")
	public @ResponseBody List<MProcess> colist(HttpSession session, Model model, String employeeId){
		
		Employees emps = (Employees)session.getAttribute("user"); 
		
		List<MProcess> list = mproService.colist(emps.getEmployeeId());
		
		
		return list;
	}
	
	@RequestMapping("/exlist")
	public @ResponseBody List<MProcess> exlist(HttpSession session, Model model, String employeeId){
		
		Employees emps = (Employees)session.getAttribute("user"); 
		
		List<MProcess> list = mproService.exlist(emps.getEmployeeId());
		
		
		return list;
	}
	
	@RequestMapping("/spare")
	public @ResponseBody List<MProcess> sparelist(HttpSession session,@RequestParam("proId") String projectId){
		
		Employees emps = (Employees)session.getAttribute("user");
		List<MProcess> list = mproService.sparelist(emps.getTeamId(),projectId);
		return list;
				
	}
	
	
	@RequestMapping("/setpeople")
	public @ResponseBody int setpeople(HttpSession session,
			@RequestParam("proId") String proId,
			@RequestParam("empId") String empId){
		
		int set = mproService.setpeople(proId, empId);
		
		return set;
	}
	
	
	@RequestMapping("/put")
	public @ResponseBody List<MProcess> putlist(HttpSession session, Model model,
			@RequestParam("projectId") String projectId){

		List<MProcess> list = mproService.putlist(projectId);

		return list;
	}
	
	@RequestMapping("/start")
	public @ResponseBody List<MProcess> startlist(HttpSession session){
		
		Employees emps = (Employees)session.getAttribute("user"); 
		
		List<MProcess> list = mproService.startpro(emps.getTeamId());
		
		return list;
	}
	
	@RequestMapping("/delete")
	public @ResponseBody int delete(HttpSession session,
			@RequestParam("proId") String proId,
			@RequestParam("empId") String empId){
		
		
		
		int delete = mproService.delete(proId, empId);
		return delete;
	}

	
	@RequestMapping("/view")
	public @ResponseBody List<MProcess> viewlist(HttpSession session,
			@RequestParam("proId") String proId){
		
		
		List<MProcess> list = mproService.viewlist(proId);
		return list;
	}
	
	
	@RequestMapping(value = "/proing")
	public @ResponseBody
	List<MProcess> proing(HttpSession session) {


		List<MProcess> list = mproService.proing();
		return list;
	}
	
	


	@RequestMapping(value = "/selectTeam")
	public @ResponseBody
	List<MProcess> teams(HttpSession session) {

		List<MProcess> teams = mproService.teams();
		return teams;

	}
	
	@RequestMapping(value = "/setTeam")
	public String setTeam(HttpSession session,
			@RequestParam("teamId") String teamId,
			@RequestParam("projectId") String projectId) {
		
		mproService.setTeam(projectId, teamId);
		
		return "redirect:index";
	}
	
	@RequestMapping(value = "/startPro")
	public @ResponseBody
	List<MProcess> startProjects(HttpSession session) {
		Employees emps = (Employees) session.getAttribute("user");
		List<MProcess> startPro = mproService.startProjects(emps.getEmployeeId());
		return startPro;

	}
	
}
