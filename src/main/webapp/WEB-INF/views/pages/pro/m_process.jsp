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
		$("#re").click(function() {

			//현재 투입중인 프로젝트리스트
			 $.ajax({
				url : "relist",
				dataType : "json",
				success : function(json) {
					$("#relist").empty();
					var str = "";
					if(json != ""){
					$.each(json, function(index, item) {
						str += "<tr>";
						str += "<td>" + "<a id='colleague' projectId=" +item.projectId+">"+ item.projectName+ "</a></td>";
						str += "<td>" + item.techName + "</td>";
						str += "<td>" + item.startDate + "</td>";
						str += "<td>" + item.endDate + "</td>";
						str += "</tr>";
					
					});
					$("#relist").append(str);
					}else{
						str+="<tr><td colspan='4' style='color: blue;' align='center'>진행중인 프로젝트가 없습니다.</td></tr>";
						$("#relist").append(str);
					}
				}
			});
			
		});

			
			
		
			
			

		//과거에 했엇던 프로젝트리스트
		$("#ex").click(function() {
			$.ajax({
				url : "exlist",
				dataType : "json",
				success : function(json) {
					$("#exlist").empty();
					var str = "";
					if(json != ""){
					$.each(json, function(index, item) {
						str += "<tr>";
						str += "<td>" + item.projectName + "</td>";
						str += "<td>" + item.techName + "</td>";
						str += "<td>" + item.startDate + "</td>";
						str += "<td>" + item.endDate + "</td>";
						str += "</tr>";
					});
					$("#exlist").append(str);
					}else{
						str+="<tr><td colspan='4' style='color: blue;' align='center'>과거에 했엇던 프로젝트리스트가 없습니다.</td></tr>";
						$("#exlist").append(str);
						
					}
				}
			});
		});

		//첫화면 프로젝트 이름이랑 잉여리스트랑 인원투입나오게하기
		$.ajax({
			url : "start",
			dataType : "json",
			success : function(json) {
				$("#startlist").empty();
				var str = "";
				if(json!=""){
				$.each(json, function(index, item) {
					str += "<tr>";
					str += "<td>"
						+ "<a id='open' projectId="+item.projectId+">"
						+ item.projectName + "</td>";
					str += "<td>" + item.startDate + "</td>";
					str += "<td>" + item.endDate + "</td>";
					str += "<td>" + item.price + "</td>";
					str += "<td>" + "<a id='fk' projectId="+item.projectId+">"
						+ "반려" + "</a>" + "</td>";
					str += "</tr>";
				});
				$("#startlist").append(str);
				}else{
					str+="<tr><td colspan='5' style='color: blue;' align='center'>부장에게 받은 프로젝트가 없습니다.</td></tr>";
					$("#startlist").append(str);
				}
			}
		});

		$("#startlist").on("click", "#fk", function() {
			var proId = $(this).attr("projectId");

			$.ajax({
				url : "fk",
				data : "proId=" + proId,
				dataType : "json",
				success : function(json) {

				}
			});

			$(this).attr("href", "index");
		});

		/*프로젝트 받은거 다보여주기  */
		$("#Proing").click(function() {
			$.ajax({
				url : "proing", /* 부장페이지에서의 현재 진행중인 프로젝트 전체 */
				dataType : "json",
				success : function(json) {
					$("#ProingList").empty();
					var str = "";
					if(json!=""){
					$.each(json, function(index, item) {
						str += "<tr>";
						str += "<td>" + item.projectId + "</td>";
						str += "<td>" + item.projectName + "</td>";
						str += "<td>" + item.startDate + "</td>";
						str += "<td>" + item.endDate + "</td>";
						str += "<td>" + item.teamName + "</td>";
						str += "</tr>";
					});
					$("#ProingList").append(str);
					}else{
						str+="<tr><td colspan='5' style='color: blue;' align='center'>수행중인 프로젝트가 없습니다.</td></tr>";
						$("#ProingList").append(str);
					}
				}
			});
		});

		cpview();
		/*부장 일하는거 아작스  */
		function cpview() {
			$.ajax({
				url : "startPro",
				dataType : "json",
				success : function(json) {
					$("#startPro").empty();
					var str = "";
					if(json!=""){
					$.each(json, function(index, item) {
						str += "<tr><input type='hidden' name='projectId' value="+item.projectId+"></tr>";
						str += "<tr>";
						str += "<td>"+ item.projectName+ "</td>";
						str += "<td>" + item.techName+ "</td>";
						str += "<td>" + item.startDate+ "</td>";
						str += "<td>" + item.endDate+ "</td>";
						$.ajax({
							url : "selectTeam",
							dataType : "json",
							async : false,
							success : function(json) {
								str += "<td><select id='selectTeam' name='selectTeam'>";
								$.each(json, function(index,item) {
									str += "<option value="+item.teamId+">"+ item.teamName+ "</option>";
								});
								str += "</select></td>";
							}
						});
						str += "<td><a id='setTeam' class='btn btn-default btn-sm' proId='"+item.projectId+"'>결정</a></td></tr>";
					});
					$("#startPro").append(str);
					}else{
						str+="<tr><td colspan='6' style='color: blue;' align='center'>받은 프로젝트가 없습니다.</td></tr>";
						$("#startPro").append(str);
					}
				}
			});

			$("#starting").click(function() {
				$(this).attr("href", "index"); /*경로를 나타낼 떄 href를 쓰고 갈 위치를 적을것을 뒤에다쓴다  */
			});
		}

		/*setteam 버튼 눌럿을때  */
		$("#detailview").on("click", "#setTeam", function() {
			var projectId = $(this).attr("proId");
			var teamId = $(this).parent().parent().find("#selectTeam").val();

			$.ajax({
				url : "setTeam",
				data : "projectId=" + projectId + "&teamId=" + teamId,
				dataType : "txt",
				async : false,
				success : function(txt) {
				}
			});
			cpview();
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
				<h1>
					<i class="fa fa-th-list"></i>유지보수 부서 업무
				</h1>
				<ol class="breadcrumb">
					<li><a href="/company/dashboard/hello"><i
							class="fa fa-dashboard"></i>Home</a></li>
					<li class="active">유지 보수 업무</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<!-- 세션1개로 통합하기 -->

				<!--부장 페이지일때  -->
				<c:if test="${user.teamId==null}">
					<div class="mailbox row">
						<div class="col-xs-12">
							<div class="box box-solid">
								<div class="box-body">
									<div class="row">
										<div class="col-md-2 col-sm-4" id="bnt_window">
											<div class="box-header">
												<h3 class="box-title" id="h3">
													<b>Booked Project</b>
												</h3>
											</div>
											<div style="margin-top: 15px;">
												<a id="starting" class="btn btn-danger btn-flat">Booked
													Project</a>
											</div>
											<div style="margin-top: 15px;">
												<a id="Proing" class="btn btn-warning btn-flat">Progressing
													Project</a>
											</div>

											<div style="margin-top: 15px;">
												<a id="ex" class="btn btn-primary btn-flat">My Career</a>
											</div>
										</div>
										<div id="detailview" class="col-md-10 col-sm-8">
											<div class="box-header">
												<h3 class="box-title">Start Project</h3>
											</div>
											<div class="box-body">
												<!-- /.col (LEFT) -->
												<!-- /.row -->
												<div class="table-responsive">

													<table class="table table-bordered" border="1">

														<thead>
															<tr>
																<th>Project명</th>
																<th>관련 기술</th>
																<th>Start day</th>
																<th>End day</th>
																<th>Team</th>
																<th>[결정]</th>
															</tr>
														</thead>
														<tbody id="startPro">
														</tbody>
													</table>
												</div>
											</div>
											<div class="box-footer clearfix">
												<div class="pull-right"></div>
											</div>
											<!-- box-footer -->
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</c:if>
				<script>
					$("#bnt_window").on("click","#Proing",function() {
							$("#detailview").empty();
							$("#h3").html("<b>Progressing Project</b>");
							var spare = "<div class='box-header'><h3 class='box-title'>유지보수부의 프로젝트</h3></div><div class='box-body'>"
										+ "<div class='table-responsive'><table class='table table-bordered' border='1'>"
										+ "<thead><tr><th>ProId</th><th>ProName</th><th>Start day</th><th>End day</th><th>TEAM_ID</th>"
										+ "</tr></thead><tbody id='ProingList'>"
										+ "</tbody></table></div></div>";
							$(spare).appendTo($("#detailview"));
					});
				</script>
				<!--팀장페이지일때  -->
				<c:if test="${teamMgr.teamManager==user.employeeId && (teamMgr.teamId=='M01' || teamMgr.teamId=='M02')}">
					<div class="mailbox row">
						<div class="col-xs-12">
							<div class="box box-solid">
								<div class="box-body">
									<div class="row">
										<div class="col-md-2 col-sm-4" id="bnt_window">
											<!--세션나눠주기  -->
											<div class="box-header">
												<!--박스 머리말  -->
												<h3 class="box-title" id="h3">
													<b>New Project</b>
												</h3>
											</div>
											<div style="margin-top: 15px;">
												<a id="spare" class="btn btn-danger btn-flat">New
													Project</a>
											</div>
											<div style="margin-top: 15px;">
												<a id="re" class="btn btn-primary btn-flat">Current
													Project</a>
											</div>
											<div style="margin-top: 15px;">
												<a id="ex" class="btn btn-warning btn-flat">My Career</a>
											</div>
										</div>
										<div id="detailview" class="col-md-10 col-sm-8">
											<div class='box-header'>
												<h3 class='box-title'>New Project</h3>
											</div>
											<div class='box-body'>
												<div class="table-responsive">
													<table class="table table-bordered" border="1">
														<thead>
															<tr>
																<th>프로젝트명</th>
																<th>start date</th>
																<th>end date</th>
																<th>price</th>
																<th>반려</th>
															</tr>
														</thead>
														<tbody id="startlist">
														</tbody>
													</table>
												</div>
											</div>

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
				</c:if>
				
				<!--일반사원 페이지  -->
				<c:if test="${user.teamId!=null && teamMgr.teamManager!=user.employeeId}">
					<div class="mailbox row">
						<div class="col-xs-12">
							<div class="box box-solid">
								<div class="box-body">
									<div class="row">
										<div class="col-md-2 col-sm-4" id="bnt_window">
											<div class="box-header">
												<h3 class="box-title" id="h3">
													<b>Current Project</b>
												</h3>
											</div>
											<div style="margin-top: 15px;">
												<a id="re" class="btn btn-danger btn-flat">Current
													Project</a>
											</div>
											<div style="margin-top: 15px;">
												<a id="ex" class="btn btn-primary btn-flat">My Career</a>
											</div>
										</div>
										<div id="detailview" class="col-md-10 col-sm-8">
											<div class="box-header">
												<h3 class="box-title">Current project</h3>
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
														<tbody id="relist"></tbody>
													</table>
												</div>
											</div>
									
											
											<!--colleageu리스트 끝  -->

											<!-- /.box-body -->
											<div class="box-footer clearfix">
												<div class="pull-right"></div>
											</div>
											<!-- box-footer -->
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:if>
			<script>

					//현재 투입중인 프로젝트리스트
					$.ajax({
						url : "relist",
						dataType : "json",
						success : function(json) {
							$("#relist").empty();
							var str = "";
							if(json != ""){
							$.each(json, function(index, item) {
								
								str += "<tr>";
								str += "<td>" + "<a id='colleague' projectId=" +item.projectId+">"+ item.projectName+ "</a></td>";
								str += "<td>" + item.techName + "</td>";
								str += "<td>" + item.startDate + "</td>";
								str += "<td>" + item.endDate + "</td>";
								str += "</tr>";
								
							});
							$("#relist").append(str);
							}else{
								str+="<tr><td colspan='4' style='color: blue;' align='center'>진행중인 프로젝트가 없습니다.</td></tr>";
								$("#relist").append(str);
							}
						}
					});
					
					
					$("#detailview").on("click","#colleague",function(){
						var proId = $(this).attr("projectId");

						$("#detailview").empty();
						$("#h3").html("<b>Current list</b>");
						var re = "<div class='box-header'><h3 class='box-title'>Current Project</h3></div>"
								+ "<div class='box-body'><div class='table-responsive'>"
								+ "<table class='table table-bordered' border='1'><thead>"
								+ "<tr><th>Project명</th><th>관련 기술</th><th>Start day</th><th>End day</th>"
								+ "</tr></thead><tbody id='relist'></tbody></table></div></div>"
								+ "<div class='box-header'><h3 class='box-title'>Colleague</h3></div>"
								+ "<div class='box-body'><div class='table-responsive'>"
								+ "<table class='table table-bordered' border='1'><thead>"
								+ "<tr><th>NO.</th><th>Name</th><th>Phone</th><th>Email</th><th>Position</th>"
								+ "</tr></thead><tbody id='colist'></tbody></table></div></div>";
								$(re).appendTo($("#detailview"));
					
								//현재 투입중인 프로젝트리스트
								$.ajax({
									url : "relist",
									dataType : "json",
									success : function(json) {
										$("#relist").empty();
										var str = "";
										if(json != ""){
										$.each(json, function(index, item) {
											str += "<tr>";
											str += "<td>" + "<a id='colleague' projectId=" +item.projectId+">"+ item.projectName+ "</a></td>";
											str += "<td>" + item.techName + "</td>";
											str += "<td>" + item.startDate + "</td>";
											str += "<td>" + item.endDate + "</td>";
											str += "</tr>";
											
										});
										$("#relist").append(str);
										}else{
											str+="<tr><td colspan='4' style='color: blue;' align='center'>진행중인 프로젝트가 없습니다.</td></tr>";
											$("#relist").append(str);
										}
									}
								});
								
								
								
					// 동료보기 리스트
						$.ajax({
							
							url : "colist",
							data:"proId="+proId,
							dataType : "json",
							success : function(json) {
								$("#colist").empty();
								var str = "";
								if(json != ""){
								$.each(json, function(index, item) {
									str += "<tr>";
									str += "<td>" + (index + 1) + "</td>";
									str += "<td>" + item.employeeName + "</td>";
									str += "<td>" + item.phone + "</td>";
									str += "<td>" + item.email + "</td>";
									str += "<td>" + item.positionName + "</td>";
									str += "</tr>";
								});
								//"<a id='open' projectId="+item.projectId+">"
								$("#colist").append(str);
								}else{
									str+="<tr><td colspan='5' style='color: blue;' align='center'>동료가 없습니다.</td></tr>";
									$("#colist").append(str);
								}
							}
						});
					
					});
				
				</script>
			</section>
			<!--세션끝  -->

			<!-- /.content -->
		</aside>
		<!-- /.right-side -->
	</div>
	<!-- ./wrapper -->

	<script	src="//ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"
		type="text/javascript"></script>
	<!-- AdminLTE App -->
	<script src="/company/resources/js/AdminLTE/app.js"
		type="text/javascript"></script>
	<script>
		/* mycarrer눌렀을때  */
		//bnt_window가 부모입장이다 이안에있는 id가 ex인것을 눌렀을때 발동
		$("#bnt_window").on("click","#ex",function() {
			$("#detailview").empty();
			$("#h3").html("<b>My Career</b>");
			var ex = "<div class='box-header'><h3 class='box-title'>My Career</h3></div>"
					+ "<div class='box-body'><div class='table-responsive'>"
					+ "<table class='table table-bordered' border='1'>"
					+ "<thead><tr><th>Project명</th>"
					+ "<th>관련 기술</th><th>Start day</th><th>End day</th>"
					+ "</tr></thead><tbody id='exlist'></tbody></table></div></div>";
			$(ex).appendTo($("#detailview"));
		});

		//current project눌럿을때
		$("#spare").click(function() {
			$(this).attr("href", "index"); /*경로를 나타낼 떄 href를 쓰고 갈 위치를 적을것을 뒤에다쓴다  */
		});

		//팀장 current list 화면처음
		$("#bnt_window").on("click","#re",function() {
			$("#detailview").empty();
			$("#h3").html("<b>Current list</b>");
			var re = "<div class='box-header'><h3 class='box-title'>Current Project</h3></div>"
					+ "<div class='box-body'><div class='table-responsive'>"
					+ "<table class='table table-bordered' border='1'><thead>"
					+ "<tr><th>Project명</th><th>관련 기술</th><th>Start day</th><th>End day</th>"
					+ "</tr></thead><tbody id='relist'></tbody></table></div></div>";

			
			$(re).appendTo($("#detailview"));
		});

		$("#detailview").on("click","#colleague",function(){
			$("#detailview").empty();

			var proId = $(this).attr("projectId");

		
			$("#h3").html("<b>Current list</b>");
			var re = "<div class='box-header'><h3 class='box-title'>Current Project</h3></div>"
					+ "<div class='box-body'><div class='table-responsive'>"
					+ "<table class='table table-bordered' border='1'><thead>"
					+ "<tr><th>Project명</th><th>관련 기술</th><th>Start day</th><th>End day</th>"
					+ "</tr></thead><tbody id='relist'></tbody></table></div></div>"
					+ "<div class='box-header'><h3 class='box-title'>Colleague</h3></div>"
					+ "<div class='box-body'><div class='table-responsive'>"
					+ "<table class='table table-bordered' border='1'><thead>"
					+ "<tr><th>NO.</th><th>Name</th><th>Phone</th><th>Email</th><th>Position</th>"
					+ "</tr></thead><tbody id='colist'></tbody></table></div></div>";
					$(re).appendTo($("#detailview"));
		
					//현재 투입중인 프로젝트리스트
					$.ajax({
						url : "relist",
						dataType : "json",
						success : function(json) {
							$("#relist").empty();
							var str = "";
							if(json != ""){
							$.each(json, function(index, item) {
								str += "<tr>";
								str += "<td>" + "<a id='colleague' projectId=" +item.projectId+">"+ item.projectName+ "</a></td>";
								str += "<td>" + item.techName + "</td>";
								str += "<td>" + item.startDate + "</td>";
								str += "<td>" + item.endDate + "</td>";
								str += "</tr>";
							
							});
							$("#relist").append(str);
							}else{
								str+="<tr><td colspan='4' style='color: blue;' align='center'>진행중인 프로젝트가 없습니다.</td></tr>";
								$("#relist").append(str);
							}
						}
					});
					
					
					
		// 동료보기 리스트
			$.ajax({
				
				url : "colist",
				data:"proId="+proId,
				dataType : "json",
				success : function(json) {
					$("#colist").empty();
					var str = "";
					if(json != ""){
					$.each(json, function(index, item) {
						str += "<tr>";
						str += "<td>" + (index + 1) + "</td>";
						str += "<td>" + item.employeeName + "</td>";
						str += "<td>" + item.phone + "</td>";
						str += "<td>" + item.email + "</td>";
						str += "<td>" + item.positionName + "</td>";
						str += "</tr>";
					});
					//"<a id='open' projectId="+item.projectId+">"
					$("#colist").append(str);
					}else{
						str+="<tr><td colspan='5' style='color: blue;' align='center'>동료가 없습니다.</td></tr>";
						$("#colist").append(str);
					}
				}
			});
		
		});
		
		
		
		
		
		
		
		
		$("#startlist").on("click","#open",function() {
			var proId = $(this).attr("projectId");
			$("#detailview").empty();
			$("#h3").html("<b>New Project</b>");

			var st = "<div class='box-header'><h3 class='box-title'>New Project</h3></div>"
					+ "<div class='box-body'><div class='table-responsive'>"
					+ "<table class='table table-bordered' border='1'><thead>"
					+ "<tr><th>프로젝트명</th><th>start date</th><th>end date</th>"
					+ "<th>price</th></tr></thead><tbody id='viewlist'>"
					+ "</tbody></table></div></div>"

					+ "<div class='box-header'><h3 class='box-title'>Insert People</h3>"
					+ "</div><div class='box-body'><div class='table-responsive'>"
					+ "<table class='table table-bordered' border='1'><thead>"
					+ "<tr><th>NO.</th><th>Name</th><th>Phone</th><th>Email</th>"
					+ "<th>Position</th><th>제거</th></tr></thead><tbody id='putlist'>"
					+ "</tbody></table></div></div>"

					+ "<div class='box-header'><h3 class='box-title'>Team List</h3>"
					+ "</div><div class='box-body'><div class='table-responsive'>"
					+ "<table class='table table-bordered' border='1'>"
					+ "<thead><tr><th>NO.</th><th>Name</th><th>Phone</th>"
					+ "<th>Email</th><th>Position</th><th>추가</th></tr>"
					+ "</thead><tbody id='sparelist'></tbody></table>"
					+ "</div></div>";

			$(st).appendTo($("#detailview"));

			$.ajax({
				url : "view",
				data : "proId=" + proId,
				dataType : "json",
				success : function(json) {
					$("#viewlist").empty();
					var str = "";
					if(json!=""){
					$.each(json, function(index, item) {
						str += "<tr><td>" + item.projectName+ "</td>";
						str += "<td>" + item.startDate+ "</td>";
						str += "<td>" + item.endDate + "</td>";
						str += "<td>" + item.price + "</td></tr>";
					});

					$("#viewlist").append(str);
					}else{
						str+="<tr><td colspan='4' style='color: blue;' align='center'>부장에게 받은 프로젝트가 없습니다.</td></tr>";
						$("#viewlist").append(str);
					}
				}
			});

			$.ajax({
				url : "put",
				dataType : "json",
				data : "projectId=" + proId, //"projectId"에는 컨트롤러에 들어갈이름 ajax에는 뒤에꺼 proId
				success : function(json) {
					$("#putlist").empty();
					var str = "";
					if(json!=""){
					$.each(json,function(index,item) {
						str += "<tr><td>"+ (index + 1)+ "</td>";
						str += "<td>"+ item.employeeName+ "</td>";
						str += "<td>"+ item.phone+ "</td>";
						str += "<td>"+ item.email+ "</td>";
						str += "<td>"+ item.positionName+ "</td>";
						str += "<td><a id='delete' class='btn btn-default btn-sm' empId='"+item.employeeId+"' proId ='"+proId+"'>제거</a></td></tr>";
					});

					$("#putlist").append(str);
					}else{
						str+="<tr><td colspan='6' style='color: blue;' align='center'>투입된 인원이 없습니다.</td></tr>";
						$("#putlist").append(str);
					}
				}
			});

			//spare 리스트부분 ajax
			$.ajax({
				url : "spare",
				data : "proId=" + proId,
				dataType : "json",
				success : function(json) {
					$("#sparelist").empty();
					var str = "";
					if(json!=""){
					$.each(json,function(index,item) {
						str += "<tr><td>"+ (index + 1)+ "</td>";
						str += "<td>"+ item.employeeName+ "</td>";
						str += "<td>"+ item.phone+ "</td>";
						if (item.email == null) {
							str += "<td>-</td>";
						} else {
							str += "<td>"+ item.email+ "</td>";
						}
						str += "<td>"+ item.positionName+ "</td>";
							
						/* str += "<td>" + "<input type='hidden' value='"+item.employeeId+"' name='empId'><input type='hidden' value='"+proId+"' name='proId'>" +"</td>"; */
						str += "<td><a id='setpeople' class='btn btn-default btn-sm' empId='"+item.employeeId+"' proId ='"+proId+"'>결정</a></td></tr>";
					});
					$("#sparelist").append(str);
					}else{
						str+="<tr><td colspan='6' style='color: blue;' align='center'>추가할 인원이 없습니다.</td></tr>";
						$("#sparelist").append(str);
					}
				}
			});
		});

		//프로젝트 투입인원리스트에서 제거 눌럿을때
		$("#detailview").on("click","#delete",function() {
			var empId = $(this).attr("empId");
			var proId = $(this).attr("proId");

			$.ajax({
				url : "delete",
				data : "empId=" + empId + "&proId=" + proId,
				dataType : "json",
				success : function(json) {
				}
			});

			$("#detailview").empty();
			$("#h3").html("<b>New Project</b>");

			var st = "<div class='box-header'><h3 class='box-title'>New Project</h3></div>"
					+ "<div class='box-body'><div class='table-responsive'>"
					+ "<table class='table table-bordered' border='1'><thead>"
					+ "<tr><th>프로젝트명</th><th>start date</th><th>end date</th>"
					+ "<th>price</th></tr></thead><tbody id='viewlist'>"
					+ "</tbody></table></div></div>"

					+ "<div class='box-header'><h3 class='box-title'>Insert People</h3>"
					+ "</div><div class='box-body'><div class='table-responsive'>"
					+ "<table class='table table-bordered' border='1'><thead>"
					+ "<tr><th>NO.</th><th>Name</th><th>Phone</th><th>Email</th>"
					+ "<th>Position</th><th>제거</th></tr></thead><tbody id='putlist'>"
					+ "</tbody></table></div></div>"

					+ "<div class='box-header'><h3 class='box-title'>Team List</h3>"
					+ "</div><div class='box-body'><div class='table-responsive'>"
					+ "<table class='table table-bordered' border='1'>"
					+ "<thead><tr><th>NO.</th><th>Name</th><th>Phone</th>"
					+ "<th>Email</th><th>Position</th><th>추가</th></tr>"
					+ "</thead><tbody id='sparelist'></tbody></table>"
					+ "</div></div>";

			$(st).appendTo($("#detailview"));

			$.ajax({
				url : "view",
				data : "proId=" + proId,
				dataType : "json",
				success : function(json) {
					$("#viewlist").empty();
					var str = "";
					if(json!=""){
					$.each(json, function(index, item) {
						str += "<tr><td>" + item.projectName+ "</td>";
						str += "<td>" + item.startDate+ "</td>";
						str += "<td>" + item.endDate + "</td>";
						str += "<td>" + item.price + "</td></tr>";
					});

					$("#viewlist").append(str);
					}else{
						str+="<tr><td colspan='4' style='color: blue;' align='center'>부장에게 받은 프로젝트가 없습니다.</td></tr>";
						$("#viewlist").append(str);
					}
				}
			});

			$.ajax({
				url : "put",
				dataType : "json",
				data : "projectId=" + proId, //"projectId"에는 컨트롤러에 들어갈이름 ajax에는 뒤에꺼 proId
				success : function(json) {
					$("#putlist").empty();
					var str = "";
					if(json!=""){
					$.each(json,function(index,item) {
						str += "<tr><td>"+ (index + 1)+ "</td>";
						str += "<td>"+ item.employeeName+ "</td>";
						str += "<td>"+ item.phone+ "</td>";
						str += "<td>"+ item.email+ "</td>";
						str += "<td>"+ item.positionName+ "</td>";
						str += "<td><a id='delete' class='btn btn-default btn-sm' empId='"+item.employeeId+"' proId ='"+proId+"'>제거</a></td></tr>";
					});

					$("#putlist").append(str);
					}else{
						str+="<tr><td colspan='6' style='color: blue;' align='center'>투입된 인원이 없습니다.</td></tr>";
						$("#putlist").append(str);
					}
				}
			});

			//spare 리스트부분 ajax
			$.ajax({
				url : "spare",
				data : "proId=" + proId,
				dataType : "json",
				success : function(json) {
					$("#sparelist").empty();
					var str = "";
					if(json!=""){
					$.each(json,function(index,item) {
						str += "<tr><td>"+ (index + 1)+ "</td>";
						str += "<td>"+ item.employeeName+ "</td>";
						str += "<td>"+ item.phone+ "</td>";
						if (item.email == null) {
							str += "<td>-</td>";
						} else {
							str += "<td>"+ item.email+ "</td>";
						}
						str += "<td>"+ item.positionName+ "</td>";

						/* str += "<td>" + "<input type='hidden' value='"+item.employeeId+"' name='empId'><input type='hidden' value='"+proId+"' name='proId'>" +"</td>"; */
						str += "<td><a id='setpeople' class='btn btn-default btn-sm' empId='"+item.employeeId+"' proId ='"+proId+"'>결정</a></td></tr>";
					});
					$("#sparelist").append(str);
					}else{
						str+="<tr><td colspan='6' style='color: blue;' align='center'>추가할 인원이 없습니다.</td></tr>";
						$("#sparelist").append(str);
					}
				}
			});

						});

		//잉여리스트에서 추가 눌렀을때
		$("#detailview").on("click","#setpeople",function() {
			var empId = $(this).attr("empId");
			var proId = $(this).attr("proId");

			$.ajax({
				url : "setpeople",
				data : "empId=" + empId + "&proId=" + proId,
				dataType : "json",
				async : false,
				success : function(json) {
				}
			});
	
			$("#detailview").empty();
			$("#h3").html("<b>New Project</b>");

			var st = "<div class='box-header'><h3 class='box-title'>New Project</h3></div>"
					+ "<div class='box-body'><div class='table-responsive'>"
					+ "<table class='table table-bordered' border='1'><thead>"
					+ "<tr><th>프로젝트명</th><th>start date</th><th>end date</th>"
					+ "<th>price</th></tr></thead><tbody id='viewlist'>"
					+ "</tbody></table></div></div>"

					+ "<div class='box-header'><h3 class='box-title'>Insert People</h3>"
					+ "</div><div class='box-body'><div class='table-responsive'>"
					+ "<table class='table table-bordered' border='1'><thead>"
					+ "<tr><th>NO.</th><th>Name</th><th>Phone</th><th>Email</th>"
					+ "<th>Position</th><th>제거</th></tr></thead><tbody id='putlist'>"
					+ "</tbody></table></div></div>"

					+ "<div class='box-header'><h3 class='box-title'>Team List</h3>"
					+ "</div><div class='box-body'><div class='table-responsive'>"
					+ "<table class='table table-bordered' border='1'>"
					+ "<thead><tr><th>NO.</th><th>Name</th><th>Phone</th>"
					+ "<th>Email</th><th>Position</th><th>추가</th></tr>"
					+ "</thead><tbody id='sparelist'></tbody></table>"
					+ "</div></div>";
			$(st).appendTo($("#detailview"));

			$.ajax({
				url : "view",
				data : "proId=" + proId,
				dataType : "json",
				success : function(json) {
					$("#viewlist").empty();
					var str = "";
					if(json!=""){
					$.each(json, function(index, item) {
						str += "<tr><td>" + item.projectName+ "</td>";
						str += "<td>" + item.startDate+ "</td>";
						str += "<td>" + item.endDate + "</td>";
						str += "<td>" + item.price + "</td></tr>";
					});
					$("#viewlist").append(str);
					}else{
						str+="<tr><td colspan='4' style='color: blue;' align='center'>부장에게 받은 프로젝트가 없습니다.</td></tr>";
						$("#viewlist").append(str);
					}
				}
			});

			$.ajax({
				url : "put",
				dataType : "json",
				data : "projectId=" + proId, //"projectId"에는 컨트롤러에 들어갈이름 ajax에는 뒤에꺼 proId
				success : function(json) {
					$("#putlist").empty();
					var str = "";
					if(json!=""){
					$.each(json,function(index,item) {
						str += "<tr><td>"+ (index + 1)+ "</td>";
						str += "<td>"+ item.employeeName+ "</td>";
						str += "<td>"+ item.phone+ "</td>";
						str += "<td>"+ item.email+ "</td>";
						str += "<td>"+ item.positionName+ "</td>";
						str += "<td><a id='delete' class='btn btn-default btn-sm' empId='"+item.employeeId+"' proId ='"+proId+"'>제거</a></td></tr>";
					});
					$("#putlist").append(str);
					}else{
						str+="<tr><td colspan='6' style='color: blue;' align='center'>투입된 인원이 없습니다.</td></tr>";
						$("#putlist").append(str);
					}
				}
			});

			//spare 리스트부분 ajax
			$.ajax({
				url : "spare",
				data : "proId=" + proId,
				dataType : "json",
				success : function(json) {
					$("#sparelist").empty();
					var str = "";
					if(json!=""){
					$.each(json,function(index,item) {
						str += "<tr><td>"+ (index + 1)+ "</td>";
						str += "<td>"+ item.employeeName+ "</td>";
						str += "<td>"+ item.phone+ "</td>";
						if (item.email == null) {
							str += "<td>-</td>";
						} else {
							str += "<td>"+ item.email+ "</td>";
						}
						str += "<td>"+ item.positionName+ "</td>";

						/* str += "<td>" + "<input type='hidden' value='"+item.employeeId+"' name='empId'><input type='hidden' value='"+proId+"' name='proId'>" +"</td>"; */
						str += "<td><a id='setpeople' class='btn btn-default btn-sm' empId='"+item.employeeId+"' proId ='"+proId+"'>결정</a></td></tr>";
					});
					$("#sparelist").append(str);
					}else{
						str+="<tr><td colspan='6' style='color: blue;' align='center'>추가할 인원이 없습니다.</td></tr>";
						$("#sparelist").append(str);
					}
				}
			});
		});
	</script>
</body>
</html>
