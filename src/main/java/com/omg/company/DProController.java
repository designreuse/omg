package com.omg.company;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.omg.dto.DProcess;
import com.omg.dto.Employees;
import com.omg.service.DProService;

@Controller
@RequestMapping(value = "/DEVELOPMENT")
public class DProController {
	@Autowired
	private DProService dProService;

	@RequestMapping(value = "/index")
	public String listdPro(HttpSession session) {
		/*
		 * Employees emps = (Employees)session.getAttribute("user");
		 * List<DProcess> listdPro =
		 * dProService.listProjects(emps.getEmployeeId()); DProcess dpro =
		 * dProService.dPro(emps.getEmployeeId());
		 * model.addAttribute("listdPro", listdPro); model.addAttribute("dPro",
		 * dpro);
		 */
		return "pages/pro/d_process";

	}

	@RequestMapping(value = "/proList")
	public @ResponseBody
	List<DProcess> proList(HttpSession session) {
		Employees emps = (Employees) session.getAttribute("user");
		List<DProcess> listdPro = dProService
				.listProjects(emps.getEmployeeId());
		/* System.out.println(listdPro.get(0).getEmployeeId()); */
		return listdPro;

	}

	@RequestMapping(value = "/dPro")
	public @ResponseBody
	DProcess dPro(HttpSession session) {
		Employees emps = (Employees) session.getAttribute("user");
		DProcess dPro = dProService.dPro(emps.getEmployeeId());
		/*
		 * System.out.println(dPro.getProjectName());
		 * System.out.println(dPro.getTechName());
		 * System.out.println(dPro.getStartDate());
		 * System.out.println(dPro.getEndDate());
		 */
		return dPro;
	}

	@RequestMapping(value = "/ListColleague")
	public @ResponseBody
	List<DProcess> ListColleague(HttpSession session) {
		Employees emps = (Employees) session.getAttribute("user");
		List<DProcess> listdColleague = dProService.listColleague(emps
				.getEmployeeId());
		/* System.out.println(listdPro.get(0).getEmployeeId()); */
		return listdColleague;

	}

	@RequestMapping(value = "/startPro")
	public @ResponseBody
	List<DProcess> startProjects(HttpSession session) {
		Employees emps = (Employees) session.getAttribute("user");
		List<DProcess> startPro = dProService.startProjects(emps
				.getEmployeeId());
		/* System.out.println(listdPro.get(0).getEmployeeId()); */
		return startPro;

	}

	@RequestMapping(value = "/proing")
	public @ResponseBody
	List<DProcess> proing(HttpSession session) {
		// System.out.println("Zz");

		List<DProcess> proing = dProService.proing();
		return proing;

	}

	@RequestMapping(value = "/selectTeam")
	public @ResponseBody
	List<DProcess> teams(HttpSession session) {

		List<DProcess> teams = dProService.teams();
		return teams;

	}

	@RequestMapping(value = "/setTeam")
	public String setTeam(HttpSession session,
			@RequestParam("selectTeam") String teamId,
			@RequestParam("projectId") String projectId) {

		Map map= new HashMap() ;
		map.put("teamId", teamId);
		map.put("projectId", projectId);
		
		
		
		dProService.setTeams(map);

		return "redirect:index";

	}
}