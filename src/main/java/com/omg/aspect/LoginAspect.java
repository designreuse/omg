package com.omg.aspect;

import javax.servlet.http.*;

import org.aspectj.lang.*;
import org.aspectj.lang.annotation.*;

@Aspect
public class LoginAspect {
	// within(com.omg.company.EmpinfoController)||within(com.omg.company.MessageController)||within(com.omg.company.NoticeController)|| ||within(com.omg.company.StudyController) ||within(com.omg.company.MyinfoController)
	@Around("within(com.omg.company.FreeBoardController)||within(com.omg.company.CalendarController)||within(com.omg.company.ProcessController)")
	public String isLogin(ProceedingJoinPoint joinPoint) {
		Object[] args = joinPoint.getArgs();
		String url = null;
		
		// 세션 정보!
		HttpSession session = (HttpSession) args[0];		
		Object obj = session.getAttribute("user");
		try {
			url = (String) joinPoint.proceed();
			
			if(obj == null) {
				// 로그인 페이지 이동!
				url = "redirect:../login";
			}
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		return url;
	}
}
