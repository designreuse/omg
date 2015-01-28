package com.omg.company;

import javax.servlet.http.*;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("calendar")
public class CalendarController {
	@RequestMapping("index")
	public String index(HttpSession session){
		return "pages/calendar";
	}
}
