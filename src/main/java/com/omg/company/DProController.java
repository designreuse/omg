package com.omg.company;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.omg.dto.DProcess;
import com.omg.dto.Employees;
import com.omg.service.DProService;

@Controller
@RequestMapping(value = "/DEVELOPMENT")
public class DProController {
	@Autowired
	private DProService dProService;
	@RequestMapping(value = "/index")
	public String listdPro(HttpSession session, Model model){
		/*Employees emps = (Employees)session.getAttribute("user"); 
		List<DProcess> listdPro = dProService.listProjects(emps.getEmployeeId());
		DProcess dpro = dProService.dPro(emps.getEmployeeId());
		model.addAttribute("listdPro", listdPro);
		model.addAttribute("dPro", dpro);*/
		return "pages/pro/d_process";
		
	}
	@RequestMapping(value = "/proList")
	public @ResponseBody List<DProcess> proList(HttpSession session, Model model){
		Employees emps = (Employees)session.getAttribute("user"); 
		List<DProcess> listdPro = dProService.listProjects(emps.getEmployeeId());
		/*System.out.println(listdPro.get(0).getEmployeeId());*/
		return listdPro;

}
	@RequestMapping(value = "/dPro")
	public @ResponseBody DProcess dPro(HttpSession session, Model model){
		Employees emps = (Employees)session.getAttribute("user"); 
		DProcess dPro = dProService.dPro(emps.getEmployeeId());
		/*System.out.println(dPro.getProjectName());
		System.out.println(dPro.getTechName());
		System.out.println(dPro.getStartDate());
		System.out.println(dPro.getEndDate());*/
		return dPro;
}
	
	@RequestMapping(value = "/ListColleague")
	public @ResponseBody List<DProcess> ListColleague(HttpSession session, Model model){
		Employees emps = (Employees)session.getAttribute("user"); 
		List<DProcess> listdColleague = dProService.listColleague(emps.getEmployeeId());
		/*System.out.println(listdPro.get(0).getEmployeeId());*/
		return listdColleague;

}
	@RequestMapping(value = "/startPro")
	public @ResponseBody List<DProcess> startProjects(HttpSession session, Model model){
		Employees emps = (Employees)session.getAttribute("user"); 
		List<DProcess> startPro = dProService.startProjects(emps.getEmployeeId());
		/*System.out.println(listdPro.get(0).getEmployeeId());*/
		return startPro;

}
	@RequestMapping(value = "/SCVList")
	public @ResponseBody List<DProcess> SCVList(HttpSession session, Model model){
		//System.out.println("Zz");
		Employees emps = (Employees)session.getAttribute("user"); 
		List<DProcess> SCVList = dProService.SCVList();
		return SCVList;

}
	
	@RequestMapping(value = "/selectTeam")
	public @ResponseBody List<DProcess> teams(HttpSession session, Model model){
		
		Employees emps = (Employees)session.getAttribute("user"); 
		List<DProcess> teams = dProService.teams();
		return teams;

}
}