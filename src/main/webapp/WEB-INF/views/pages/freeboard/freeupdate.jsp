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
					<i class="fa  fa-twitch"></i>자유게시판
				</h1>
				<ol class="breadcrumb">
					<li><a href="/company/dashboard/hello"><i
							class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">자유게시판</li>
				</ol>
			</section>
			<section class="content">
				<form action="freeupdate" method="post">
					<input type="hidden" name="freeboardNum"
						value="${freeupdate.freeboardNum}" />
					<div class="col-xs-8">
						<div align="left">
							<table class="table table-bordered">
								<tr>
									<td style="width: 10%; background-color: #efefef;">제목</td>
									<th style="width: 60%;"><label class="item"
										style="font-weight: bold;"><input size="90"
											name="title" value="${freeupdate.title}"> </label></th>
									<td style="width: 10%; background-color: #efefef;">작성자</td>
									<th style="width: 20%;">${user.name}</th>
								</tr>
							</table>
							<textArea name="content" rows="30" cols="177">${freeupdate.content}</textArea>
						<br> <br> <input type="submit" class='btn btn-default'
							value="완성"> <a href="index"><input type="button"
							class='btn btn-default' value="list로"></a>
						</div>
					</div>
				</form>
			</section>
		</aside>
	</div>
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