package com.omg.company;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Test {
	
	
	@RequestMapping("/test")
	public String testView(){
		return "pages/notice";
	}
	
	@RequestMapping("/test2")
	public String test2View(){
		return "pages/NewFile";
	}

}
