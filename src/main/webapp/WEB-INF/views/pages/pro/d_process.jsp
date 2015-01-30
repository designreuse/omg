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
		$("#ex").click(function() {
			$.ajax({
				url : "proList",
				dataType : "json",
				success : function(json) {
					$("#proList").empty();
					var str = "";
					$.each(json, function(index, item) {
						str += "<tr>";
						str += "<td>" + item.projectName + "</td>";
						str += "<td>" + item.techName + "</td>";
						str += "<td>" + item.startDate + "</td>";
						str += "<td>" + item.endDate + "</td>";
						str += "</tr>";
					});
					$("#proList").append(str);
				}
			});
		});
		$("#SCV").click(function() {

			$.ajax({
				url : "SCVList",
				dataType : "json",
				success : function(json) {
					$("#SCVList").empty();
					var str = "";
					$.each(json, function(index, item) {
						str += "<tr>";
						str += "<td>" + item.name + "</td>";
						str += "<td>" + item.phone + "</td>";
						str += "<td>" + item.email + "</td>";
						str += "<td>" + item.positionName + "</td>";
						str += "<td>" + item.teamName + "</td>";
						str += "</tr>";
					});
					$("#SCVList").append(str);
				}
			});
		});

		$.ajax({
			url : "dPro",
			dataType : "json",
			success : function(json) {
				$("#dPro").empty();
				var str = "";
				str += "<tr>";
				str += "<td>" + json.projectName + "</td>";
				str += "<td>" + json.techName + "</td>";
				str += "<td>" + json.startDate + "</td>";
				str += "<td>" + json.endDate + "</td>";
				str += "</tr>";
				$("#dPro").append(str);
			}
		});

		$.ajax({
			url : "ListColleague",
			dataType : "json",
			async : false,
			success : function(json) {
				$("#ListColleague").empty();
				var str = "";
				$.each(json, function(index, item) {
					str += "<tr>";
					str += "<td>" + item.name + "</td>";
					str += "<td>" + item.phone + "</td>";
					str += "<td>" + item.email + "</td>";
					str += "<td>" + item.positionName + "</td>";
					str += "</tr>";
				});
				$("#ListColleague").append(str);
			}
		});

		$
				.ajax({
					url : "startPro",
					dataType : "json",
					success : function(json) {
						$("#startPro").empty();
						var str = "";
						$
								.each(
										json,
										function(index, item) {
											str += "<tr><input type='hidden' name='projectId' value="+item.projectId+"></tr>"
											str += "<tr>";
											str += "<td>" + item.projectName
													+ "</td>";
											str += "<td>" + item.techName
													+ "</td>";
											str += "<td>" + item.startDate
													+ "</td>";
											str += "<td>" + item.endDate
													+ "</td>";
											$
													.ajax({
														url : "selectTeam",
														dataType : "json",
														async : false,
														success : function(json) {
															str += "<td><select name='selectTeam'>";
															$
																	.each(
																			json,
																			function(
																					index,
																					item) {
																				str += "<option value="+item.teamId+">"
																						+ item.teamName
																						+ "</option>";
																			});
															str += "</select></td>";
														}
													});
											str += "<td>"
													+ "<input type='submit'  value='결정'>"
													+ "</td>";
											str += "</tr>";
										});
						$("#startPro").append(str);
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
				<h1>개발 부서 업무</h1>
				<ol class="breadcrumb">
					<li><a href="/company/notice/index"><i
							class="fa fa-dashboard"></i>Home</a></li>
					<li class="active">개발 부서 업무</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">

				<c:if test="${user.teamId==null}">
					<div class="mailbox row">
						<div class="col-xs-12">
							<div class="box box-solid">
								<div class="box-body">
									<div class="row">
										<div class="col-md-2 col-sm-4" id="bnt_window">
											<div class="box-header">
												<h3 class="box-title" id="h3">Start Projects</h3>
											</div>
											<div style="margin-top: 15px;">
												<a id="Start" class="btn btn-danger btn-flat">Start
													project</a>
											</div>
											<div style="margin-top: 15px;">
												<a id="SCV" class="btn btn-warning btn-flat">SCV</a>
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
													<form action="setTeam">
														<table id="gode" class="table table-hover">

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
													</form>
												</div>
											</div>




											<!-- /.col (RIGHT) -->
											<!-- /.row -->

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
					$("#bnt_window")
							.on(
									"click",
									"#ex",
									function() {
										$("#detailview").empty();
										$("#h3").text("My Career");
										var ex = "<div class='box-header'><h3 class='box-title'>My Career</h3></div>"
												+ "<div class='box-body'><div class='table-responsive'>"
												+ "<table class='table table-bordered' border='1'>"
												+ "<thead><tr><th>Project명</th>"
												+ "<th>관련 기술</th><th>Start day</th><th>End day</th>"
												+ "</tr></thead><tbody id='proList'></tbody></table></div></div>";
										$(ex).appendTo($("#detailview"));
									});

					//current project눌럿을때
					$("#Start").click(function() {
						$(this).attr("href", "index"); /*경로를 나타낼 떄 href를 쓰고 갈 위치를 적을것을 뒤에다쓴다  */
					});

					$("#bnt_window")
							.on(
									"click",
									"#SCV",
									function() {

										$("#detailview").empty();
										$("#h3").text("SCV");
										var spare = "<div class='box-header'><h3 class='box-title'>SCV</h3></div><div class='box-body'>"
												+ "<div class='table-responsive'><table class='table table-bordered' border='1'>"
												+ "<thead><tr><th>Name</th><th>Phone</th><th>Email</th><th>Position</th><th>Team</th>"
												+ "</tr></thead><tbody id='SCVList'>"
												+ "</tbody></table></div></div>";
										$(spare).appendTo($("#detailview"));
									});
				</script>
			</section>


			<section class="content">
				<c:if test="${user.teamId!=null}">
					<div class="mailbox row">
						<div class="col-xs-12">
							<div class="box box-solid">
								<div class="box-body">
									<div class="row">
										<div class="col-md-2 col-sm-4" id="bnt_window">
											<div class="box-header">
												<h3 class="box-title" id="h3">Current project</h3>
											</div>
											<div style="margin-top: 15px;">
												<a id="Current" class="btn btn-danger btn-flat">Current
													project</a>
											</div>
											<div style="margin-top: 15px;">
												<a id="Coll" class="btn btn-warning btn-flat">Colleague</a>
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
													<table id="gode" class="table table-hover">

														<thead>
															<tr>
																<th>Project명</th>
																<th>관련 기술</th>
																<th>Start day</th>
																<th>End day</th>
															</tr>
														</thead>
														<tbody id="dPro">
														</tbody>


													</table>
												</div>
											</div>

										</div>
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
				</c:if>
				<script>
					$("#bnt_window")
							.on(
									"click",
									"#ex",
									function() {
										$("#detailview").empty();
										$("#h3").text("Current project");
										var ex = "<div class='box-header'><h3 class='box-title'>My Career</h3></div>"
												+ "<div class='box-body'><div class='table-responsive'>"
												+ "<table class='table table-bordered' border='1'>"
												+ "<thead><tr><th>Project명</th>"
												+ "<th>관련 기술</th><th>Start day</th><th>End day</th>"
												+ "</tr></thead><tbody id='proList'></tbody></table></div></div>";
										$(ex).appendTo($("#detailview"));
									});

					//current project눌럿을때
					$("#Start").click(function() {
						$(this).attr("href", "index"); /*경로를 나타낼 떄 href를 쓰고 갈 위치를 적을것을 뒤에다쓴다  */
					});

					$("#bnt_window")
							.on(
									"click",
									"#SCV",
									function() {

										$("#detailview").empty();
										$("#h3").text("SCV");
										var spare = "<div class='box-header'><h3 class='box-title'>SCV</h3></div><div class='box-body'>"
												+ "<div class='table-responsive'><table class='table table-bordered' border='1'>"
												+ "<thead><tr><th>Name</th><th>Phone</th><th>Email</th><th>Position</th><th>Team</th>"
												+ "</tr></thead><tbody id='SCVList'>"
												+ "</tbody></table></div></div>";
										$(spare).appendTo($("#detailview"));
									});
				</script>
			</section>








			<!-- Main content -->
			<section class="content">

				<c:if test="${user.teamId!=null}">
					<div class="box box-solid">
						<div class="box-header">
							<h3 class="box-title">Colleague</h3>
						</div>
						<div class="box-body">


							<!-- /.col (LEFT) -->


							<!-- /.row -->
							<div class="table-responsive">
								<table id="gode" class="table table-hover">

									<thead>
										<tr>
											<th>Name</th>
											<th>Phone</th>
											<th>Email</th>
											<th>Position</th>
										</tr>
									</thead>
									<tbody id="ListColleague">
									</tbody>
								</table>
							</div>


							<!-- /.col (RIGHT) -->
							<!-- /.row -->
						</div>
						<!-- /.box-body -->
						<div class="box-footer clearfix">
							<div class="pull-right"></div>
						</div>
						<!-- box-footer -->
					</div>
				</c:if>
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

