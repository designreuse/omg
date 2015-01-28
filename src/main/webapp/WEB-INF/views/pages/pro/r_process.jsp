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
				<h1> 경영 부서 업무</h1>
				<ol class="breadcrumb">
					<li><a href="/company/notice/index"><i class="fa fa-dashboard"></i>Home</a></li>
					<li class="active"> 경영 부서 업무 </li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="mailbox row">
					<div class="col-xs-12">
						<div class="box box-solid">
							<div class="box-body">
								<div class="row">
									<div class="col-md-3 col-sm-4">
										<!-- BOXES are complex enough to move the .box-header around.
                                                 This is an example of having the box header within the box body -->
										<div class="box-header">
											
										</div>
										<!-- compose message btn -->
										
										<!-- Navigation - folders-->
										<div style="margin-top: 15px;">
											
										</div>
									</div>
									<!-- /.col (LEFT) -->
									<div id="detailview" class="col-md-9 col-sm-8">
										<div class="row pad">
											<div class="col-sm-6">
												
											</div>
											<div class="col-sm-6 search-form">
												<div class="input-group"> 					
													
												</div>
											</div>
										</div>
										<!-- /.row -->
										<div class="table-responsive">
											
										</div>
										<!-- /.table-responsive -->
									</div>
									<!-- /.col (RIGHT) -->
								</div>
								<!-- /.row -->
							</div>
							<!-- /.box-body -->
							<div class="box-footer clearfix">
								<div class="pull-right">
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

</body>
</html>
