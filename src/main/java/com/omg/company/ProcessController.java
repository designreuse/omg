package com.omg.company;

import javax.servlet.http.*;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import com.omg.dto.*;

@Controller
@RequestMapping("process")
public class ProcessController {
	@RequestMapping("index")
	public String index(HttpSession session){
		Employees emp = (Employees)session.getAttribute("user");
		if(emp == null){							// 로그인 여부
			return "redirect:../login";
		}else if(emp.getDepartmentId().equalsIgnoreCase("M")){ // 유지보수
			return "redirect:../MAINTENANC/index";
		}else if(emp.getDepartmentId().equalsIgnoreCase("D")){ // 개발
			return "redirect:../DEVELOPMENT/index";
		}else if(emp.getDepartmentId().equalsIgnoreCase("R")){
			if(emp.getTeamId() == null){
				return "redirect:../RUN/index_r";
			}else if(emp.getTeamId().equalsIgnoreCase("S01")){ //영업
				return "redirect:../RUN/index_s";
			}else if(emp.getTeamId().equalsIgnoreCase("P01")){ // 인사회계
				return "redirect:../RUN/index_p";
			}else { 									// 경영
				return "redirect:../RUN/index_r";
			}
		}
		return "pages/pro/pro_error";
	}
}
