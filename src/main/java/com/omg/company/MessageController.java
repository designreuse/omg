package com.omg.company;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import com.omg.dto.*;
import com.omg.service.*;

@Controller
@RequestMapping("/message")
public class MessageController {
	@Autowired
	private MessageService MService;
	@RequestMapping("/index")
	public String messageindex(HttpSession session){
		Employees ck = (Employees)session.getAttribute("user");
		if(ck == null){
			return "redirect:../login";
		}
		return "pages/message";
	}
	
	@RequestMapping("/usersurech")
	public @ResponseBody List<Employees> usersurech(){
		List<Employees> names = MService.empsName();
		return names;
	}
	
	@RequestMapping("/insert")
	public String meginsert(
			HttpSession session,
			@RequestParam("message_cc") String ccname,
			@RequestParam("message_title") String title,
			@RequestParam("message") String text){
		Employees user = (Employees)session.getAttribute("user");
		int ret = MService.sendMsg(user.getEmployeeId(), ccname, title, text);
		if(ret <= 0){
			return "";
		}
		return "pages/message";
	}
	
	@RequestMapping("/Msglist")
	public @ResponseBody List<Messages> viewMsgs(HttpSession session, @RequestParam("page") int page){
		Employees user = (Employees)session.getAttribute("user");
		String userId = user.getEmployeeId();
		List<Messages> list = MService.selectMsgs(page, userId);
		return list;
	}
	
	@RequestMapping("/total")
	public @ResponseBody String msgtotal(HttpSession session){
		Employees user = (Employees)session.getAttribute("user");
		String userId = user.getEmployeeId();
		Integer totalCount = MService.totalCount(userId);
		return totalCount.toString();
	}
	
	@RequestMapping("/detail")
	public @ResponseBody Messages detail(HttpSession session,@RequestParam("num") int num){
		Messages msg = MService.selectDetail(num);
		return msg;
	}
	
	@RequestMapping(value="/surechMsg", method=RequestMethod.POST)
	public @ResponseBody List<Messages> surech(HttpSession session, @RequestParam("name") String name, @RequestParam("page") int page){
		Employees user = (Employees)session.getAttribute("user");
		Messages msg = new Messages();
		msg.setReceiveId(user.getEmployeeId());
		msg.setSendName(name);
		msg.setPage(page);
		List<Messages> list = MService.selectMsgByName(msg);
		return list;
	}
	
	@RequestMapping("/surechMsgtotal")
	public @ResponseBody String surechmsgtotal(HttpSession session, @RequestParam("name") String name){
		Employees user = (Employees)session.getAttribute("user");
		Messages msg = new Messages();
		msg.setReceiveId(user.getEmployeeId());
		msg.setSendName(name);
		Integer totalCount = MService.totalByNameCount(msg);
		return totalCount.toString();
	}
	
	@RequestMapping("/delete")
	public String deleteMsg(HttpSession session, @RequestParam("cboxs") int[] nums){
		MService.deleteMessage(nums);
		return "pages/message";
	}
}