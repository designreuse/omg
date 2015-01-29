package com.omg.company;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.omg.dto.*;
import com.omg.service.*;

@Controller
public class LoginController {
	@Autowired
	private LoginService logService;
	
	@RequestMapping(value="/login")
	public String login(HttpSession session){
		return "logins/loginform";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)	//로그인하기
	public String loginck(
			@RequestParam("empId") String empId,
			@RequestParam("password") String pass,
			HttpSession session){
		Employees inputEmp = new Employees();
		inputEmp.setEmployeeId(empId);
		inputEmp.setPassword(pass);
		Employees outputEmp = logService.selectPass(inputEmp);
		if(outputEmp == null){
			return "logins/logfail";							// 에러 패이지로
		}

		
		int ck = logService.selectManager(outputEmp);
		if(ck == 1 || ck == 2 || ck == 3){
			session.setAttribute("permit", "관리자 모드");			// 관리자 확인하는 것
			if(ck == 1){										// 경영부
				session.setAttribute("Manager", "run");
			}else if(ck == 2){									// 부장
				session.setAttribute("Manager", "dept");
			}else if(ck == 3){									// 팀장
				session.setAttribute("Manager", "team");
			}else{
				session.setAttribute("Manager", null);
			}
		}else{
			session.setAttribute("permit", "사용자 모드");
		}
		if(outputEmp.getGender().equalsIgnoreCase("M")){
			session.setAttribute("image", "/company/resources/img/avatar5.png");
		}else{
			session.setAttribute("image", "/company/resources/img/avatar2.png");
		}
		session.setAttribute("user", outputEmp);					// 세션에 로그인 한사람 정보 저장
		return "redirect:notice/index";									// 게시판으로이동
	}
	
	@RequestMapping("/pass")										// 비밀번호 찾기 화면
	public String pass(){
		return "logins/passseurch";							//검색패이지로
	}
	
	@RequestMapping("/passseurch")								// 비밀번호 찾기
	public String passseurch(
			@RequestParam("empid") String empId,
			@RequestParam("name") String name,
			@RequestParam("email") String email, Model model){
		Employees emp =logService.selectPass(empId, name, email);
		if(emp == null){							// 널이라면
			return "logins/logfail";				// 오류화면으로
		}
		model.addAttribute("userseurch",emp);
		return "logins/passview";
	}
	
	
	@RequestMapping("/logout")
	public String logout(HttpSession session){
		session.invalidate();  					//세션에 저장되있는것을 버린다.
		return "redirect:/login";
	}
	
	@RequestMapping("managerck")
	public @ResponseBody String managerck(HttpSession session){
		Employees user = (Employees)session.getAttribute("user");
		String manager = "";
		int ck = logService.selectManager(user);
		if(ck == 1){										// 경영부
			manager = "R";
		}else if(ck == 2){									// 부장
			manager = "D";
		}else if(ck == 3){									// 팀장
			manager = "T";
		}
		return manager;
	}
}
