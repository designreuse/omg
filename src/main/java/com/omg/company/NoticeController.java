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
@RequestMapping("/notice")
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private EmployeeService empservice;
	
	//목록	
	@RequestMapping("/index")
	public String listNotice(HttpSession session) {
		Employees user = (Employees)session.getAttribute("user");

		
		if(user == null){
			return "redirect:../login";
		}
		return "pages/notices/notice";
	}

	//글쓰기 겟
	@RequestMapping(value="/write",method = RequestMethod.GET)
	public String writeget(HttpSession session) {
		
		return "pages/notices/insertNotice";
	}
	
	//글쓰기 포스트
	@RequestMapping(value="/write",method = RequestMethod.POST)
	public String writepost(HttpSession session,
							@RequestParam ("title") String title,
							@RequestParam("checked") String ch,
							@RequestParam("content") String con
							) {
		//System.out.println(notice.getTitle() + notice.getContent() +notice.getNotice_num() +notice.getCredate() +notice.getChecked());
	
		Employees emps = (Employees)session.getAttribute("user");
		Notice notice = new Notice();
		if(ch.equals("O")){
			notice.setTitle(title);
			notice.setDepartmentId(emps.getDepartmentId());
			notice.setWriter(emps.getEmployeeId());
			notice.setContent(con);
			notice.setChecked(ch);
		}else{
			notice.setTitle(title);
			notice.setDepartmentId(emps.getDepartmentId());
			notice.setWriter(emps.getEmployeeId());
			notice.setContent(con);
			notice.setChecked(ch);
			
		}
		noticeService.insertnotice(notice);
		return "redirect:index";
	}
	
	//상세보기
	@RequestMapping(value="/noticeDetail")
	public String noticeDetail(HttpSession session,@RequestParam("notice_num") int notice_num, Model model) {

		Notice num=noticeService.detailNotice(notice_num);
		
		if(num!=null){
			noticeService.countNotice(notice_num);
			model.addAttribute("detail",num); 
		}
		return "pages/notices/noticeDetail";
	}

	
	
	//삭제하기
	@RequestMapping(value="/deleteNotice")
	public String deleteNotice(HttpSession session,@RequestParam("notice_num") String notice_num){

		noticeService.delectNotice(notice_num);
		return "redirect:index";
	}
	
	//수정하기
	//업데이트 노티스의 get
	@RequestMapping(value="/updateNotice",method=RequestMethod.GET)
	public String updateGet(HttpSession session,@RequestParam("notice_num") int notice_num, Model model){
		Notice num=noticeService.detailNotice(notice_num);
		model.addAttribute("update",num);
		
		return "pages/notices/updateNotice";
	}
	
	//업데이트 노티스의 post
	@RequestMapping(value="/updateNotice",method=RequestMethod.POST)
	public String updatePost(HttpSession session,Notice notice){

		noticeService.updateNotice(notice);

		return "redirect:index";
	}

	//List
	@RequestMapping(value="/openlist/{page}")
	public @ResponseBody List<Notice> develop(HttpSession session, @PathVariable("page") int page) {
		List<Notice> list = noticeService.listnotice(page);
		List<Notice> notices=noticeService.selectEmpName(list);
		
		return notices; 
	}
	
	//checked가 여러개일때 list로 보내기
	@RequestMapping(value="/deptlist/{page}")
	public @ResponseBody List<Notice> develop(HttpSession session, 
											  Model model,
											  @PathVariable("page") int page, 
											  @RequestParam("dept") String dept,
											  @RequestParam("checked") String checked) {
		List<Notice> list = noticeService.listdept(page, dept,checked);
		List<Notice> notices=noticeService.selectEmpName(list);
		int total = noticeService.totalCount(dept,checked);
		model.addAttribute("page", page);
		model.addAttribute("totalCount",total);
		return notices; 
	}
	
	// 총 갯수 구하기
	@RequestMapping(value="/total")
	public @ResponseBody String totalcount(HttpSession session, 
											  Model model,
											  @RequestParam("dept") String dept,
											  @RequestParam("checked") String checked) {
		Integer total = noticeService.totalCount(dept,checked);
		return total.toString();
	}
	
	// 부서 확인하는 함수
	@RequestMapping("/checkDept")
	public @ResponseBody String checkDept(HttpSession session){
		Employees emp = (Employees)session.getAttribute("user");
		if(emp.getDepartmentId().equalsIgnoreCase("R")){
			return "R";
		}else if(emp.getDepartmentId().equalsIgnoreCase("M")){
			return "M";
		}else if(emp.getDepartmentId().equalsIgnoreCase("D")){
			return "D";
		}
		return null;
	}
	
	// 경영 부서 화인해서 라디오 체크하게 하기
	@RequestMapping("checkRunTeam")
	public @ResponseBody String checkRunTeam(HttpSession sesssion){
		Employees user = (Employees)sesssion.getAttribute("user");
		if(user.getDepartmentId().equalsIgnoreCase("R")){
			if(user.getTeamId() == null || user.getTeamId().equalsIgnoreCase("R01")){
				return "R";
			}else if(user.getTeamId().equalsIgnoreCase("P01")){
				return "P";
			}else if(user.getTeamId().equalsIgnoreCase("S01")){
				return "S";
			}
		}
		return null;
	}
}