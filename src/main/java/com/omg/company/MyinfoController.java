package com.omg.company;

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
		return "pages/myinfo";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.GET)
	public String updateget(HttpSession session,@RequestParam("employeeId") String empId, Model model){
	
		
		Employees emp = myinfoService.selectlist(empId);
		model.addAttribute("update", emp);
	
		return "pages/updateinfo";
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
}