<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The OMG ~~</title>
</head>
<body>
<div class="row invoice-info">
	<div class="col-md-10"><h3>내 정보</h3></div>
		<br>
			<div class="col-md-2" style="background-color: #f0f7fd; border-left: 10px solid #eee; border-color: #d0e3f0; font-family: 'Jeju Gothic', serif; font-size: 14pt">
	<form action="update" method="post">
		이름:${update.name}<br style="line-height: 150%;" />
		사번:${update.employeeId}<br style="line-height: 150%;" />
		비밀번호:<input type="text" name=password value="${update.password }"><br style="line-height: 150%;" />
		직책:${update.positionId}<br style="line-height: 150%;" />
		전화번호:<input type="text" name=phone value="${update.phone }"> <br style="line-height: 150%;" />
		주소:<input type="text" name=address value="${update.address }"> <br style="line-height: 150%;" />
		이메일:<input type="text" name=email value="${update.email }"> <br style="line-height: 150%;" />
		생일:${update.birth}<br style="line-height: 150%;" />
		<br> <input type="submit" value="완성">
	</form>
	</div>	
</div>
</body>
</html>