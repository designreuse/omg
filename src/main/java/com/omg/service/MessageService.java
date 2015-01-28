package com.omg.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.omg.dao.*;
import com.omg.dto.*;

@Service
public class MessageService {
	@Autowired
	private MessageDAO msgDAO;
	
	@Autowired
	private EmployeeDAO empDAO;
	
	// 메세지 보내기
	public int sendMsg(String sendId, String receiveId,String title,String text){
		Messages msg = new Messages();
		msg.setSendId(sendId);
		msg.setReceiveId(employeeId(receiveId));   // 이름으로 입력해서 아이디로 바꾸어주기
		msg.setTitle(title);
		msg.setContent(text);
		int ret = msgDAO.insertMessage(msg);
		return ret;
	}
	
	// 직원 이름 검색하기
	public List<Employees> empsName(){
		List<Employees> names =empDAO.selectEmp();
		return names;
	}
	
	// 현제 사용자 메시지 가져오기 (page포함)
	public List<Messages> selectMsgs(int page, String userId) {
		List<Messages> temp = msgDAO.selectMsgs(page, userId);
		List<Messages> list = new ArrayList<Messages>();
		for(Messages m: temp){
			m.setSendName(employeeName(m.getSendId()));
			list.add(m);
		}
		return list;
	}
	
	// 총 페이지의 수 구하기 (page포함)
	public int totalCount(String userId) {
		int totalCount = msgDAO.totalCount(userId);
		return totalCount;
	}
	
	// detail 찾아오기 석택한 것
	public Messages selectDetail(int num){
		Messages msg = msgDAO.selectDetail(num);
		msg.setSendName(employeeName(msg.getSendId()));
		return msg;
	}
	
	// 사람 검색해서 찾아오기(name)
	public List<Messages> selectMsgByName(Messages msg) {
		msg.setSendId(employeeId(msg.getSendName()));  // 이름 -> id로
		List<Messages> temp= msgDAO.selectMsgByName(msg);
		List<Messages> list = new ArrayList<Messages>(); // id -> 이름
		for(Messages m: temp){
			m.setSendName(employeeName(m.getSendId()));
			list.add(m);
		}
		return list;
	}
	
	// 사람 검색해서 찾아오기(cont)
		public int totalByNameCount(Messages msg) {
			msg.setSendId(employeeId(msg.getSendName()));  // 이름 -> id로
			int totalByNameCount = msgDAO.totalByNameCount(msg);
			return totalByNameCount;
		}
	
	// 체크된 메시지 지우기
	public int deleteMessage(int[] msgnums) {
		int ret = msgDAO.deleteMessage(msgnums);
		return ret;
	}
	
	// empId 찾기 이름->id
	public String employeeId(String name){
		String empid = "";
		List<Employees> emps = empDAO.selectEmp();
		for(Employees e : emps){
			if(name.equalsIgnoreCase(e.getName())){
				empid = e.getEmployeeId();
			}
		}
		return empid;
	}
	
	// empName 찾기 id->이름
	public String employeeName(String sendId){
		String empName = "";
		List<Employees> emps = empDAO.selectEmp();
		for(Employees e : emps){
			if(sendId.equalsIgnoreCase(e.getEmployeeId())){
				empName = e.getName();
			}
		}
		return empName;
	}
}
