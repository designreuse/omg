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

		//현재 같은프로젝트하는 동료리스트
		$.ajax({
			url : "colist",
			dataType : "json",
			success : function(json) {
				$("#colist").empty();
				var str = "";
				$.each(json, function(index, item) {

					str += "<tr>";
					str += "<td>" + (index + 1) + "</td>";
					str += "<td>" + item.employeeName + "</td>";
					str += "<td>" + item.phone + "</td>";
					str += "<td>" + item.email + "</td>";
					str += "<td>" + item.positionName + "</td>";
					str += "</tr>";

				});

				$("#colist").append(str);
			}
		});

		//현재 투입중인 프로젝트리스트
		$.ajax({

			url : "relist",
			dataType : "json",
			success : function(json) {
				$("#relist").empty();
				var sta = "";
				$.each(json, function(index, item) {

					sta += "<tr>";
					sta += "<th>" + item.projectName + "</th>";
					sta += "<th>" + item.techName + "</th>";
					sta += "<td>" + item.startDate + "</td>";
					sta += "<td>" + item.endDate + "<td>";
					sta += "</tr>";

				});
				$("#relist").append(sta);
			},
			error : function() {
				alert("relist 애러다");
			}

		});

		//과거에 했엇던 프로젝트리스트
		$("#ex").click(function(){
		$.ajax({
			url : "exlist",
			dataType : "json",
			success : function(json) {
				$("#exlist").empty();
				var str = "";
				$.each(json, function(index, item) {
					//index는 012345씩증가한다 item은 json를 하나씩 저장함
					//json에서 index번째를 item에 저장한다는뜻

					str += "<tr>";
					str += "<td>" + item.projectName + "</td>";
					str += "<td>" + item.techName + "</td>";
					str += "<td>" + item.startDate + "</td>";
					str += "<td>" + item.endDate + "<td>";
					str += "</tr>";

				});
				$("#exlist").append(str);
				//list 아래에 str을 위에서 선언한대로 찍는다

			},
			error : function() {
				alert("exlist 에러이다");
			}

		});
		});
		
		//스페어리스트 눌럿을때 ajax 반응하기
		$("#spare").click(function(){
			$.ajax({
				url : "colist",
				dataType : "json",
				success : function(json) {
					$("#colist").empty();
					var str = "";
					$.each(json, function(index, item) {

						str += "<tr>";
						str += "<td>" + (index + 1) + "</td>";
						str += "<td>" + item.employeeName + "</td>";
						str += "<td>" + item.phone + "</td>";
						str += "<td>" + item.email + "</td>";
						str += "<td>" + item.positionName + "</td>";
						str += "</tr>";

					});

					$("#colist").append(str);
				}
			});
			
			$.ajax({
				url:"spare",
				dataType:"json",
				success:function(json) {
					$("#sparelist").empty();
					var str = "";
					$.each(json, function(index, item) {

						str += "<tr>";
						str += "<td>" + (index + 1) + "</td>";
						str += "<td>" + item.employeeName + "</td>";
						str += "<td>" + item.phone + "</td>";
						str += "<td>" + item.email + "</td>";
						str += "<td>" + item.positionName + "</td>";
						str += "</tr>";

					});

					$("#sparelist").append(str);
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
				<h1>유지보수 부서 업무</h1>
				<ol class="breadcrumb">
					<li><a href="/company/notice/index"><i
							class="fa fa-dashboard"></i>Home</a></li>
					<li class="active">유지 보수 업무</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<!-- 세션1개로 통합하기 -->
				<div class="mailbox row">
					<div class="col-xs-12">
						<div class="box box-solid">
							<div class="box-body">
								<div class="row">

									<div class="col-md-2 col-sm-4" id="bnt_window">
										<!--세션나눠주기  -->
										<div class="box-header">
											<!--박스 머리말  -->
											<h3 class="box-title" id="h3">Current
												project</h3>
										</div>
										<div style="margin-top: 15px;">
											<a id="re" class="btn btn-danger btn-flat">Current
												project</a>
										</div>
										<div style="margin-top: 15px;">
											<a id="ex" class="btn btn-warning btn-flat">My Career</a>
										</div>
										
										<div style="margin-top: 15px;">
											<a id="spare" class="btn btn-primary btn-flat">Spare List</a>
										</div>
										
									</div>


									<div id="detailview" class="col-md-10 col-sm-8">
										<div class="box-header">
											<h3 class="box-title">Current Project</h3>
										</div>
										<div class="box-body">

											<div class="table-responsive">	
												<table class="table table-bordered" border="1">
													<thead>
														<tr>
															<th>Project명</th>
															<th>관련 기술</th>
															<th>Start day</th>
															<th>End day</th>
														</tr>
													</thead>
													<tbody id="relist">
													</tbody>
												</table>
											</div>
											<!--테이블 responsive 끝  -->
										</div><!--relist 끝  -->


										<div class="box-header">
											<h3 class="box-title">Colleague</h3>
										</div>
										<div class="box-body">
											<div class="table-responsive">
												<table class="table table-bordered" border="1">
													<thead>
														<tr>
															<th>NO.</th>
															<th>Name</th>
															<th>Phone</th>
															<th>Email</th>
															<th>Position</th>
														</tr>
													</thead>
													<tbody id="colist">
													</tbody>
												</table>
											</div>
										</div><!--colleageu리스트 끝  -->

										<!-- /.box-body -->
										<div class="box-footer clearfix">
											<div class="pull-right"></div>
										</div>
										<!--박스푸터끝  이건넘김 -->


									</div>
								</div>
							</div>
							<!--row 박스나누기끝  -->
						</div>
						<!--박스바디끝  -->
					</div>
					<!-- 미백효과 끝 -->
				</div>
				<!--칼럼12로 나누기 끝  -->


	</section>
	<!--세션끝  -->

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

<script>

/* mycarrer눌렀을때  */
//bnt_window가 부모입장이다 이안에있는 id가 ex인것을 눌렀을때 발동
$("#bnt_window").on("click","#ex",function(){
	$("#detailview").empty();
	$("#h3").text("My Career");
	var ex 	= 		"<div class='box-header'><h3 class='box-title'>My Career</h3></div>"
				   +"<div class='box-body'><div class='table-responsive'>"
			   	   +"<table class='table table-bordered' border='1'>"
			       +"<thead><tr><th>Project명</th>"
				   +"<th>관련 기술</th><th>Start day</th><th>End day</th>"
				   +"</tr></thead><tbody id='exlist'></tbody></table></div></div>";

	$(ex).appendTo($("#detailview"));  
});


	//current project눌럿을때
$("#re").click(function(){
	$(this).attr("href","index"); /*경로를 나타낼 떄 href를 쓰고 갈 위치를 적을것을 뒤에다쓴다  */
});

//인원추가버튼 눌럿을때
$("#bnt_window").on("click","#spare",function() {
	$("#detailview").empty();
	$("#h3").text("Spare List");
	var spare =  "<div class='box-header'><h3 class='box-title'>투입인원</h3></div><div class='box-body'>"
	 			 +"<div class='table-responsive'><table class='table table-bordered' border='1'>"
				 +"<thead><tr><th>NO.</th><th>Name</th><th>Phone</th><th>Email</th><th>Position</th>"
				 +"</tr></thead><tbody id='colist'>"
				 +"</tbody></table></div></div>"



				 +"<div class='box-header'><h3 class='box-title'>sparelist</h3></div><div class='box-body'>"
				 +"<div class='table-responsive'><table class='table table-bordered' border='1'>"
				 +"<thead><tr><th>NO.</th><th>Name</th><th>Phone</th><th>Email</th><th>Position</th>"
				 +"</tr></thead><tbody id='sparelist'>"
				 +"</tbody></table></div></div>";

		$(spare).appendTo($("#detailview")); 
});

</script>

</body>
</html>