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

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">게시글</h3>
								<div style="margin: 10px; float: right;">
									<form action="../selectListBoard/1">
										<input type="text" placeholder="제목입력" name="title"
											style="text-align: center"><input type="submit"
											class="btn btn-primary btn-sm" value="검색">
									</form>
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<table class="table table-bordered">
									<tr>
										<th style="width: 5%">번호</th>
										<th style="width: 70%">제목</th>
										<th style="width: 13%">등록일</th>
										<th style="width: 7%">작성자</th>
										<th style="width: 5%">조회수</th>
									</tr>




									<c:forEach var="board" items="${freelist}" varStatus="i">
										<tr>
											<td>${board.freeboardNum}</td>
											<td><a
												href="/company/freeboard/freedetail?freeboardNum=${board.freeboardNum}">${board.title}</a></td>
											<td>${board.credate}</td>
											<td>${board.writerName}</td>
											<td>${board.count}</td>
										</tr>
									</c:forEach>
								</table>
							</div>



							<!-- /.box-body -->
							<div class="box-footer clearfix">
								<div class="col-xs-6">
									<a href="/company/freeboard/freewrite"><input type="button"
										class="btn btn-primary btn-sm" value="글쓰기"
										style="float: left;"></a>
										<span style="float: right;"><jsp:include
											page="/WEB-INF/views/paging/paging.jsp" /></span>
								</div>
							</div>
						</div>
					</div>
					<!-- /.box -->
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
