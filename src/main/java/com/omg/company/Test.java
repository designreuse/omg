package com.omg.company;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class Test {
	
	
	@RequestMapping("/test")
	public String testView(){
		return "pages/pro/pro_error";
	}
	
	@RequestMapping("/test2")
	public String test2View(){
		return "pages/NewFile";
	}

}
