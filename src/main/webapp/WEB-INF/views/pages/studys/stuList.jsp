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
				<h1> <i class="fa fa-laptop"></i>Study 목록</h1>
				<ol class="breadcrumb">
					<li><a href="/company/notice"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">스터디 인원 조회</li>
				</ol>
			</section> 

			<!-- Main content -->
			<section class="content">
				<div class="col-xs-12">
					<div class="box"  >
					<div class="box-header">
									<h3 class="box-title">Study 참여인원</h3>
					</div>
						<div class="box-body table responsive no-padding">
							<table id="gode" class="table table-hover">
								<tr>
									<th>사번</th>
									<th>이름</th>
									<th>부서</th>
									<th>신청날짜</th>
								</tr>
								<!-- for문으로 목록 전체보기. -->
								<c:forEach var="item" items="${studyemp}">
									<tr>
										<td><input type="hidden" value="${item.employeeId}" name="Id" readonly/>${item.employeeId}</td>
										<td><input type="hidden" value="${item.name}" name="Name" readonly/>${item.name}</td>
										<td><input type="hidden" value="${item.departmentName}" name="dName" readonly/>${item.departmentName}</td>
										<td><input type="hidden" value="${item.supplydate}" name="supply" readonly/>${item.supplydate}</td>
										
									</tr>
								</c:forEach>
							</table>
						</div>
						<div class="box-footer clearfix">
							<input type="button" class="btn btn-default" id="back" onclick="location.href='index'" value="뒤로가기">
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
</body>
</html>