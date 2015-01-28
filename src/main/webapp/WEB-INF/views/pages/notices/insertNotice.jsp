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
<body class="skin-blue">
	<!-- header logo: style can be found in header.less -->
	<jsp:include page="/WEB-INF/views/tiles/header.jsp"></jsp:include>
	<div class="wrapper row-offcanvas row-offcanvas-left">
		<!-- 내용 부분 -->
		<!-- Left side column. contains the logo and sidebar -->
		<!-- 목록 눌럿을때 보이는 부분 -->
		<jsp:include page="/WEB-INF/views/tiles/sidebar.jsp"></jsp:include>
	
	<aside class="right-side">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>공지게시판</h1>
			<ol class="breadcrumb">
				<li><a href="/company/notice/index"><i class="fa fa-dashboard"></i>
						Home</a></li>
				<li class="active">공지사항</li>
			</ol>
		</section>
		<!--폼시작  -->
		<form action="/company/notice/write" method="POST">	
			<div id="nboard" style="width: 773px; text-align: left;">
				<h1 style="font-style: oblique; font-weight: bold;">공지사항</h1>
			</div>

			<div align="left">
				<label class="item" style="font-weight: bold;"> 제목:<input
					type="text" name="title" style="width: 800px"
					placeholder="제목을 입력하시오">
				</label>
			</div>


			<div>
				<input type="hidden" name='department_id'	value="${user.departmentId}">
				O<input type="radio" name='checked' value='O'>
				R<input type="radio" name='checked' value='R'>
				M<input type="radio" name='checked' value='M'>
				P<input type="radio" name='checked' value='P'>
				D<input type="radio" name='checked' value='D'>
				S<input type="radio" name='checked' value='S'>
				<input type="hidden" value="${user.employeeId} " name=writers>
				<!--user.employeeid를 받아와서 수정못하게함  -->

				<h2>내용</h2>
				<textArea name="content" rows="10" cols="100">
        		 </textArea>
				<br> <input type="submit" value="완성">
			</div>
		</form>

	</aside>
	</div>
		
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"
		type="text/javascript"></script>
	<!-- AdminLTE App -->
	<script src="/company/resources/js/AdminLTE/app.js"
		type="text/javascript"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="/company/resources/js/AdminLTE/demo.js"
		type="text/javascript"></script>
</body>
</html>