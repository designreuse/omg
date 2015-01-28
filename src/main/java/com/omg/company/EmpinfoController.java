package com.omg.company;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import com.omg.dto.*;
import com.omg.service.*;

@Controller
@RequestMapping("/empinfo")
public class EmpinfoController {
	@Autowired
	private EmpinfoService service;
	
	@RequestMapping("/index")
	public String empinfo(HttpSession session){
		Employees user = (Employees)session.getAttribute("user");
		if(user == null){
			return "redirect:../login";
		}
		return "pages/empinfo";
	}
	
	@RequestMapping("/select")
	public @ResponseBody List<Employees> empselect(HttpSession session, @RequestParam("dept") String deptname){
		List<Employees> temp =	service.selectEmpinfo(deptname);
		List<Employees> list = 	service.selectByName(temp);
		return list;
	}
}
