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
					<li><a href="/company/hello"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">신청 스터디</li>
				</ol>
			</section> 

			<!-- Main content -->
			<section class="content">
				<div class="col-xs-12">
					<div class="box"  >
					<div class="box-header">
									<h3 class="box-title">My Study</h3>
					</div>
						<div class="box-body table responsive no-padding">
							<table id="gode" class="table table-hover">
								<tr>
									<th>NO.</th>
									<th>Study제목</th>
									<th>스터디장</th>
									<th>Study day</th>
									<th>취소</th>
								</tr>
								<!-- for문으로 목록 전체보기. -->
								<c:forEach var="item" items="${joinstudy}">
									<tr>
										<td><input type="hidden" value="${item.studyNum}" name="Num" readonly/>${item.studyNum}</td>
										<td><input type="hidden" value="${item.studyName}" name="Name" readonly/>${item.studyName}</td>
										<td><input type="hidden" value="${item.name}" name="Id" readonly/>${item.name}</td>
										<td><input type="hidden" value="${item.studyday}" name="Day" readonly/>${item.studyday}</td>
										<th><input type="button" onclick="location.href='cancel?studyN=${item.studyNum}'" 
										value="취소" name="canc"></th>
										
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