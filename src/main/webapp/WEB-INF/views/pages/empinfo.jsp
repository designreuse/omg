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
<script src="/company/resources/js/jquery-1.11.2.js"></script>
<script>
	$(function() {
		$("#develop").click(
				function() {
					$("#empTitle").empty();
					$("#empTitle").text("『개발 부서 인원』");
					$("#datalist").empty(); // 안에있는 내용 삭제
					$.ajax({
						url : "select", // select 경로로 보내기
						dataType : "json", // json으로 받는다
						data : "dept=D", // 값을 임으로 만들어서 넘김
						success : function(json) {
							$.each(json, function(index, item) { // foreach해줌 
								var td = "<td>" + item.name + "</td>" + "<td>"
										+ item.phone + "</td>" + "<td>"
										+ item.address + "</td>" + "<td>"
										+ item.email + "</td>" + "<td>"
										+ item.posName + "</td>" + "<td>"
										+ item.teamName + "</td>" + "<td>"
										+ item.hiredate + "</td>" + "<td>"
										+ item.birth + "</td>";
								$("<tr>" + td + "</tr>").appendTo(
										$("#datalist")); // 맏들
							});
						}
					});
				});
		$("#maintenance").click(
				function() {
					$("#empTitle").empty();
					$("#empTitle").text("『유지 보수 부서 인원』");
					$("#datalist").empty();
					$.ajax({
						url : "select",
						dataType : "json",
						data : "dept=M",
						success : function(json) {
							$.each(json, function(index, item) {
								var td = "<td>" + item.name + "</td>" + "<td>"
										+ item.phone + "</td>" + "<td>"
										+ item.address + "</td>" + "<td>"
										+ item.email + "</td>" + "<td>"
										+ item.posName + "</td>" + "<td>"
										+ item.teamName + "</td>" + "<td>"
										+ item.hiredate + "</td>" + "<td>"
										+ item.birth + "</td>";
								$("<tr>" + td + "</tr>").appendTo(
										$("#datalist"));
							});
						}
					});
				});
		$("#run").click(
				function() {
					$("#empTitle").empty();
					$("#empTitle").text("『경영 부서 인원』");
					$("#datalist").empty();
					$.ajax({
						url : "select",
						dataType : "json",
						data : "dept=R",
						success : function(json) {
							$.each(json, function(index, item) {
								var td = "<td>" + item.name + "</td>" + "<td>"
										+ item.phone + "</td>" + "<td>"
										+ item.address + "</td>" + "<td>"
										+ item.email + "</td>" + "<td>"
										+ item.posName + "</td>" + "<td>"
										+ item.teamName + "</td>" + "<td>"
										+ item.hiredate + "</td>" + "<td>"
										+ item.birth + "</td>";
								$("<tr>" + td + "</tr>").appendTo(
										$("#datalist"));
							});
						}
					});
				});
	});
</script>
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
				<h1>OMG 가족들♥</h1>
				<ol class="breadcrumb">
					<li><a href="/company/notice/index"><i
							class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">직원정보</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="mailbox row">
					<div class="col-xs-12">
						<div class="box box-solid">
							<div class="box-body">
								<div class="row">
									<h1 id="empTitle" style="float: left; font-weight: bold;">『인원조회』</h1>
									<span style="float: right !important; margin: 10px;"> <span
										style="color: blue;"><b>부서선택</b></span>
										<button id="develop" class="btn btn-primary btn-flat">개발</button>
										<button id="maintenance" class="btn btn-success btn-flat">유지보수</button>
										<button id="run" class="btn btn-info btn-flat">경영</button>
									</span>
									<div class="col-xs-12">
										<div class="box">
											<div class="box-body table responsive no-padding">
												<table class="table table-hover">
													<thead>
														<tr>
															<th>이름</th>
															<th>Phone</th>
															<th>주소</th>
															<th>Email</th>
															<th>직책</th>
															<th>Team</th>
															<th>입사일</th>
															<th>Birth</th>
														</tr>
													</thead>
													<tbody id="datalist">
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>			
			</section>
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
