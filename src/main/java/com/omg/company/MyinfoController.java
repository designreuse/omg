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
@RequestMapping("/my")
public class MyinfoController {
	@Autowired
	private EmpinfoService myinfoService;
	
	@Autowired
	private LoginService logService;
	
	
	@RequestMapping("/index")
	public String index(HttpSession session){
		return "pages/information/myinfo";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.GET)
	public String updateget(HttpSession session,@RequestParam("employeeId") String empId, Model model){
	
		
		Employees emp = myinfoService.selectlist(empId);
		model.addAttribute("update", emp);
	
		return "pages/information/updateinfo";
	}
	
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String updatepost(HttpSession session,Employees emp){
		Employees user = (Employees)session.getAttribute("user");
		emp.setEmployeeId(user.getEmployeeId());
		myinfoService.updateinfo(emp);
		Employees outputEmp = logService.selectPass(user);
		session.setAttribute("user", outputEmp);// 세션에 로그인 한사람 정보 저장
		return "redirect:index";	
	}
	
	
	@RequestMapping(value="/myTechDetail")
	public String myTechDetail(HttpSession session,@RequestParam("employeeId") String empId,Model model){
		List<Employees> emp = myinfoService.techlist(empId);
		model.addAttribute("techlist", emp);
		
		return "pages/information/techlist";
	}
	
	// 기술에 등록된 기술들 중에서 내가 같고 있지 않은 기술 보여주기
	@RequestMapping("techlist")
	public @ResponseBody List<String> techList(HttpSession session){
		Employees user = (Employees)session.getAttribute("user");
		List<String> list = myinfoService.selectTechs(user.getEmployeeId());
		return list;
	}
	
	@RequestMapping("myInTech")
	public @ResponseBody String myInTech(HttpSession session, 
			@RequestParam("myid") String myId,
			@RequestParam("techName") String techName){
		Integer i =myinfoService.insertMyTech(myId, techName);
		return i.toString();
	}
}