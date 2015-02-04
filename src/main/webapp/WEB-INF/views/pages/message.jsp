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
<!-- bootstrap wysihtml5 - text editor -->
<link
	href="/company/resources/css/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css"
	rel="stylesheet" type="text/css" />
<!-- iCheck for checkboxes and radio inputs -->
<link href="/company/resources/css/iCheck/minimal/blue.css"
	rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="/company/resources/css/AdminLTE.css" rel="stylesheet"
	type="text/css" />
</head>
<script src="/company/resources/js/jquery-1.11.2.js"></script>
<script>
	$(function() {
		// 이름 자동 검색
		$("#surech").keyup(function() {
			$("#usernames").empty();
			var cnt = 0 ;
			$.ajax({
				url :"usersurech",
				dataType : "json",
				success : function(json) {
					$.each(json, function(index, item) { // foreach해줌 
						var button = "<a id='btn"+(cnt++)+"' class='btn btn-default' data='"+item.name+"' >"+item.name+"("+item.employeeId+")"+"</a>";
						$(button).appendTo($("#usernames")); // 맏들
					});
				}
			});
		});
		// 검색된것 누르면 자동 보내는 사람 등록
		$("#usernames").on("click", "a[id^=btn]", function() {
			var name = $(this).attr("data");
			$("#surech").prop("value", name);
		});
		
		// 보내는 사람 누르면 보내는 상자 자동 생성
		$("#msglist").on("click", "#sendclick", function() {
			var name = $(this).text();
			$("#surech").prop("value", name);
		});
		
		// 상세보기 
		$("#msglist").on("click", "#msgdetail", function() {
			var numdata = $(this).attr("title");
			$("#detailview").empty();
			$.ajax({
				url : "detail",
				dataType: "json",
				data : "num="+numdata ,
				success : function(json) {
					var title = "<h4><b>상세 내용</b></h4>";
					var table = "<table class='table table-hover' align='center' border='1'>"+ 
								"<tr style='background-color: #ddeecc;'><th>체크</th><th>보낸사람</th><th>제목</th><th>보낸시간</th></tr>"+
								"<td class='small-col'><input name='cbox' value='"+json.messageNum+"' type='checkbox' /></td>"+
								"</td><td style='color:blue;'><b>"+json.sendName+
								"</b></td><td>"+json.title+
								"</td><td>"+json.credate+
								"</td></tr>"+
								"<tr><th colspan='4' style='background-color: #ddeecc;'>내용</th></tr>"+
								"<tr><td colspan='4'><textarea readonly='readonly'>"+json.content+"</textarea></td></tr>";
					var div = "<div class='box-footer clearfix'><div class='pull-right'><a href='/company/message/index' class='btn btn-info'>전체메시지보기</a></div></div";
					$(title+table+div).appendTo($("#detailview"));
				}
			});
		});
		
		// 삭제 할때(체크된것들)
		$("#deleteMsg").click(function() {
			//alert("삭제");
			var cbox = [];
			$("input[name=cbox]:checked").each(function() {
				cbox.push($(this).val());
			});
			if(cbox.length != 0){
				$("#deleteMsg").attr("href", "delete?cboxs="+cbox);
			}
		});
	});
