package com.omg.company;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("dashboard")
public class DashboardController {
	// 근하신년 페이지
	@RequestMapping("/hello")
	public String helloView(){
		return "hello";
	}
	
	
}
