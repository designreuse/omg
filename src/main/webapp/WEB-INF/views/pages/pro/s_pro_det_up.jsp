<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>프로젝트 수정 페이지</title>
<script src="/company/resources/js/jquery-1.11.2.js"></script>
<script>
	$(function() {
		$("#subbtn").click(function() {
			window.close();
		});
	});
</script>
</head>
<body style="background-color: #f4f4f4;">
	<div style="width:1000px;margin:0 auto;">
		<span  style="font-size: 20px;font-weight: bold;">프로젝트 수정 페이지</span>
			<form action="salProUpdate" method="post">
			<input type="hidden" value="${pro.projectId}" name="proId">
			<table border="1" style="background-color: #ccffaa">
				<tr><th style="color: #8888ff">프 로 젝 트 명 :</th><td><input id="proname" type="text" value="${pro.projectName}" name="proname" /></td></tr><!-- 팀장 -->
				<tr><th style="color: #8888ff">금         액  :</th><td><input type="text" value="${pro.projectPrice}" name="price"/></td></tr>
				<tr><th style="color: #8888ff">시작일(y-m-d):</th><td><input type="text" value="${pro.startDate}" name="start"/></td></tr>
				<tr><th style="color: #8888ff">종료일(y-m-d):</th><td><input type="text" value="${pro.endDate}" name="end"/></td></tr>
				<tr><th style="color: #8888ff">부          서 :</th><td><input id="dept" type="text" value="${pro.departmentId}" name="dept"/><br>(개발:D, 유지보수:M)</td></tr><!-- 팀장 -->
				<tr><th style="color: #8888ff">맡    은    팀 :</th><td>${pro.teamName}</td></tr>
				<tr><th style="color: #8888ff">승  인  여  부 :</th><td>${pro.approval}</td></tr>
				<tr><th style="color: #8888ff">승  인  자  명 :</th><td>${pro.approvalName}</td></tr>
			</table>
			<input id="subbtn" type="submit" value="수정완료"><input type="reset" value="리셋">
		</form>
	</div>
	<script>
		$(function() {
			$.ajax({
				url: "/company/managerck",
				dataType: "text",
				async: false,
				success: function(txt) {
					permit = txt;
				}
			});
			
			if(permit != "T"){
				$("#proname").attr("readonly", "readonly");
				$("#dept").attr("readonly", "readonly");
			}
		});
	</script>
</body>
</html>