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
	public @ResponseBody List<MProcess> sparelist(HttpSession session, Model model, String teamId){
		
		Employees emps = (Employees)session.getAttribute("user");
		List<MProcess> list = mproService.sparelist(emps.getTeamId());
		return list;
				
	}
	
	@RequestMapping("/put")
	public @ResponseBody List<MProcess> putlist(HttpSession session, Model model, String teamId){
		
		Employees emps = (Employees)session.getAttribute("user"); 
		
		List<MProcess> list = mproService.putlist(emps.getTeamId());
		
		
		
		return list;
	}
	
	
}
