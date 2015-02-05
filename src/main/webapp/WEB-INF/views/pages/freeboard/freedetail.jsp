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

		<aside class="right-side">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					<i class="fa  fa-twitch"></i>자유게시판
				</h1>
				<ol class="breadcrumb">
					<li><a href="/company/notice/index"><i
							class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">자유게시판</li>
				</ol>
			</section>
			<section class="content">
				<form action="commentswrite" method="post">
					<div class="row">
						<div class="col-xs-8">
							<div class="box" style="font-weight: bold">

								<div class="box-body">
									<table class="table table-bordered">
										<tr>
											<td style="width: 15%; background-color: #efefef;">제목</td>
											<th style="width: 35%">${freedetail.title}</th>
											<td style="width: 15%; background-color: #efefef;">등록일</td>
											<th style="width: 35%">${freedetail.credate}</th>
										</tr>
										<tr>
											<td style="width: 15%; background-color: #efefef;">작성자</td>
											<th style="width: 35%">${freedetail.writerName}</th>
											<td style="width: 15%; background-color: #efefef;">조회수</td>
											<th style="width: 35%">${freedetail.count}</th>
										</tr>
									</table>


									<br> <br> <br>
									<div>${freedetail.content}<br><br><br><br></div>
									<br> <br> <br>
									<div class="box-footer clearfix"></div>
									<c:if test="${user.employeeId==freedetail.writer}">
										<a
											href="/company/freeboard/freeupdate?freeboardNum=${freedetail.freeboardNum}"><input
											class='btn btn-default' type="button" value="수정" name="수정"></a>
										<a
											href="/company/freeboard/freedelete?freeboardNum=${freedetail.freeboardNum}"><input
											class='btn btn-default' type="button" value="삭제" name="삭제"></a>
									</c:if>
									<a href="/company/freeboard/index/1"><input type="button"
										class='btn btn-default' value="list로" name="list로"></a> <br>
									<br>

									<table class="table table-bordered">
										<c:forEach var="comments" items="${commentslist}"
											varStatus="i">
											<tr>
												<td style="width: 3%">${i.count}</td>
												<td style="width: 10%">${comments.commentsWriterName}</td>
												<td style="width: 87%">${comments.commentsContent}</td>
												<td><c:if
														test="${user.employeeId==comments.commentsWriter}">
														<a
															href="/company/freeboard/commentsdelete?commentsNum=${comments.commentsNum}&freeboardNum=${comments.freeboardNum}"
															title='${comments.freeboardNum}' class="btn btn-primary">삭제</a>
													</c:if></td>
											</tr>

										</c:forEach>

									</table>
									<br>
									
									
				</form>

				<h4>【 무플방지 위원회 】</h4>
				<input type="hidden" name="freeboardNum"
					value="${freedetail.freeboardNum}">
				<div class="input-group">
					<span class="input-group-addon"> ${user.name} <span
						class="glyphicon glyphicon-user"></span></span><input type="text"
						placeholder="댓글을 입력하세요" class="form-control"
						name="commentsContent" style="width: 40%">
					<button type="submit" class="btn btn-primary">입력</button>
				</div>
	</div>
	</div>
	</div>
	</section>
	</aside>


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