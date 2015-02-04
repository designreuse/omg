<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The OMG ~~</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link
	href="//code.ionicframework.com/ionicons/1.5.2/css/ionicons.min.css"
	rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="/company/resources/css/AdminLTE.css" rel="stylesheet"
	type="text/css" />
</head>

<!--몸통부분  -->
<div class="row invoice-info">
	<div class="col-md-10">
		<h3>내 정보</h3></div>
		<br>
		<div class="col-md-2" style="background-color: #f0f7fd; border-left: 10px solid #eee; border-color: #d0e3f0; font-family: 'Jeju Gothic', serif; font-size: 14pt">
			이름:${user.name}<br style="line-height: 150%;" />
			사번:${user.employeeId}<br	style="line-height: 150%;" /> 
			비밀번호:${user.password}<br style="line-height: 150%;" /> 
			직책:${user.positionId}<br	style="line-height: 150%;" />
			전화번호:${user.phone}<br	style="line-height: 150%;" /> 
			주소:${user.address}<br style="line-height: 150%;" /> 
			이메일:${user.email}<br	style="line-height: 150%;" /> 
			생일:${user.birth}<br style="line-height: 150%;" />
	</div>
	<!-- /.col -->

	<br> <br>
	<div align="left" class="col-xs-12">
		<a href="update?employeeId=${user.employeeId}"><button
				class="btn btn-default"
				style="font-family: 'Jeju Gothic', serif; font-size: 12pt">수정</button></a>
	</div>

	<!-- /.content -->

	<!-- /.right-side -->
</div>
<!-- ./wrapper -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"
	type="text/javascript"></script>
<!-- AdminLTE App -->
<script src="/company/resources/js/AdminLTE/app.js"
	type="text/javascript"></script>
</body>
</html>