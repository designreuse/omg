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
	$(function(){
		data = [];
		startpage = 1;
		endpage = 0;
		total = 0;
		study = [];
		ck = 0;
		$.ajax({
			url:"supplylistNum",
			dataType: "json",
			async: false,
			success : function(json){
					$.each(json, function(index, items) {
					   study.push(items);
					   
					});
			}
		});
		
		$.ajax({				// 처음 메시지 가져오기
			url: "studylist",	// 변경
			dataType: "json",
			data:  "page="+startpage,
			async: false,
			success : function(json) {
				 if(json != ""){
					data = json;
					$("#studylist").empty();
					$.each(json, function(index, item) {
						var td = "<td><a href='stuList?Num2="+item.studyNum+"'>"+item.studyNum+"</a></td>"+
							"<td><a href='update?num="+item.studyNum+"' id='sName' user='${user.employeeId}' cre='"+item.writer+"'>"+item.studyName+"</a></td>"+
							"<td>"+item.techName+"</td>"+
							"<td>"+item.name+"</td>"+
							"<td>"+item.memberCnt+"</td>"+
							"<td>"+item.studyday+"</td>"+
							"<td>"+item.startDate+"</td>"+
							"<td>"+item.joincnt+"</td>"+
							"<td>";
							for(var i=0; i<study.length;i++){
								if(study[i]== item.studyNum){
									ck = 1; break;
								}
								else{
									ck = 0;
								}
							} 
							if(ck==1){
								td += "<a  id='join' class='btn btn-danger' disabled stuNum='"+item.studyNum+"' user1='${user.employeeId}' cre1='"+item.writer+"' mcnt='"+item.memberCnt+"' cnt='"+item.joincnt+"'>신청</a>";
							} else {
								td += "<a  id='join' class='btn btn-danger'stuNum='"+item.studyNum+"' user1='${user.employeeId}' cre1='"+item.writer+"' mcnt='"+item.memberCnt+"' cnt='"+item.joincnt+"'>신청</a>";
							}
							td += "</td><td><a href='del?writer="+item.writer+"&studyN="+item.studyNum+"' class='btn btn-info' id='del' user2='${user.employeeId}' cre2='"+item.writer+"'>삭제</a></td>";
						$("<tr align='center'>"+td+"</tr>").appendTo($("#studylist")); 
					});
					
					var button = "<button id='nextasc' class='btn btn-sm btn-default disabled'><-</i></button>"+
					 	"<button id='nextdesc' class='btn btn-sm btn-default'>-></i></button>";
						$(button).appendTo($("#pageController"));

				} 
			}
		});
	 
 		
		$.ajax({					// 페이지 총페이지수 구하기
			url: "total" ,
			dataType: "text",
			success : function(text) {
				endpage = parseInt(((text-1) / 10) + 1);
				$("#page").text(startpage);
				$("#total").text(text);
			}
		});
		
		// < 버튼 눌림
		$("#pageController").on("click","#nextasc",function() {
			startpage--;
			if(startpage >= 1){
				$.ajax({
					url: "studylist",
					dataType: "json",
					data :  "page="+startpage,
					success : function(json) {
						if(json != ""){
							$("#studylist").empty();
							$.each(json, function(index, item) {
								var td = "<td><a href='stuList?Num2="+item.studyNum+"'>"+item.studyNum+"</a></td>"+
									"<td><a href='update?num="+item.studyNum+"' id='sName' user='${user.employeeId}' cre='"+item.writer+"'>"+item.studyName+"</a></td>"+
									"<td>"+item.techName+"</td>"+
									"<td>"+item.name+"</td>"+
									"<td>"+item.memberCnt+"</td>"+
									"<td>"+item.studyday+"</td>"+
									"<td>"+item.startDate+"</td>"+
									"<td>"+item.joincnt+"</td>"+
									"<td>";
									for(var i=0; i<study.length;i++){
										if(study[i]== item.studyNum){
											ck = 1; break;
										}
										else{
											ck = 0;
										}
									} 
									if(ck==1){
										td += "<a  id='join' class='btn btn-danger' disabled stuNum='"+item.studyNum+"' user1='${user.employeeId}' cre1='"+item.writer+"' mcnt='"+item.memberCnt+"' cnt='"+item.joincnt+"'>신청</a>";
									} else {
										td += "<a  id='join' class='btn btn-danger'stuNum='"+item.studyNum+"' user1='${user.employeeId}' cre1='"+item.writer+"' mcnt='"+item.memberCnt+"' cnt='"+item.joincnt+"'>신청</a>";
									}
								td +="</td><td><a href='del?writer="+item.writer+"&studyN="+item.studyNum+"' class='btn btn-info' id='del' user2='${user.employeeId}' cre2='"+item.writer+"'>삭제</a></td>";
								$("<tr align='center'>"+td+"</tr>").appendTo($("#studylist")); 
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
		$("#pageController").on("click","#nextdesc",function() {
			startpage++;
			if(startpage <= endpage){
				$.ajax({
					url: "studylist",
					dataType: "json",
					data :  "page="+startpage,
					success : function(json) {
						if(json != ""){
							$("#studylist").empty();
							$.each(json, function(index, item) {
								var td = "<td><a href='stuList?Num2="+item.studyNum+"'>"+item.studyNum+"</a></td>"+
									"<td><a href='update?num="+item.studyNum+"' id='sName' user='${user.employeeId}' cre='"+item.writer+"'>"+item.studyName+"</a></td>"+
									"<td>"+item.techName+"</td>"+
									"<td>"+item.name+"</td>"+
									"<td>"+item.memberCnt+"</td>"+
									"<td>"+item.studyday+"</td>"+
									"<td>"+item.startDate+"</td>"+
									"<td>"+item.joincnt+"</td>"+
									"<td>";
									for(var i=0; i<study.length;i++){
										if(study[i]== item.studyNum){
											ck = 1; break;
										}
										else{
											ck = 0;
										}
									} 
									if(ck==1){
										td += "<a  id='join' class='btn btn-danger' disabled stuNum='"+item.studyNum+"' user1='${user.employeeId}' cre1='"+item.writer+"' mcnt='"+item.memberCnt+"' cnt='"+item.joincnt+"'>신청</a>";
									} else {
										td += "<a  id='join' class='btn btn-danger'stuNum='"+item.studyNum+"' user1='${user.employeeId}' cre1='"+item.writer+"' mcnt='"+item.memberCnt+"' cnt='"+item.joincnt+"'>신청</a>";
									}
								td +="</td><td><a href='del?writer="+item.writer+"&studyN="+item.studyNum+"' class='btn btn-info' id='del' user2='${user.employeeId}' cre2='"+item.writer+"'>삭제</a></td>";
								$("<tr align='center'>"+td+"</tr>").appendTo($("#studylist")); 
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
		
		$("#studylist").on("click", "#join",  function() {
			var mcnt = $(this).attr("mcnt");
			var count = $(this).attr("cnt");
			var creId = $(this).attr("cre1");
			var userId = $(this).attr("user1");
			var stuNum = $(this).attr("stuNum");
			
			if(creId==userId){
				alert("스터디장입니다.");
			}
			else{
				if(mcnt == count){
					alert("인원초과하였습니다.");
				}
				else{
					$.ajax({ 
						url:"join",
						dataType: "text",
						data: "studynum="+stuNum,
						success : function(txt){
						}
					});
				}
			}
			
			
			$(this).attr("href", "index");
		});
		
		
		$("#studylist").on("click", "#del",  function() {
			var creId = $(this).attr("cre2");
			var userId = $(this).attr("user2");
			var txt = "삭제 권한이 없음";
			 
			if(creId != userId){
				alert(txt);
			}
		});
		
		$("#studylist").on("click", "#sName",  function() {
			var creId = $(this).attr("cre");
			var userId = $(this).attr("user");
			var txt = "수정 권한이 없음";
			if(creId != userId){
				alert(txt);
			}
		});
		
	});
</script>

<style>
	th {text-align: center;}
</style>

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
				<h1> <i class="fa fa-laptop"></i>Study 목록</h1>
				<ol class="breadcrumb">
					<li><a href="/company/dashboard/hello"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">스터디</li>
				</ol>
			</section> 

			<!-- Main content -->
			<section class="content">
			<div class="mailbox row">
				<div class="col-xs-12">
					<div class="box" >
						<div class="box-header">
										<h3 class="box-title">Study list</h3>
						</div>
						<div class="box-body table responsive no-padding">
							
							<table id="gode" class="table table-hover">
								<thead>
									<tr>
										<th>NO.</th>
										<th>Study제목</th>
										<th>관련 기술</th>
										<th>스터디장</th>
										<th>제한 인원</th>
										<th>Study day</th>
										<th>시작 날짜</th>
										<th>신청 인원</th>
										<th>신청</th>
										<th>삭제</th>
									</tr>
								</thead>
								<!-- for문으로 목록 전체보기. -->
								<tbody id="studylist">
								</tbody>
							</table>
								
					 	
						</div>
						<div class="box-footer clearfix">
							<span id = pageController style="float: right;">	</span>
								<div class="pull-left">
									<input type="button" class="btn btn-warning" id="add" onclick="location.href='studySupply'" value="new">
									<input type="button"class="btn btn-warning" id="show" onclick="location.href='studyJoinlist'" value="신청한 스터디">
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
