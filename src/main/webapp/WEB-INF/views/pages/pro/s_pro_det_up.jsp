<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>프로젝트 수정 페이지</title>
</head>
<body style="background-color: #f4f4f4;">
	<div style="width:1000px;margin:0 auto;">
		<span  style="font-size: 20px;font-weight: bold;">프로젝트 수정 페이지</span>
			<form action="salProUpdate" method="post">
			<input type="hidden" value="${pro.projectId}" name="proId">
			<table border="1" style="background-color: #ccffaa">
				<tr><th style="color: #8888ff">프 로 젝 트 명 :</th><td><input type="text" value="${pro.projectName}" name="proname" /></td></tr>
				<tr><th style="color: #8888ff">금         액  :</th><td><input type="text" value="${pro.projectPrice}" name="price"/></td></tr>
				<tr><th style="color: #8888ff">시작일(y-m-d):</th><td><input type="text" value="${pro.startDate}" name="start"/></td></tr>
				<tr><th style="color: #8888ff">종료일(y-m-d):</th><td><input type="text" value="${pro.endDate}" name="end"/></td></tr>
				<tr><th style="color: #8888ff">부          서 :</th><td><input type="text" value="${pro.deptName}" name="dept"/></td></tr>
				<tr><th style="color: #8888ff">맡    은    팀 :</th><td>${pro.teamName}</td></tr>
				<tr><th style="color: #8888ff">승  인  여  부 :</th><td>${pro.approval}</td></tr>
				<tr><th style="color: #8888ff">승  인  자  명 :</th><td>${pro.approvalName}</td></tr>
			</table>
			<input type="submit" value="수정완료"><input type="reset" value="리셋">
		</form>
	</div>
</body>
</html>