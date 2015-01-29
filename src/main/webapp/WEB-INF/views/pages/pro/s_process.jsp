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
		startpage = 1;
		endpage = 0;
		total = 0;
		date = 0;				// 날짜 하는것..
		$.ajax({          			// 프로잭트 기술 보여주기
			url : "techlist",
			dataType : "json",
			success : function(json){
				$("#techlist").empty();
				var td = "<td><select id='techclick' name='techbtn'>";
				$.each(json, function(index, item) {
					td += "<option value="+item.techName+">"+item.techName+"</option>";
				});
				td +="</select></td>";
				$("<tr>"+td+"</tr>").appendTo($("#techlist"));
			}
		});
		
		$.ajax({          			// 프로잭트 리스트 보여주기
			url : "salProlist",
			dataType : "json",
			data : "page="+startpage+"&date="+date,
			success : function(json) {
				if(json != ""){
					$("#prolist").empty();
					$.each(json, function(index, item) {
						td = "<td class='small-col'><input name='cbox' value='"+item.projectId+"' app='"+item.approval+"' type='checkbox' /></td>"+
							 "<td>"+item.deptName+"</a></td>"+
							 "<td><a id='proInTech' class='btn btn-default' proid='"+item.projectId+"' proname='"+item.projectName+"' protech='해야됨'  app='"+item.approval+"'>"+item.projectName+"</a></td>"+
							 "<td>"+item.startDate+"</td>"+
							 "<td>"+item.endDate+"</td>"+
							 "<td>"+item.projectPrice+"</td>";
							 if(item.approval == null){
									td += "<td style='color:blue;'>승인대기</td>"+
										  "<td style='color:blue;'>확인중</td>";
							 }else if(item.approval == 'X'){
								 td += "<td style='color:red;'>"+item.approval+"</td>"+
								 	   "<td style='color:red;'>"+item.approvalName+"</td>";
							 }else {
								 td += "<td>"+item.approval+"</td>";
								 if(item.approvalName == null){
									 td +="<td style='color:blue;'>확인중</td>";
								 }else{
									 td +="<td>"+item.approvalName+"</td>"; 
								 }
							}
						$("<tr>"+td+"</tr>").appendTo($("#prolist"));
					});
				}
				var button ="<button id='nextasc' class='btn btn-xs btn-primary disabled'><i class='fa fa-caret-left'></i></button>"+
							"<button id='nextdesc' class='btn btn-xs btn-primary '><i class='fa fa-caret-right'></i></button>";
				$("#buttoncontroll").append(button);
			}
		});
		
		$.ajax({					// ProjectList 페이지 총페이지수 구하기
			url: "salPrototle" ,
			dataType: "text",
			data : "date="+date,
			success : function(text) {
				endpage = parseInt(((text-1) / 15) + 1);
				$("#page").text(startpage);
				$("#total").text(text);
				$("#nextdesc").removeClass("disabled");
			}
		});
		
		function ckdatelist(date2) {								// 버튼이 눌렸을경우
			date = date2;
			$.ajax({          								// 프로잭트 리스트 보여주기
				url : "salProlist",
				dataType : "json",
				data : "page="+startpage+"&date="+date,
				success : function(json) {
					if(json != ""){
						$("#prolist").empty();
						$.each(json, function(index, item) {
							td = "<td class='small-col'><input name='cbox' value='"+item.projectId+"' app='"+item.approval+"' type='checkbox' /></td>"+
								 "<td>"+item.deptName+"</td>"+
								 "<td><a id='proInTech' class='btn btn-default' proid='"+item.projectId+"' proname='"+item.projectName+"' protech='해야됨' app='"+item.approval+"'>"+item.projectName+"</a></td>"+
								 "<td>"+item.startDate+"</td>"+
								 "<td>"+item.endDate+"</td>"+
								 "<td>"+item.projectPrice+"</td>";
								 if(item.approval == null){
										td += "<td style='color:blue;'>승인대기</td>"+
											  "<td style='color:blue;'>확인중</td>";
								 }else if(item.approval == 'X'){
									 td += "<td style='color:red;'>"+item.approval+"</td>"+
									 	   "<td style='color:red;'>"+item.approvalName+"</td>";
								 }else {
									 td += "<td>"+item.approval+"</td>";
									 if(item.approvalName == null){
										 td +="<td style='color:blue;'>확인중</td>";
									 }else{
										 td +="<td>"+item.approvalName+"</td>"; 
									 }
								}
							$("<tr>"+td+"</tr>").appendTo($("#prolist"));
						});
					}
				}
			});
			
			$.ajax({										// ProjectList 페이지 총페이지수 구하기
				url: "salPrototle" ,
				dataType: "text",
				data : "date="+date,
				success : function(text) {
					endpage = parseInt(((text-1) / 15) + 1);
					$("#page").text(startpage);
					$("#total").text(text);
					$("#nextdesc").removeClass("disabled");
				}
			});
		}
		
		// 전체 선택
		$("#fulllist").click(function() {
			ckdatelist(0);
		});
		
		// 승인대기
		$("#proInglist").click(function() {
			ckdatelist(1);
		});
		
		// 승인불가
		$("#proNotlist").click(function() {
			ckdatelist(2);
		});
		
		// 승인완료
		$("#proEndlist").click(function() {
			ckdatelist(3);
		});
		
		// < 버튼 눌림
		$("#buttoncontroll").on("click","#nextasc",function() {
			startpage--;
			if(startpage >= 1){
				$.ajax({          			// 프로잭트 리스트 보여주기
					url : "salProlist",
					dataType : "json",
					data : "page="+startpage+"&date="+date,
					success : function(json) {
						if(json != ""){
							$("#prolist").empty();
							$.each(json, function(index, item) {
								td = "<td class='small-col'><input name='cbox' value='"+item.projectId+"' app='"+item.approval+"' type='checkbox' /></td>"+
									 "<td>"+item.deptName+"</a></td>"+
									 "<td><a id='proInTech' class='btn btn-default' proid='"+item.projectId+"' proname='"+item.projectName+"' protech='해야됨' app='"+item.approval+"'>"+item.projectName+"</a></td>"+
									 "<td>"+item.startDate+"</td>"+
									 "<td>"+item.endDate+"</td>"+
									 "<td>"+item.projectPrice+"</td>";
									 if(item.approval == null){
											td += "<td style='color:blue;'>승인대기</td>"+
												  "<td style='color:blue;'>확인중</td>";
									 }else if(item.approval == 'X'){
										 td += "<td style='color:red;'>"+item.approval+"</td>"+
										 	   "<td style='color:red;'>"+item.approvalName+"</td>";
									 }else {
										 td += "<td>"+item.approval+"</td>";
										 if(item.approvalName == null){
											 td +="<td style='color:blue;'>확인중</td>";
										 }else{
											 td +="<td>"+item.approvalName+"</td>"; 
										 }
									}
								$("<tr>"+td+"</tr>").appendTo($("#prolist"));
							});
						}
					}
				});
				$("#page").text(startpage);
				$("#nextdesc").removeClass("disabled");
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
				$.ajax({          			// 프로잭트 리스트 보여주기
					url : "salProlist",
					dataType : "json",
					data : "page="+startpage+"&date="+date,
					success : function(json) {
						if(json != ""){
							$("#prolist").empty();
							$.each(json, function(index, item) {
								td = "<td class='small-col'><input name='cbox' value='"+item.projectId+"' app='"+item.approval+"' type='checkbox' /></td>"+
									 "<td>"+item.deptName+"</td>"+
									 "<td><a id='proInTech' class='btn btn-default' proid='"+item.projectId+"' proname='"+item.projectName+"' protech='해야됨' app='"+item.approval+"'>"+item.projectName+"</a></td>"+
									 "<td>"+item.startDate+"</td>"+
									 "<td>"+item.endDate+"</td>"+
									 "<td>"+item.projectPrice+"</td>";
									 if(item.approval == null){
											td += "<td style='color:blue;'>승인대기</td>"+
												  "<td style='color:blue;'>확인중</td>";
									 }else if(item.approval == 'X'){
										 td += "<td style='color:red;'>"+item.approval+"</td>"+
										 	   "<td style='color:red;'>"+item.approvalName+"</td>";
									 }else {
										 td += "<td>"+item.approval+"</td>";
										 if(item.approvalName == null){
											 td +="<td style='color:blue;'>확인중</td>";
										 }else{
											 td +="<td>"+item.approvalName+"</td>"; 
										 }
									}
								$("<tr>"+td+"</tr>").appendTo($("#prolist"));
							});
						}
					}
				});
				$("#page").text(startpage);
				$("#nextasc").removeClass("disabled");
				if(startpage == endpage){
					$("#nextdesc").addClass("disabled");
					$("#nextasc").removeClass("disabled");
				}
			}else{
				startpage--;
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
				<h1><b>영업 부서 업무</b></h1>
				<ol class="breadcrumb">
					<li><a href="/company/notice/index"><i class="fa fa-dashboard"></i>Home</a></li>
					<li class="active"> 영업 부서 업무 </li>
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
											<div id="proinsert" align="center"><!-- 팀장이 프로잭트 등록하기  -->
												<form action="insertpro" method="post">
													<h6><b> 프로젝트 등록창</b></h6>
													<table border="1" style="border-top: solid;">
														<tbody ><!-- 프로잭트 기술 등록 하기 -->
															<tr><th colspan="2" style="background-color: #ccffaa;text-align: center;"> 프로젝트 등록 </th></tr>
															<tr><th>프 로 젝 트<br>ID</th><td><input type="text" name="proid" /></td></tr>
															<tr><th>프 로 젝 트</th><td><input type="text" name="proname" /></td></tr>
															<tr><th>금 액(천만원) </th><td><input type="text" name="proprice" /></td></tr>
															<tr><th>시작일<br>(y-m-d)</th><td><input type="text" name="start" /></td></tr>
															<tr><th>종료일<br>(y-m-d)</th><td><input type="text" name="end" /></td></tr>
															<tr><th>부서ID</th><td><input type="text" name="deptid" /><br>(개발:D, 유지보수:M)</td></tr>
														</tbody>
													</table>
													<div align="right">
														<input type="submit" value="입력"><input type="reset" value="리셋">
													</div>
												</form>
											</div>
										</div>
										<div style="margin-top: 15px;"> 
											<div align="center">
												<h6><b>회사 기술 목록</b></h6>
												<div class="table-responsive">
													<table border="1" style="border-top: solid;" >
														<thead align="center">
															<tr style="background-color: #ccffaa;">
																<th style="text-align: center;"><b> 기술명 </b></th>
															</tr>
														</thead>
														<tbody id="techlist" align="center"><!-- 기술의 목록이 보이는곳 -->
															<tr>
																<td><select name='tech'><option value=""> 프로젝트를 선택해주세요!</option></select></td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="table-responsive" align="center">
													<form action="insert" method="post">
														<h6><b> 프로젝트 기술 등록창 </b></h6>
														<table border="1" style="border-top: solid;">
															<tbody id="insertProTech"><!-- 프로잭트 기술 등록 하기 -->
																<tr><th colspan="2" style="background-color: #ccffaa;text-align: center;"> 기술 등록 </th></tr>
																<tr><th colspan="2" style="text-align: center;color: red;"> 프로젝트를 선택해주세요! </th></tr>
															</tbody>
														</table>
														<div id="insertProTechBtn" align="right">
														</div>
													</form>
												</div>
											</div>
										</div>
									</div>
									<!-- /.col (LEFT) -->
									<div class="col-md-9 col-sm-8">
										<div class="row pad">
											<div id="sal_button" style="float: right !important;"><!-- 버튼을 모여있는곳 -->
													<a id="fulllist" class="btn btn-primary btn-sm">전체 조회</a>
													<a id="proInglist" class="btn btn-info btn-sm">승인대기</a>
													<a id="proNotlist" class="btn btn-danger btn-sm">승인불가</a>
													<a id="proEndlist" class="btn btn-success btn-sm">승인완료</a>
													<a id="updatePro" class="btn btn-warning btn-sm">수정</a>
													<a id="deletepro" class="btn btn-warning btn-sm">삭제</a>
											</div>
										</div>
										<!-- /.row -->
											<div class="table-responsive">
												<!-- THE MESSAGES -->
												<table class="table table-mailbox" border="1">
													<thead>
														<tr class="unread" align="center" style="background-color: #ccffaa; text-align: center;">
															<th class="name"> 선  택 </th>
															<th class="name"> 부 서 </th>
															<th class="subject"> 프로젝트명 제목(기술등록) </th>
															<th class="time"> 시 작 일 </th>
															<th class="time"> 종 료 일 </th>
															<th class="time"> 가 격(천만원) </th>
															<th class="time">승 인 여 부</th>
															<th class="time"> 승 인 자 </th>
														</tr>
													</thead>
													<tbody id="prolist"><!-- 프로젝트 목록 -->
														<tr>
															<td colspan="8" style="color: red;" align="center"><b>프로잭트가 없습니다.</b></td>
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
								<div id="buttoncontroll" class="pull-right">
								<span id="page"></span>/<span id="total"></span>
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
	<script>
		$(function() { 						// -> 해야됨~~~~~~~!!!!!!
			function updateProOpen(cbox){
				if( window._childwin ){			  // 새창이 띄워져 있을때
				        window._childwin.focus();
				}else{								// 새창이 띄워져 있지 않을때
					var popUrl = "salProDetail?proNum="+cbox;		
					var popOption = "width=390, height=330, resizable=no, scrollbars=no, status=no, dependent=no;";    //팝업창 옵션(optoin)
						window.open(popUrl,"프로젝트 수정 패이지",popOption);
				}
			}
			
			// 수정하는 부분 -> 일반
			$("#updatePro").click(function() {
				var cbox = [];
				var appck = "";
				$("input[name=cbox]:checked").each(function() {
					cbox.push($(this).val());
					appck = $(this).attr("app");
				});
				if(appck != 'O'){
					if(cbox.length == 0){ 		// 한개 선택해 발라는 매시지
						alert('한개 선택해주세요~~');
					}else if(cbox.length == 1){ // 한개만 선택할때 동작하게 하기
						updateProOpen(cbox);
					}else{ 						// 수정할수 있게 하기
						alert('한개만 선택해주세요!!');
					}
				}else{
					alert('승인된 프로젝트 입니다.');
				}
			});
			
			// 삭제하는 부분  -> 팀장
			$("#deletepro").click(function() {
				var cbox = [];
				$("input[name=cbox]:checked").each(function() {
					cbox.push($(this).val());
				});
				if(cbox.length == 0){
					alert('선택해주세요');
				}
				if(cbox.length != 0){		// 삭제 로직
					$(this).attr("href", "proDelete?proIds="+cbox);
				}
			});
			
			// thch 보여주기 및 입력하기
			$("#prolist").on("click", "#proInTech", function() {
				var proid = $(this).attr("proid");
				var proname = $(this).attr("proname");
				var protech = $(this).attr("protech");
				var app = $(this).attr("app");
				//alert(proid+"  "+proname+"  "+protech);
				if(app != 'O'){
					$("#insertProTech").empty();
					$("#insertProTechBtn").empty();
					var protechlist = "<tr><th colspan='2' style='background-color: #ccffaa;text-align: center;'> 기술 등록 </th></tr>"+
									  "<tr><th>프로젝트<br>ID</th><td><input type='hidden' name='proid' value='"+proid+"'/>"+proid+"</td></tr>"+
									  "<tr><th>프로젝트</th><td>"+proname+"</td></tr>"+
									  "<tr><th>기술 LIST</th><td>"+protech+"</td></tr>"+
									  "<tr><th>기술 입력(ID)</th><td><input type='text' name='deptId' /></td></tr>";
					var protechbtn = "<input type='submit' value='입력'><input type='reset' value='리셋'>";
					$("#insertProTech").append(protechlist);
					$("#insertProTechBtn").append(protechbtn);
				}else{
					alert('승인된 프로젝트 입니다.');
				}
			});
			
			// 프로젝트 등록하는 것 -> 팀장 이 할 것
			//var form = ""
		});
	</script>
</body>
</html>
