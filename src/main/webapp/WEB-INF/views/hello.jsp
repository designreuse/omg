<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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
<!-- jvectormap -->
<link
	href="/company/resources/css/jvectormap/jquery-jvectormap-1.2.2.css"
	rel="stylesheet" type="text/css" />
<!-- Date Picker -->
<link href="/company/resources/css/datepicker/datepicker3.css"
	rel="stylesheet" type="text/css" />
<!-- Daterange picker -->
<link
	href="/company/resources/css/daterangepicker/daterangepicker-bs3.css"
	rel="stylesheet" type="text/css" />
<!-- bootstrap wysihtml5 - text editor -->
<link
	href="/company/resources/css/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css"
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
				<h1>
					<i class="fa  fa-twitch"></i>인사말
				</h1>
				<ol class="breadcrumb">
					<li><a href="/company/hello"><i class="fa fa-dashboard"></i>
							Home</a></li>

				</ol>
			</section>

			<section>
				<div class="col-xs-12">
					<div style="margin: 15px">
						<div class="row">
							<div class="col-lg-3 col-xs-6">
								<!-- small box -->
								<div class="small-box bg-aqua">
									<div class="inner">
										<h3>150</h3>
										<p>New Orders</p>
									</div>
									<div class="icon">
										<i class="fa fa-envelope"></i>
									</div>
									<a href="#" class="small-box-footer"> More info <i
										class="fa fa-arrow-circle-right"></i>
									</a>
								</div>
							</div>
							<!-- ./col -->
							<div class="col-lg-3 col-xs-6">
								<!-- small box -->
								<div class="small-box bg-green">
									<div class="inner">
										<h3>
											53<sup style="font-size: 20px">%</sup>
										</h3>
										<p>Bounce Rate</p>
									</div>
									<div class="icon">
										<i class="fa fa-bullhorn"></i>
									</div>
									<a href="#" class="small-box-footer"> More info <i
										class="fa fa-arrow-circle-right"></i>
									</a>
								</div>
							</div>
							<!-- ./col -->
							<div class="col-lg-3 col-xs-6">
								<!-- small box -->
								<div class="small-box bg-yellow">
									<div class="inner">
										<h3>44</h3>
										<p>User Registrations</p>
									</div>
									<div class="icon">
										<i class="fa fa-laptop"></i>
									</div>
									<a href="#" class="small-box-footer"> More info <i
										class="fa fa-arrow-circle-right"></i>
									</a>
								</div>
							</div>
							<!-- ./col -->
							<div class="col-lg-3 col-xs-6">
								<!-- small box -->
								<div class="small-box bg-red">
									<div class="inner">
										<h3>65</h3>
										<p>Unique Visitors</p>
									</div>
									<div class="icon">
										<i class="fa fa-th-list"></i>
									</div>
									<a href="#" class="small-box-footer"> More info <i
										class="fa fa-arrow-circle-right"></i>
									</a>
								</div>
							</div>
							<!-- ./col -->
						</div>
					</div>
				</div>
			</section>
			<!-- Main content -->
			<section class="content">
				<div>
					<div class="col-xs-12">
						<div class="box">
							<!-- 	<div style="width: %">
								<a href="#" class="btn btn-default btn-lg">Block level button</a>
							</div>	 -->
							<div
								style="font-weight: bold; background-image: url('/company/resources/img/난초.png'); background-repeat: no-repeat; background-position: center;">
								<br> <br> <br> <br> <br> <br> <br>
								<br> <br> <br> <br> <br> <br> <br>
								<br> <br> <br> <br> <br> <br> <br>
								<br> <br> <br> <br> <br> <br> <br>
								<br> <br> <br> <br> <br>
							</div>
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
