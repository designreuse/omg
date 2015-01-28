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

											str += "<tr>";
											str += "<td>" + item.projectName
													+ "</td>";
											str += "<td>" + item.techName
													+ "</td>";
											str += "<td>" + item.startDate
													+ "</td>";
											str += "<td>" + item.endDate
													+ "</td>";
											str += "<div >"
													+ "<td>"
													+ "<select name='SelectTeam'><option>D01</option><option>D02</option><option>D03</option><option>D04</option></select>"
													+ "</td>" + "</div>";
											str += "<td>"
													+ "<input type='button' value='결정'>"
													+ "<input type='button' value='수정'>"
													+ "</td>";
											str += "</tr>";

										});
						$("#startPro").append(str);
					}
				});

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
					str += "<td>" + item.teamId + "</td>";
					str += "<div>" + "<td>"
							+ "<input type='button' value='투입' name='투입'>"
							+ "</td>" + "</div>";
					str += "</tr>";

				});
				$("#SCVList").append(str);
			}
		});

	})
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
					
						
						
							<div class="box box-solid">
								<div class="box-header">
									<h3 class="box-title">Start Projects</h3>
								</div>
								<div class="box-body">
								<div class="row">



									<!-- /.col (LEFT) -->

									<!-- /.row -->
									<div class="table-responsive">
										<table id="gode" class="table table-hover">

											<thead>
												<tr>
													<th>Project명</th>
													<th>관련 기술</th>
													<th>Start day</th>
													<th>End day</th>
													<th>Team</th>
													<th>[결정/수정]</th>
												</tr>
											</thead>
											<tbody id="startPro">
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
						</div>
				</c:if>
				<%-- <c:if test="${}"> --%>
				<c:if test="${user.teamId==null}">
					<div class="box box-solid">
						<div class="box-header">
							<h3 class="box-title">SCV</h3>
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
												<th>Team</th>
												<th>Register</th>
											</tr>
										</thead>
										<tbody id="SCVList">
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
				<%-- </c:if> --%>



				<c:if test="${user.teamId!=null}">
					<div class="box box-solid">
						<div class="box-header">
							<h3 class="box-title">Current Project</h3>
						</div>
						<div class="box-body">


							<!-- /.col (LEFT) -->

							<!-- /.row -->
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

			<!-- Main content -->
			<section class="content">

				<c:if test="${user.teamId!=null}">
					<div class="box box-solid">
						<div class="box-header">
							<h3 class="box-title">Colleague</h3>
						</div>
						<div class="box-body">
							<div class="row">

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
							</div>
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

			<section class="content">


				<div class="box box-solid">
					<div class="box-header">
						<h3 class="box-title">My Career</h3>
					</div>
					<div class="box-body">
						<div class="row">

							<!-- /.col (LEFT) -->


							<!-- /.row -->
							<div class="table-responsive">
								<table id="gode" class="table table-hover">
									<thead>
										<tr>
											<!-- <th>NO.</th> -->
											<th>Project명</th>
											<th>관련 기술</th>
											<th>Start day</th>
											<th>End day</th>
										</tr>
									</thead>

									<tbody id="proList">
									</tbody>
								</table>
							</div>


							<!-- /.col (RIGHT) -->
						</div>
						<!-- /.row -->
					</div>
					<!-- /.box-body -->
					<div class="box-footer clearfix">
						<div class="pull-right"></div>
					</div>
					<!-- box-footer -->
				</div>
				<!-- /.box -->

				<!-- /.col (MAIN) -->

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

</body>
</html>

