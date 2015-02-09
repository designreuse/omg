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
		listck = 'O';
		var button ="<button id='nextasc' class='btn btn-sm btn-default disabled'><-</i></button>"+
					"<button id='nextdesc' class='btn btn-sm btn-default disabled'>-></i></button>";
		$("#buttoncontroll").append(button);
		empInFoList(startpage,listck);
		function empInFoList(startpage,dept) {
			$("#datalist").empty();
			$.ajax({
				url : "select", // select 경로로 보내기
				dataType : "json", // json으로 받는다
				data : "page="+startpage+"&dept="+dept, // 값을 임으로 만들어서 넘김
				async: false,
				success : function(json) {
					$.each(json, function(index, item) { // foreach해줌 
						var td = "<td>" + item.name + "</td>" + "<td>"
								+ item.phone + "</td>" + "<td>"
								+ item.address + "</td>" + "<td>";
								if(item.email == null){
									td +=  "-</td>" + "<td>";
								}else{
									td += item.email + "</td>" + "<td>";
								}
							td += item.posName + "</td>" + "<td>"
								+ item.teamName + "</td>" + "<td>"
								+ item.hiredate + "</td>" + "<td>";
								if(item.birth == null){
									td += "-</td>";
								}else{
									td += item.birth + "</td>";
								}
						$("<tr>" + td + "</tr>").appendTo($("#datalist")); // 만듬
					});
				}
			});
			$.ajax({					// ProjectList 페이지 총페이지수 구하기
				url: "total" ,
				dataType: "text",
				data : "dept="+dept,
				async: false,
				success : function(text) {
					endpage = parseInt(((text-1) / 10) + 1);
					if(text > 10){
						$("#page").text(startpage);
						$("#total").text(endpage);
						$("#nextasc").addClass("disabled");
						$("#nextdesc").removeClass("disabled");
					}else{
						$("#page").text(1);
						$("#total").text(1);
						$("#nextasc").addClass("disabled");
						$("#nextdesc").addClass("disabled");
					}
				}
			});
		}
		
		$("#open").click(function() {
			startpage = 1;
			endpage = 0;
			listck = 'O';
			$("#empTitle").empty();
			$("#empTitle").text("인원조회");
			$("#datalist").empty();			
			empInFoList(startpage,listck);
		});
		
		$("#develop").click(function() {
			startpage = 1;
			endpage = 0;
			listck = 'D';
			$("#empTitle").empty();
			$("#empTitle").text("개발 부서 인원");
			$("#datalist").empty();			 // 안에있는 내용 삭제
			empInFoList(startpage,listck);
		});
		
		$("#maintenance").click(function() {
			startpage = 1;
			endpage = 0;
			listck = 'M';
			$("#empTitle").empty();
			$("#empTitle").text("유지 보수 부서 인원");
			$("#datalist").empty();
			empInFoList(startpage,listck);
		});
		
		$("#run").click(function() {
			startpage = 1;
			endpage = 0;
			listck = 'R';
			$("#empTitle").empty();
			$("#empTitle").text("경영 부서 인원");
			$("#datalist").empty();
			empInFoList(startpage,listck);
		});
		
		// < 버튼 눌림
		$("#buttoncontroll").on("click","#nextasc",function() {
			startpage--;
			if(startpage >= 1){
				empInFoList(startpage,listck);
				$("#page").text(startpage);
				$("#nextdesc").removeClass("disabled");
				$("#nextasc").removeClass("disabled");
				if(startpage == 1){
					$("#nextasc").addClass("disabled");
				}
			}else{
				startpage++;
			}
		});
		
		
		// > 버튼 눌림	
		$("#buttoncontroll").on("click","#nextdesc",function() {
			startpage++;
			if(startpage <= endpage){
				empInFoList(startpage,listck);
				$("#page").text(startpage);
				$("#nextasc").removeClass("disabled");
				$("#nextdesc").removeClass("disabled");
				if(startpage == endpage){
					$("#nextdesc").addClass("disabled");
				}
			}else{
				startpage--;
			}
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
				<h1><i class="fa  fa-users"></i>직원조회</h1>
				<ol class="breadcrumb">
					<li><a href="/company/dashboard/hello"><i
							class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">직원조회</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="mailbox row">
					<div class="col-xs-12">
						<div class="box box-solid">
							<div class="box-body">
								<div class="row">
									<div style="margin: 20px;">
										<h1 id="empTitle" style="float: left; font-weight: bold;">인원조회</h1>
									</div>
									<span style="float: right !important; margin: 10px;">
										<button id="open" class="btn btn-default btn-flat">전체</button>
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
							<div class="box-footer clearfix">
								<div id="buttoncontroll" class="pull-right">
									<span id="page"></span>/<span id="total"></span>
									<span id="buttoncontroll">
									</span>
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
</body>
</html>