</script>
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
				<h1><i class="fa fa-envelope"></i> 메시지함</h1>
				<ol class="breadcrumb">
					<li><a href="/company/notice/index"><i class="fa fa-dashboard"></i>Home</a></li>
					<li class="active">메시지함</li>
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
											<i class="fa fa-inbox"></i>
											<h3 class="box-title">MESSAGE</h3>
										</div>
										<!-- compose message btn -->
										<a class="btn btn-block btn-primary" data-toggle="modal"
											data-target="#compose-modal"><i class="fa fa-pencil"></i>
											메시지 작성하기</a>
										<!-- Navigation - folders-->
										<div style="margin-top: 15px;">
											<ul class="nav nav-pills nav-stacked">
												<li class="header">폴더(Folders)</li>
												<li class="active"><a id="msgrefresh" class="btn btn-success btn-sm">
												<i class="fa fa-inbox"></i> 메시지박스</a></li>
											</ul>
										</div>
									</div>
									<!-- /.col (LEFT) -->
									<div id="detailview" class="col-md-9 col-sm-8">
										<div class="row pad">
											<div class="col-sm-6">
												<label style="margin-right: 10px;"> <input
													type="checkbox" id="check-all" /><span> 전체 선택</span>
												</label>
											</div>
											<div class="col-sm-6 search-form">
												<div class="input-group"> 					
													<input type="text" class="form-control input-sm" id="surechName"
														placeholder="보낸사람검색">
													<div class="input-group-btn">
														<button id="surechMsg" class="btn btn-sm btn-primary">
															<i class="fa fa-search"></i>
														</button>
													</div>
												</div>
											</div>
										</div>
										<!-- /.row -->
										<div class="table-responsive">
											<!-- THE MESSAGES -->
											<table class="table table-mailbox" border="1">
												<thead>
													<tr class="unread" align="center">
														<td class="small-col"> 체 크 </td>
														<td class="name">보 낸 사 람(답장)</td>
														<td class="subject"> 제  목 </td>
														<td class="time">시 간</td>
														<td class="time">상 세 보 기</td>
													</tr>
												</thead>
												<tbody id="msglist">
													<tr>
														<td colspan="5" style="color: red;" align="center"><b>받은 메시지가 없습니다.</b></td>
													</tr>
												</tbody>
											</table>
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
									<a id="deleteMsg" class="btn btn-danger btn-sm">선택 삭제</a> <!-- 해야됨 -->
									<small> 페이지 : <span id="page"></span>/<span id="total"></span></small> <!-- 해야됨 -->
									<span id="buttoncontroll">
									</span>
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

	<!-- COMPOSE MESSAGE MODAL -->
	<div class="modal fade" id="compose-modal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">
						<i class="fa fa-envelope-o"></i> Message 보내기
					</h4>
				</div>
				<form action="/company/message/insert" method="post">
					<div class="modal-body">
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">보내는 사람:</span> <input
									type="text" class="form-control"
									placeholder="보내는 사람" value="${user.name}" readonly="readonly">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">받는 &nbsp;&nbsp;   사람:</span>
								<input name="message_cc" type="text" class="form-control" 
								  id="surech" placeholder="받는 사람 이름">
							</div>
						</div>
						<div id="usernames" class="form-group">
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">제&nbsp;&nbsp;&nbsp;&nbsp;목 :</span>
								 <input name="message_title" type="text" class="form-control" 
								  		placeholder="제목">
							</div>
						</div>
						<div class="form-group">
							<textarea name="message" class="form-control"
								placeholder="Message 내용" style="height: 120px;"></textarea>
						</div>
						<div class="form-group">
							<p class="help-block">최대 100글자</p>
						</div>
					</div>
					<div class="modal-footer clearfix">
						<button type="button" class="btn btn-danger" data-dismiss="modal">
							<i class="fa fa-times"></i> 취소
						</button>

						<button type="submit" class="btn btn-primary pull-left">
							<i class="fa fa-envelope"></i> 메시지 보내기
						</button>
					</div>
				</form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"
		type="text/javascript"></script>
	<!-- AdminLTE App -->
	<script src="/company/resources/js/AdminLTE/app.js"
		type="text/javascript"></script>
	<!-- iCheck -->
	<script src="/company/resources/js/plugins/iCheck/icheck.min.js"
		type="text/javascript"></script>
	<!-- Page script -->
	<script>
		$(function() {			
			startpage = 1;
			endpage = 0;
			$.ajax({				// 처음 메시지 가져오기
				url: "Msglist",	// 변경
				dataType: "json",
				data :  "page="+startpage,
				success : function(json) {
					if(json != ""){
						$("#msglist").empty();
						$.each(json, function(index, item) {
							var td = "<td class='small-col'><input name='cbox' value='"+item.messageNum+"' type='checkbox' /></td>"+
									 "<td><a id='sendclick' class='btn btn-defaul' data-toggle='modal' data-target='#compose-modal' >"+item.sendName+"</a></td>"+
									 "<td>"+item.title+"</td>"+
									 "<td>"+item.credate+"</td>"+
									 "<td><a id='msgdetail' title="+item.messageNum+" class='btn btn-primary btn-xs'>상세보기</a></td>";
									 
							$("<tr align='center'>"+td+"</tr>").appendTo($("#msglist"));
							
						});
						var button = "<button id='nextasc' class='btn btn-xs btn-primary disabled'><i class='fa fa-caret-left'></i></button>"+
									 "<button id='nextdesc' class='btn btn-xs btn-primary '><i class='fa fa-caret-right'></i></button>";
						$(button).appendTo($("#buttoncontroll"));
					}
				}
			});
			
			$.ajax({					// 페이지 총페이지수 구하기
				url: "total" ,
				dataType: "text",
				async: false,
				success : function(text) {
					endpage = parseInt(((text-1) / 5) + 1);
					if(text > 5){
						$("#page").text(startpage);
						$("#total").text(endpage);
						$("#nextasc").addClass("disabled");
						$("#nextdesc").removeClass("disabled");
					}else{
						$("#page").text(1);
						$("#total").text(1);
						$("#nextasc").addClass("disabled");
						$("#nextdesc").addClass("disabled");
					}
				}
			});
			
			// < 버튼 눌림
			$("#buttoncontroll").on("click","#nextasc",function() {
				startpage--;
				if(startpage >= 1){
					$.ajax({
						url: "Msglist",
						dataType: "json",
						data :  "page="+startpage,
						success : function(json) {
							if(json != ""){
								$("#msglist").empty();
								$.each(json, function(index, item) {
									var td = "<td class='small-col'><input name='cbox' value='"+item.messageNum+"' type='checkbox' /></td>"+
											 "<td><a id='sendclick' class='btn btn-defaul' data-toggle='modal' data-target='#compose-modal'>"+item.sendName+"</a></td>"+
											 "<td>"+item.title+"</td>"+
											 "<td>"+item.credate+"</td>"+
											 "<td><a id='msgdetail' title="+item.messageNum+" class='btn btn-primary btn-xs'>상세보기</a></td>";
									$("<tr align='center'>"+td+"</tr>").appendTo($("#msglist")); 
								});
							}
						}
					});
					$("#nextdesc").removeClass("disabled");
					$("#page").text(startpage);
					if(startpage == 1){
						$("#nextasc").addClass("disabled");
						$("#nextdesc").removeClass("disabled");
					}
				}else{
					startpage++;
				}
			});
			
			
			// > 버튼 눌림	
			$("#buttoncontroll").on("click","#nextdesc",function() {
				startpage++;
				if(startpage <= endpage){
					$.ajax({
						url: "Msglist",
						dataType: "json",
						data :  "page="+startpage,
						success : function(json) {
							if(json != ""){
								$("#msglist").empty();
								$.each(json, function(index, item) {
									var td = "<td class='small-col'><input name='cbox' value='"+item.messageNum+"' type='checkbox' /></td>"+
											 "<td><a id='sendclick' class='btn btn-defaul' data-toggle='modal' data-target='#compose-modal'>"+item.sendName+"</a></td>"+
											 "<td>"+item.title+"</td>"+
											 "<td>"+item.credate+"</td>"+
											 "<td><a id='msgdetail' title="+item.messageNum+" class='btn btn-primary btn-xs'>상세보기</a></td>";
									$("<tr align='center'>"+td+"</tr>").appendTo($("#msglist")); 
								});
							}
						}
					});
					$("#nextasc").removeClass("disabled");
					$("#page").text(startpage);
					if(startpage == endpage){
						$("#nextdesc").addClass("disabled");
						$("#nextasc").removeClass("disabled");
					}
				}else{
					startpage--;
				}
			});
			
			// 메시지 갱신
			$("#msgrefresh").click(function() {
				$("#buttoncontroll").empty();
				startpage = 1;
				$.ajax({
					url: "Msglist",
					dataType: "json",
					data :  "page="+startpage,
					success : function(json) {
						if(json != ""){
							$("#msglist").empty();
							$.each(json, function(index, item) {
								var td = "<td class='small-col'><input name='cbox' value='"+item.messageNum+"' type='checkbox' /></td>"+
										 "<td><a id='sendclick' class='btn btn-defaul' data-toggle='modal' data-target='#compose-modal'>"+item.sendName+"</a></td>"+
										 "<td>"+item.title+"</td>"+
										 "<td>"+item.credate+"</td>"+
										 "<td><a id='msgdetail' title="+item.messageNum+" class='btn btn-primary btn-xs'>상세보기</a></td>";
								$("<tr align='center'>"+td+"</tr>").appendTo($("#msglist")); 
							});
						}
						var button = "<button id='nextasc' class='btn btn-xs btn-primary disabled'><i class='fa fa-caret-left'></i></button>"+
						 			 "<button id='nextdesc' class='btn btn-xs btn-primary '><i class='fa fa-caret-right'></i></button>";
						$(button).appendTo($("#buttoncontroll"));
					}
				});
				$("#page").text(startpage);
				$.ajax({					// 페이지 총페이지수 구하기
					url: "total" ,
					dataType: "text",
					async: false,
					success : function(text) {
						endpage = parseInt(((text-1) / 5) + 1);
						if(text > 5){
							$("#page").text(startpage);
							$("#total").text(endpage);
							$("#nextasc").addClass("disabled");
							$("#nextdesc").removeClass("disabled");
						}else{
							$("#page").text(1);
							$("#total").text(1);
							$("#nextasc").addClass("disabled");
							$("#nextdesc").addClass("disabled");
						}
					}
				});
			});
			
			// 보낸사람 검색
			$("#surechMsg").click(function() {
				$("#buttoncontroll").empty();
				srhstartpage = 1;
				srhendpage = 0;
				$("#msglist").empty();
				var name = $("#surechName").val();
				$.ajax({
					url: "surechMsg",
					dataType: "json",
					data: "name="+name+"&page="+srhstartpage,
					async: false,
					type: "post",
					success: function(json) {
						if(json != ""){
							$.each(json, function(index, item) {
								var td = "<td class='small-col'><input name='cbox' value='"+item.messageNum+"' type='checkbox' /></td>"+
										 "<td><a id='sendclick' class='btn btn-defaul' data-toggle='modal' data-target='#compose-modal'>"+item.sendName+"</a></td>"+
										 "<td>"+item.title+"</td>"+
										 "<td>"+item.credate+"</td>"+
										 "<td><a id='msgdetail' title="+item.messageNum+" class='btn btn-primary btn-xs'>상세보기</a></td>";
								$("<tr align='center'>"+td+"</tr>").appendTo($("#msglist")); 
							});
							var button = "<button id='nextasc2' class='btn btn-xs btn-primary disabled'><i class='fa fa-caret-left'></i></button>"+
							 			 "<button id='nextdesc2' class='btn btn-xs btn-primary'><i class='fa fa-caret-right'></i></button>";
								$(button).appendTo($("#buttoncontroll"));
						}else{
							var tr = "<tr><td colspan='5' style='color: red;' align='center'><b>검색한 <sapn style='color:blue;'>내용</sapn>이 없거나 <sapn style='color:blue;'>이름</sapn>을 잘못 입력하셨습니다.</b></td></tr>";
							$(tr).appendTo($("#msglist"));
						}
					},
					error: function() {
						var tr = "<tr><td colspan='5' style='color: red;' align='center'><b>검색한 <sapn style='color:blue;'>내용</sapn>이 없거나 <sapn style='color:blue;'>이름</sapn>을 잘못 입력하셨습니다.</b></td></tr>";
						$(tr).appendTo($("#msglist"));
					}
				});
				$.ajax({					// 검색 페이지 총페이지수 구하기
					url: "surechMsgtotal" ,
					dataType: "text",
					data: "name="+name,
					async: false,
					success : function(text) {
						srhendpage = parseInt(((text-1) / 5) + 1);
						if(text > 5){
							$("#page").text(srhstartpage);
							$("#total").text(srhendpage);
							$("#nextasc2").addClass("disabled");
							$("#nextdesc2").removeClass("disabled");
						}else{
							$("#page").text(1);
							$("#total").text(1);
							$("#nextasc2").addClass("disabled");
							$("#nextdesc2").addClass("disabled");
						}
					}
				});
			});
			
			// < 버튼 눌림
			$("#buttoncontroll").on("click","#nextasc2",function() {
				srhstartpage--;
				name = $("#sendclick").text();
				if(srhendpage >= 1){
					$.ajax({
						url: "surechMsg",
						dataType: "json",
						data :  "name="+name+"&page="+srhstartpage,
						type: "post",
						success : function(json) {
							if(json != ""){
								$("#msglist").empty();
								$.each(json, function(index, item) {
									var td = "<td class='small-col'><input name='cbox' value='"+item.messageNum+"' type='checkbox' /></td>"+
											 "<td><a id='sendclick' class='btn btn-defaul' data-toggle='modal' data-target='#compose-modal'>"+item.sendName+"</a></td>"+
											 "<td>"+item.title+"</td>"+
											 "<td>"+item.credate+"</td>"+
											 "<td><a id='msgdetail' title="+item.messageNum+" class='btn btn-primary btn-xs'>상세보기</a></td>";
									$("<tr align='center'>"+td+"</tr>").appendTo($("#msglist")); 
								});
							}
						}
					});
					$("#nextdesc2").removeClass("disabled");
					$("#page").text(srhstartpage);
					if(srhstartpage == 1){
						$("#nextasc2").addClass("disabled");
						$("#nextdesc2").removeClass("disabled");
					}
				}else{
					srhstartpage++;
				}
			});
			// > 버튼 눌림	
			$("#buttoncontroll").on("click","#nextdesc2",function() {
				srhstartpage++;
				name = $("#sendclick").text();
				if(srhstartpage <= srhendpage){
					$.ajax({
						url: "surechMsg",
						dataType: "json",
						data :  "name="+name+"&page="+srhstartpage,
						type: "post",
						success : function(json) {
							if(json != ""){
								$("#msglist").empty();
								$.each(json, function(index, item) {
									var td = "<td class='small-col'><input name='cbox' value='"+item.messageNum+"' type='checkbox' /></td>"+
											 "<td><a id='sendclick' class='btn btn-defaul' data-toggle='modal' data-target='#compose-modal'>"+item.sendName+"</a></td>"+
											 "<td>"+item.title+"</td>"+
											 "<td>"+item.credate+"</td>"+
											 "<td><a id='msgdetail' title="+item.messageNum+" class='btn btn-primary btn-xs'>상세보기</a></td>";
									$("<tr align='center'>"+td+"</tr>").appendTo($("#msglist")); 
								});
							}
						}
					});
					$("#nextasc2").removeClass("disabled");
					$("#page").text(srhstartpage);
					if(srhstartpage == srhendpage){
						$("#nextdesc2").addClass("disabled");
						$("#nextasc2").removeClass("disabled");
					}
				}else{
					srhstartpage--;
				}
			});
		});
	</script>
	<script type="text/javascript">
		$(function() {			
			"use strict";

			//iCheck for checkbox and radio inputs
			$('input[type="checkbox"]').iCheck({
				checkboxClass : 'icheckbox_minimal-blue',
				radioClass : 'iradio_minimal-blue'
			});

			//When unchecking the checkbox
			$("#check-all").on('ifUnchecked',function(event) {
				//Uncheck all checkboxes
				$("input[type='checkbox']", ".table-mailbox").iCheck("uncheck");
			});
			//When checking the checkbox
			$("#check-all").on('ifChecked', function(event) {
				//Check all checkboxes
				$("input[type='checkbox']", ".table-mailbox").iCheck("check");
			});
			
			//Handle starring for glyphicon and font awesome
			$(".fa-star, .fa-star-o, .glyphicon-star, .glyphicon-star-empty")
					.click(function(e) {
						e.preventDefault();
						//detect type
						var glyph = $(this).hasClass("glyphicon");
						var fa = $(this).hasClass("fa");

						//Switch states
						if (glyph) {
							$(this).toggleClass("glyphicon-star");
							$(this).toggleClass("glyphicon-star-empty");
						}

						if (fa) {
							$(this).toggleClass("fa-star");
							$(this).toggleClass("fa-star-o");
						}
					});
		});
	</script>
</body>
</html>
