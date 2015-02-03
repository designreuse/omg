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
		<!-- Right side column. Contains the navbar and content of the page -->
		<!-- 내용부분... -->
		<aside class="right-side">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>§Study 수정§</h1>
				<ol class="breadcrumb">
					<li><a href="/company/notice"><i class="fa fa-dashboard"></i>
							Home</a></li>
					<li class="active">스터디 정보 수정</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="col-xs-12">
					<div class="box" style="width: 500px;">
					<div class="box-header">
									<h3 class="box-title">Study 수정</h3>
					</div>
						<div class="box-body table responsive no-padding">
							<form action="update" method="post">
								<table id="gode" class="table table-hover" border="1">
									<tr>
										<th>Study번호</th>
										<td><input type="hidden" name="study_num" id="studyNum" value="${study1.studyNum}" readonly/>${study1.studyNum}</td>
									</tr>
									<tr>
										<th>Study제목</th>
										<td><input type="hidden" name="study_name" id="studyName" value="${study1.studyName}" readonly />${study1.studyName}</td>
									</tr>
									<tr>
										<th>인원제한</th>
										<td><input type="text" name="member_cnt" id="member_cnt" /></td>
									</tr>
									<tr>
										<th>Study day</th> 
										<td> 
										 	<select name="studyday">
											    <option value="월요일" selected="selected">월요일</option>
											    <option value="화요일">화요일</option>
											    <option value="수요일">수요일</option>
											    <option value="목요일">목요일</option>
											    <option value="금요일">금요일</option> 
											</select>
										</td>
									</tr>
									<tr>
										<td colspan="2">
										<input type="submit" id="add" value="등록">
										<input type="button" id="cancel" onclick="location.href='index'" value="취소"></td>
									</tr>
								</table>
							</form>
						</div>
					</div>
				</div>

			</section>
			<!-- /.content -->
		</aside>
		<!-- /.right-side -->
	</div>
	<!-- ./wrapper -->

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
