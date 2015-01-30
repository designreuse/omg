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
		startpage = 1;
		endpage = 0;
		// test
		$("#emp").click(function() {
			startpage = 1;
			endpage = 0;
			alert('직원');
		});
		
		$("#sale").click(function() {
			startpage = 1;
			endpage = 0;
			alert('매출');
		});
		$("#pro").click(function() {
			startpage = 1;
			endpage = 0;
			$.ajax({          			// 프로잭트 리스트 보여주기
				url : "runProList",
				dataType : "json",
				data : "page="+startpage,
				async: false,
				success : function(json) {
					$.each(json, function(index, item) { 
						var td = "<td>"+item.projectName+"</td>"+
								 "<td>"+item.deptName+"</td>"+
								 "<td>"+item.startDate+"</td>"+
								 "<td>"+item.endDate+"</td>"+
								 "<td>"+item.projectPrice+"</td>"+
								 "<td><select name='approval'><option value=''>-선택-</option>"+
									 "<option value='승인'>승인</option><option value='불가'>불가</option>"+
									 "<option value='stop'>대기</option></select>";
						$("<tr>"+td+"</tr>").appendTo($("#list"));
					});
				}
			});
			
			$.ajax({					// ProjectList 페이지 총페이지수 구하기
				url: "runProTotle" ,
				dataType: "text",
				async: false,
				success : function(text) {
					endpage = parseInt(((text-1) / 10) + 1);
					$("#page").text(startpage);
					$("#total").text(text);
					$("#nextdesc").removeClass("disabled");
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
				<h1>경영 부서 업무</h1>
				<ol class="breadcrumb">
					<li><a href="/company/notice/index"><i
							class="fa fa-dashboard"></i>Home</a></li>
					<li class="active">경영 부서 업무</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="mailbox row">
					<div class="col-xs-12">
						<div class="box box-solid">
							<div class="box-body">
								<div class="row" >
									<div class="col-md-2 col-sm-4" id="bnt_window" >
										<div class="box-header">
											<h3 class="box-title" id="h3"><b>직원 관리</b></h3>
										</div>
										<div style="margin: 10px;">
											<a id="emp" class="btn btn-danger btn-flat">직원조회</a>
										</div><div style="margin: 10px;">
											<a id="sale" class="btn btn-warning btn-flat">매출조회</a>
										</div><div style="margin: 10px;">
											<a id="pro" class="btn btn-success btn-flat">프로젝트</a>
										</div>
										
										<div style="bottom: 0px;">
											<div align="center"><h5 class="box-title" id="h3"><b>프로젝트 승인</b></h5></div>
											<div class="table-responsive">
												<form action="" method="post">
													<table class="table table-bordered" border="1" >
														<thead align="left">
															<tr><th>프로젝트명</th><td>??</td></tr>
															<tr><th>승인여부</th><td id="appCK"></td></tr>
														</thead>
													</table>
													<div align="right">
														<a id="appInBtn" class="btn btn-default btn-sm">입력</a>
														<a id="appUpBtn" class="btn btn-default btn-sm">수정</a>
													</div>
												</form>
											</div>
										</div>
									</div>
									
									<div id="detailview" class="col-md-10 col-sm-8">
										<div class="row pad">
											<div class="input-group" style="float: right !important; margin: 10px;">
												<div>
												<!-- <button value="D" id="development"
														class="btn btn-primary btn-flat">개발부</button>
													<button value="M" id="manage"
														class="btn btn-success btn-flat">유지보수부</button>
													<button value="R" id="run" 
														class="btn btn-info btn-flat">경영부</button>-->
												</div> 
											</div>
											<!-- </div> -->
										</div>
										<!-- /.row -->
										<div class="table-responsive">
											<table class="table table-bordered" border="1">
												<thead>
													<tr align="center">
														<th>프로잭트명</th>
														<th>부 서</th>
														<th>시 작 일</th>
														<th>종 료 일</th>
														<th>가 격</th>
														<th>승 인 여 부</th>
													</tr>
												</thead>
												<tbody id="list">
												</tbody>
											</table>
										</div>
										<!-- /.table-responsive -->
									</div>
									<!-- /.col (RIGHT) -->
								</div>
								<!-- /.row -->
							</div>
							<!-- /.box-body -->
							<div class="box-footer clearfix" >
								<div class="pull-right" id="bnt">
									<!-- <button id="new_bnt" class="btn btn-primary">직원 등록</button>
									<a id="del_bnt" class="btn btn-primary">직원 삭제</a> -->
									<small> 페이지 : <span id="page"></span>/<span id="totle"></span></small> <!-- 해야됨 -->
									<span id="buttoncontroll">
									</span>
								</div>
							</div>
							<!-- box-footer -->
						</div>
						<!-- /.box -->
					</div>
					<!-- /.col (MAIN) -->
				</div>
				<!-- MAILBOX END -->
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
<!-- <script>
	$(function() {
		
	});
</script> -->
</body>
</html>