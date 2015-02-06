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
<script src="/company/resources/js/jquery-1.11.2.js"></script>
<script>
	$(function() {
		$('.carousel').carousel(0);
		var num = 0;
		page = 1;
		$.ajax({
			url:"/company/dashboard/noticeCount",
			dataType:"text",
			success:function(text){
				if(text != ""){
					$("#ocount").empty();
				}
				$("#ocount").text(text);
			}
		});
		$.ajax({				// 처음 메시지 가져오기
			url: "/company/dashboard/msgLatelyByDate",	// 변경
			dataType: "json",
			data :  "page="+page,
			success : function(json) {
				if(json != ""){
					$("#msgcnt").empty();
					$.each(json, function(index, item) {
						num ++;
					});
				}
				$("#msgcnt").text(num);
			}
		});
		$.ajax({				 
			url: "/company/dashboard/studyCount",	 
			dataType: "text",
			success : function(text) {
				if(text != ""){
					$("#studycnt").empty();
				}
				$("#studycnt").text(text);
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
		<aside class="right-side" >
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					<i class="fa  fa-twitch"></i>인사말
				</h1>
				<ol class="breadcrumb">
					<li><a href="/company/dashboard/hello"><i class="fa fa-dashboard"></i>Home</a></li>
				</ol>
			</section>

			<section>
				<div class="col-xs-12">
					<div style="margin: 15px">
						<div class="row">
							<div class="col-lg-3 col-xs-6">
								<!-- small box -->
								<div class="small-box bg-green">
									<div class="inner">
										<h3>
											Notice
										</h3>
										<p id="ocount">?</p>
									</div>
									<div class="icon">
										<i class="fa fa-bullhorn"></i>
									</div>
									<a href="/company/notice/index" class="small-box-footer"> More info <i
										class="fa fa-arrow-circle-right"></i>
									</a>
								</div>
							</div>
							<!-- ./col -->
							<div class="col-lg-3 col-xs-6">
								<!-- small box -->
								<div class="small-box bg-yellow">
									<div class="inner">
										<h3>Study</h3>
										<p id="studycnt">??</p>
									</div>
									<div class="icon">
										<i class="fa fa-laptop"></i>
									</div>
									<a href="/company/studys/index" class="small-box-footer"> More info <i
										class="fa fa-arrow-circle-right"></i>
									</a>
								</div>
							</div>
							<!-- ./col -->
							<div class="col-lg-3 col-xs-6">
								<!-- small box -->
								<div class="small-box bg-aqua">
									<div class="inner">
										<h3>New message</h3>
										<p id="msgcnt">??</p>
									</div>
									<div class="icon">
										<i class="fa fa-envelope"></i>
									</div>
									<a href="/company/message/index" class="small-box-footer"> More info <i
										class="fa fa-arrow-circle-right"></i>
									</a>
								</div>
							</div>
							<!-- ./col -->
							<div class="col-lg-3 col-xs-6">
								<!-- small box -->
								<div class="small-box bg-red">
									<div class="inner">
										<h3>Business</h3>
										<p>-</p>
									</div>
									<div class="icon">
										<i class="fa fa-th-list"></i>
									</div>
									<a href="/company/process/index" class="small-box-footer"> More info <i
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
				<div align="center">
					<div class="col-xs-12">
						<div class="box">
							<div class="bs-example">
								<div id="carousel-example-captions"
									class="carousel slide bs-docs-carousel-example">
									<ol class="carousel-indicators">
										<li data-target="#carousel-example-captions" data-slide-to="0"
											class="active"></li>
										<li data-target="#carousel-example-captions" data-slide-to="1"
											class=""></li>
										<li data-target="#carousel-example-captions" data-slide-to="2"
											class=""></li>
									</ol>
									<div class="carousel-inner">
										<div class="item active">
											<img data-src="holder.js/1152x648/auto/#777:#777"
												src="/company/resources/img/난초.png"
												alt="1152x648">
											<div class="carousel-caption">
												<!-- <h3>First slide label</h3>
												<p>Nulla vitae elit libero, a pharetra augue mollis
													interdum.</p> -->
											</div>
										</div>
										<div class="item">
											<img data-src="holder.js/1152x648/auto/#666:#666"
												src="/company/resources/img/새해복.png"
												alt="1152x648">
											<div class="carousel-caption">
											</div>
										</div>
										<div class="item">
											<img data-src="holder.js/1152x648/auto/#555:#555"
												src="/company/resources/img/힘내라.png"
												alt="1152x648">
											<div class="carousel-caption">
											</div>
										</div>
									</div>
									<a class="left carousel-control" href="#carousel-example-captions" data-slide="prev"> 
										<span class="icon-prev"></span>
									</a> <a class="right carousel-control" href="#carousel-example-captions" data-slide="next"> 
										<span class="icon-next"></span>
									</a>
								</div>
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
	<script	src="//ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js" type="text/javascript"></script>
	<!-- AdminLTE App -->
	<script src="/company/resources/js/AdminLTE/app.js" type="text/javascript"></script>
</body>
</html>
