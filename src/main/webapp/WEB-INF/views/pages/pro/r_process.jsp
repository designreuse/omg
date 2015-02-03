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
function prolist(page) {		// 프로잭트 리스트 보여주기 페이지 값 받아서 쓰기
	$("#list").empty();
	$.ajax({          			
		url : "runProList",
		dataType : "json",
		data : "page="+page,
		async: false,
		success : function(json) {
			$.each(json, function(index, item) { 
				var td = "<td>"+item.projectName+"</td>"+
						 "<td>"+item.deptName+"</td>"+
						 "<td>"+item.startDate+"</td>"+
						 "<td>"+item.endDate+"</td>"+
						 "<td>"+item.projectPrice+"</td>";
						 if(item.approval == 'O'){
							td +="<td>"+item.approval+"</td>";
						 }else if(item.approval == 'X'){
							td +="<td style='color:red;'>"+item.approval+"</td>";
						 }else{
							td +="<td style='color:blue;'>승인대기</td>";
						 }
					td +="<td><select id='approval' name='approval' proid='"+item.projectId+"' proname='"+item.projectName+"'>"+
						 "<option value=''>-선택-</option>"+
						 "<option value='승인'>승인</option><option value='불가'>불가</option>"+
						 "<option value='STOP'>대기</option></select>";
				$("<tr>"+td+"</tr>").appendTo($("#list"));
			});
		}
	});
}
	
	$(function() {
		function salFun() {
			date = new Date();
			year = date.getFullYear();	//현재 년도
			start = 1995;
			$("#detailview").empty();
			$("#h3").html("<b>매출 관리</b>");
			$("#runProcessAppView").empty();
			$("#btn").empty();
			var sales="<div class='row pad'><div class='input-group'><span style='float: right !important; margin: 10px;'>"
					+"<select id='years' name='years'>";
			
			while(start<=year){
				if(year== date.getFullYear()){
				sales += "<option value="+year+" selected='selected'>"+year+"</option>";					
				} else{
					sales += "<option value="+year+">"+year+"</option>";
				}
				year--;
			}
			
				
			sales +="</select></span></div></div>"
				+"<h3><div id='sales'></div></h3>"
				+"<div class='table-responsive'><table class='table table-bordered' border='1'>"
				+"<thead><tr align='center'><th>부서 이름</th><th>매 출 액</th></tr></thead>"
				+"<tbody>"
				+"<tr><td>개 발 부</td><td><span id='dSale'></span></td></tr>"
				+"<tr><td>유지보수부</td><td><span id='mSale'></span></td></tr>"
				+"</tbody></table></div>";
				
			$(sales).appendTo($("#detailview"));  

			years = $("select[name='years']").val(); 
			$("#sales").empty();
			$("#dSale").empty();
			$("#mSale").empty();
			
			$.ajax({
				url:"p_sumProPrice",
				data:"year="+years,
				dataType:"json",
				async: false,
				success:function(json){
					$("#sales").text(years+"년도 총 매출액: "+json);
				},
				error:function(){
					$("#sales").text(years+"년도 총 매출액: 0");
				}
			});
			
			$.ajax({
				url:"p_sumBydeptProPrice",
				data:"year="+years +"&dept=D",
				dataType:"json",
				async: false,
				success:function(json){
				$("#dSale").text(json);
				} ,
				error:function(){
					$("#dSale").text("-");
				}
			});	
			
			$.ajax({
				url:"p_sumBydeptProPrice",
				data:"year="+years +"&dept=M",
				dataType:"json",
				async: false,
				success:function(json){
					$("#mSale").text(json);
				} ,
				error:function(){
					$("#mSale").text("-");
				}
			});
			
			//select 선택 바뀔때 실행.
			$('#years').change(function(){
				years = $("select[name='years']").val();	
				$("#sales").empty();
				$.ajax({
					url:"p_sumProPrice",
					data:"year="+years,
					dataType:"json",
					async: false,
					success:function(json){
						$("#sales").text(years+"년도 총 매출액: "+json);
					},
					error:function(){
						$("#sales").text(years+"년도 총 매출액: 0");
					}
				});
				$.ajax({
					url:"p_sumBydeptProPrice",
					data:"year="+years +"&dept=D",
					dataType:"json",
					async: false,
					success:function(json){
						$("#dSale").text(json);
					} ,
					error:function(){
						$("#dSale").text("-");
					}
				});		
				$.ajax({
					url:"p_sumBydeptProPrice",
					data:"year="+years +"&dept=M",
					dataType:"json",
					async: false,
					success:function(json){
						$("#mSale").text(json);
					} ,
					error:function(){
						$("#mSale").text("-");
					}
				});				
			});
		}
		
		salFun();
		
		//매출관리 버튼 눌렀을 경우.
		$("#bnt_window").on("click","#sale",function(){
			salFun();
		});
		
		startpage = 1;
		endpage = 0;	
		// < 버튼 눌림
		$("#btn").on("click","#nextasc",function() {
			startpage--;
			if(startpage >= 1){
				prolist(startpage);				// list 함수 부르기 화면 변경
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
		$("#btn").on("click","#nextdesc",function() {
		startpage++;
		if(startpage <= endpage){
			prolist(startpage);				// list 함수 부르기 화면 변경
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
		
		// 직원 조회 버튼 눌림
		$("#emp").click(function() {
			startpage = 1;
			endpage = 0;
			// alert('직원');
		});
		
		// 프로젝트 버튼 눌림
		$("#pro").click(function() {
			var pageview = "<small> 페이지 : <span id='page'></span>/<span id='total'></span></small><span id='buttoncontroll'></span>";
			var h3 = "<b>프로젝트 화면</b>";
			$("#btn").empty();
			$("#runProcessAppView").empty();
			$("#detailview").empty();
			$("#h3").html(h3);
			$("#btn").append(pageview);
			// 승인 버튼 틀 만들어주기
			var runProApp = "<div align='center'><h5 class='box-title' id='h3'><b>프로젝트 승인</b></h5></div>"+
							"<div class='table-responsive' id='apptable'>"+
							"<table class='table table-bordered' border='1' >"+
							"<thead align='left'>"+
							"<tr><th>프로젝트명</th><td><b id='appname'>-</b></td></tr>"+
							"<tr><th>승인여부</th><td id='appCK'>-</td></tr>"+
							"</thead></table><div align='right'>"+
							"<a id='appInBtn' class='btn btn-default btn-sm'>입력</a></div></div>";
			$("#runProcessAppView").append(runProApp);
			
			// 프로젝트 리스트 보여주기
			var proProcess = "<div class='row pad'><div class='input-group' style='float: right !important; margin: 10px;'>"+
							 "</div></div><div class='table-responsive'><table class='table table-bordered' border='1'>"+
							 "<thead><tr align='center'>"+
							 "<th>프로잭트명</th><th>부 서</th><th>시 작 일</th><th>종 료 일</th><th>가 격</th><th>승 인</th><th>승 인 여 부</th>"+
							 "</tr></thead><tbody id='list'></tbody></table></div>";
			$("#detailview").append(proProcess);
			
			startpage = 1;
			endpage = 0;
			prolist(startpage);			// list 함수 부르기
			// 페이징만들어주기
			var button = "<button id='nextasc' class='btn btn-xs btn-primary disabled'><i class='fa fa-caret-left'></i></button>"+
			 			 "<button id='nextdesc' class='btn btn-xs btn-primary disabled'><i class='fa fa-caret-right'></i></button>";
			$(button).appendTo($("#buttoncontroll"));
			
			$.ajax({					// ProjectList 페이지 총페이지수 구하기
				url: "runProTotle" ,
				dataType: "text",
				async: false,
				success : function(text) {
					endpage = parseInt(((text-1) / 10) + 1);
					if(text > 10){
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
		
		// 프로젝트 (승인,불가,대기) 입력하는 것
		$("#runProcessAppView").on("click", "#appInBtn",function() {
			var proid = $(this).attr("proid");
			var app = $(this).attr("app");
			$.ajax({
				url: "appInsert",
				dataType: "text",
				data: "proid="+proid+"&app="+app,
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				type: "post",
				success: function(txt) {
					if(txt != ""){
						alert("승인상태가 변경되었습니다.");
					}else{
						alert("변경이 안됬습니다.");
					}
					prolist(startpage);		// list 함수 부르기 화면 변경
				}
			}); 
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
				<h1><i class="fa fa-th-list"></i> <b>경영 부서 업무</b></h1>
				<ol class="breadcrumb">
					<li><a href="/company/notice/index"><i
							class="fa fa-dashboard"></i>Home</a></li>
					<li class="active">경영 부서 업무</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="mailbox row">
					<div class="col-xs-12">
						<div class="box box-solid">
							<div class="box-body">
								<div class="row" >
									<div class="col-md-2 col-sm-4" id="bnt_window" >
										<div class="box-header">
											<h3 class="box-title" id="h3"><b>매출 조회</b></h3>
										</div><div style="margin: 10px;">
											<a id="sale" class="btn btn-warning btn-flat">매출조회</a>
										</div><div style="margin: 10px;">
											<a id="pro" class="btn btn-success btn-flat">프로젝트</a>
										</div>
										
										<!-- 프로젝트 승인 하는 것을 보여주는 화면-->
										<div style="bottom: 0px;" id='runProcessAppView'>
										</div>
									</div>
									
									<!-- 버튼을 누르고 나오는 자세한 화면들 -->
									<div id="detailview" class="col-md-10 col-sm-8">
									</div>
									<!-- /.col (RIGHT) -->
								</div>
								<!-- /.row -->
							</div>
							<!-- /.box-body -->
							<div class="box-footer clearfix" >
								<div class="pull-right" id="btn">
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

<script	src="//ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js" type="text/javascript"></script>
<!-- AdminLTE App -->
<script src="/company/resources/js/AdminLTE/app.js"	type="text/javascript"></script>
	<!-- AdminLTE for demo purposes -->
<script src="/company/resources/js/AdminLTE/demo.js" type="text/javascript"></script>
<script>
	$(function() {
		$("#detailview").on("change", "#approval", function() {
			var proid = $(this).attr("proid");
			var proname = $(this).attr("proname");
			var approval = $(this).val();
			if(approval != ""){
				$("#appname").text(proname);
				$("#appCK").text(approval);
				$("#appInBtn").attr("proid", proid);
				$("#appInBtn").attr("app",approval);
			}else{
				$("#appInBtn").removeAttr("proid");
				$("#appInBtn").removeAttr("app");
				$("#appname").text('-');
				$("#appCK").text('-');
			}
		});
	});
</script> 
	
</body>
</html>