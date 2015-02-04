<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script src="/company/resources/js/jquery-1.11.2.js"></script>
		<script>
		/*그냥 서버가 시작되면 실행되게하려고 쓴다  */	
		$(function(){
			startpage = 1;
			endpage = 0;
			total = 0;
			var button ="";
			$.ajax({
				url: "deptlist/1",
				data : "dept=O&checked=O", //보낼때의 값이다 index/1?dept= 의 주소에 값을 넣을때 쓴다
				dataType: "json",
				success: function(json){
					console.log(json);
					$("#list").empty();//class="list" 의 자리에 넣는데 처음에 빈것으로 넣는다는뜻
					var str = ""; // str 선언해줌
					$.each(json, function(index, item) { //index는 무엇인지?
						str += "<tr>";
						str += "<td>" + item.notice_num + "</td>";
						str += "<td>" +"<a href='noticeDetail?notice_num="+item.notice_num+"'>"+item.title+"</a>"+"</td>";
						str += "<td>" +item.credate + "</td>";
						str += "<td>" +item.writerName+"</td>";
						str += "<td>" +item.count+"</td>";
						str += "</tr>"; 
						button = "<button id='nextasc' class='btn btn-sm btn-default disabled' dept='"+item.checked+"' check='"+item.checked+"'><-</i></button>"+
		 				 		 "<button id='nextdesc' class='btn btn-sm btn-default' dept='"+item.checked+"' check='"+item.checked+"' >-></i></button>";
					});
					
					$("#list").append(str);
					$(button).appendTo($("#pageController"));
					
				},
				
				error: function(){
					
					console.log("애러임더");
				}
			});
			
			
			//권한을 줘서 각각의 필요로하는 게시판에 들어가기
			$.ajax({
				url : "checkDept",
				dataType: "text",
				success : function(txt) {
					if(txt == "M"){						// 유지보수
						$("#manage").removeClass("disabled");
						$("#open").removeClass("disabled");
						$("#run").parent().empty();
						$("#development").parent().empty();
					}else if(txt == "R"){				// 경영
						$("#open").removeClass("disabled");
						$("#run").removeClass("disabled");
						$("#salary").removeClass("disabled");
						$("#person").removeClass("disabled");
						$("#manage").parent().empty();
						$("#development").parent().empty();
					}else if(txt == "D"){				// 개발
						$("#development").removeClass("disabled");
						$("#open").removeClass("disabled");
						$("#manage").parent().empty();
						$("#run").parent().empty();
					}
				}
			});
			
			
			/*여기서부터가 페이징하는거  */
    		$.ajax({					// 페이지 총페이지수 구하기
    			url: "total" ,
    			dataType: "text",
    			data:"dept=O&checked=O",
    			success : function(text) {
    				endpage = parseInt(((text-1) / 10) + 1);
    			}
    		});
			
	
		/*부서별로 리스트뿌리기  */
			function selectDept(dept, checked) {
				$("#pageController").empty();
				var button = "";
    			$.ajax({
    				url: "deptlist/1",
					data : "dept=" + dept+"&checked="+checked, //보낼때의 값이다 index/1?dept= 의 주소에 값을 넣을때 쓴다
    				dataType: "json",
    				success: function(json){
    					console.log(json);
    					$("#list").empty();
    					var str = "";
    					$.each(json, function(index, item) {
    						 
    						str += "<tr>";
    						str += "<td>" + item.notice_num + "</td>";
    						str += "<td>" +"<a href='noticeDetail?notice_num="+item.notice_num+"'>"+item.title+"</a>"+"</td>";
    						str += "<td>" +item.credate + "</td>";
    						str += "<td>" +item.writerName+"</td>";
    						str += "<td>" +item.count+"</td>";
    						str += "</tr>"; 
    						if(checked == 'O'){
    							button = "<button id='nextasc' class='btn btn-sm btn-default disabled' dept='"+item.checked+"' check='"+item.checked+"'><-</i></button>"+
			 				 			"<button id='nextdesc' class='btn btn-sm btn-default' dept='"+item.checked+"' check='"+item.checked+"' >-></i></button>";
    						}else{
    							button = "<button id='nextasc2' class='btn btn-sm btn-default disabled' dept='"+item.departmentId+"' check='"+item.checked+"'><-</i></button>"+
 				 					 "<button id='nextdesc2' class='btn btn-sm btn-default' dept='"+item.departmentId+"' check='"+item.checked+"' >-></i></button>";
    						}
    					});
    					$("#list").append(str);
    					
						$(button).appendTo($("#pageController"));
    				}
    			});
    			
    			// 페이지 총페이지수 구하기
    			
    			$.ajax({				
        			url: "total" ,
        			dataType: "text",
        			data : "dept=" + dept+"&checked="+checked,
        			success : function(text) {
        				endpage = parseInt(((text-1) / 10) + 1);
        				$("#page").text(startpage);
        				$("#total").text(text);
        			}
        		});
    		}
    		
    		$("#development").click(function(){
    			selectDept("D","D");
    		});
    		
    		$("#run").click(function(){
    			selectDept("R","R");
    		});

    		$("#open").click(function(){
    			selectDept("O","O");
    		});

    		$("#person").click(function(){
    			selectDept("R","P");
    		});

    		$("#salary").click(function(){
    			selectDept("R","S");
    		});
    		
    		$("#manage").click(function(){
    			selectDept("M","M");
    		});
    		
    		
    		// 초기버전< 버튼 눌림
    		$("#pageController").on("click","#nextasc",function() {
    			var dept = $(this).attr("dept");
    			var checked=$(this).attr("check");
    			startpage--;
    			if(startpage >= 1){
    				$.ajax({
        				url: "deptlist/"+startpage,
    					data : "dept=" + dept+"&checked="+checked, //보낼때의 값이다 index/1?dept= 의 주소에 값을 넣을때 쓴다
        				dataType: "json",
        				success: function(json){
        					console.log(json);
        					$("#list").empty();
        					var str = "";
        					$.each(json, function(index, item) {
        						 
        						str += "<tr>";
        						str += "<td>" + item.notice_num + "</td>";
        						str += "<td>" +"<a href='noticeDetail?notice_num="+item.notice_num+"'>"+item.title+"</a>"+"</td>";
        						str += "<td>" +item.credate + "</td>";
        						str += "<td>" +item.writerName+"</td>";
        						str += "<td>" +item.count+"</td>";
        						str += "</tr>"; 
           					});
        					$("#list").append(str);
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
    		
    		
    		
    		// > 초기버전버튼 눌림	
    		$("#pageController").on("click","#nextdesc",function() {
    			var dept = $(this).attr("dept");
    			var checked=$(this).attr("check");
    			startpage++;
    			if(startpage <= endpage){
    				$.ajax({
        				url: "deptlist/"+startpage,
    					data : "dept=" + dept+"&checked="+checked, //보낼때의 값이다 index/1?dept= 의 주소에 값을 넣을때 쓴다
        				dataType: "json",
        				success: function(json){
        					console.log(json);
        					$("#list").empty();
        					var str = "";
        					$.each(json, function(index, item) {
        						 
        						str += "<tr>";
        						str += "<td>" + item.notice_num + "</td>";
        						str += "<td>" +"<a href='noticeDetail?notice_num="+item.notice_num+"'>"+item.title+"</a>"+"</td>";
        						str += "<td>" +item.credate + "</td>";
        						str += "<td>" +item.writerName+"</td>";
        						str += "<td>" +item.count+"</td>";
        						str += "</tr>"; 
         					});
        					$("#list").append(str);
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
    		
    		
    		
    		// dept마다< 버튼 눌림
    		$("#pageController").on("click","#nextasc2",function() {
    			var dept = $(this).attr("dept");
    			var checked=$(this).attr("check");
    			startpage--;
    			if(startpage >= 1){
    				$.ajax({
        				url: "deptlist/"+startpage,
    					data : "dept=" + dept+"&checked="+checked, //보낼때의 값이다 index/1?dept= 의 주소에 값을 넣을때 쓴다
        				dataType: "json",
        				success: function(json){
        					console.log(json);
        					$("#list").empty();
        					var str = "";
        					$.each(json, function(index, item) {
        						 
        						str += "<tr>";
        						str += "<td>" + item.notice_num + "</td>";
        						str += "<td>" +"<a href='noticeDetail?notice_num="+item.notice_num+"'>"+item.title+"</a>"+"</td>";
        						str += "<td>" +item.credate + "</td>";
        						str += "<td>" +item.writerName+"</td>";
        						str += "<td>" +item.count+"</td>";
        						str += "</tr>"; 
           					});
        					$("#list").append(str);
        				}
        			});
    				$("#nextdesc2").removeClass("disabled");
    				$("#page").text(startpage);
    				if(startpage == 1){
    					$("#nextasc2").addClass("disabled");
    					$("#nextdesc2").removeClass("disabled");
    				}
    			}else{
    				startpage++;
    			}
    		});
    		
    		
    		
    		// dept마다> 버튼 눌림	
    		$("#pageController").on("click","#nextdesc2",function() {
    			var dept = $(this).attr("dept");
    			var checked=$(this).attr("check");
    			startpage++;
    			if(startpage <= endpage){
    				$.ajax({
        				url: "deptlist/"+startpage,
    					data : "dept=" + dept+"&checked="+checked, //보낼때의 값이다 index/1?dept= 의 주소에 값을 넣을때 쓴다
        				dataType: "json",
        				success: function(json){
        					console.log(json);
        					$("#list").empty();
        					var str = "";
        					$.each(json, function(index, item) {
        						 
        						str += "<tr>";
        						str += "<td>" + item.notice_num + "</td>";
        						str += "<td>" +"<a href='noticeDetail?notice_num="+item.notice_num+"'>"+item.title+"</a>"+"</td>";
        						str += "<td>" +item.credate + "</td>";
        						str += "<td>" +item.writerName+"</td>";
        						str += "<td>" +item.count+"</td>";
        						str += "</tr>"; 
         					});
        					$("#list").append(str);
        				}
        			});
    				$("#nextasc2").removeClass("disabled");
    				$("#page").text(startpage);
    				if(startpage == endpage){
    					$("#nextdesc2").addClass("disabled");
    					$("#nextasc2").removeClass("disabled");
    				}
    			}else{
    				startpage--;
    			}
    		});
    		
    		
	  	});
    	
    	</script>
								
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
				<h1><i class="fa fa-bullhorn"></i>공지게시판</h1>
				<ol class="breadcrumb">
					<li><a href="/company/notice/index"><i class="fa fa-dashboard"></i>
							Home</a></li>
					<li class="active">공지사항</li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">게시글</h3>
								<span style="float: right !important; margin: 10px;">
									<button value="O" id="open" class="btn btn-default btn-flat disabled" user="${user.departmentId}">공지사항</button>
									<span>
										<button value="D" id="development" class="btn btn-primary btn-flat disabled" user="${user.departmentId}">개발</button></a>
									</span>
									<span>
										<button value="M" id="manage"class="btn btn-success btn-flat disabled" user="${user.departmentId}">유지보수</button>
									</span>
									<span>
										<button value="R" id="run" class="btn btn-info btn-flat disabled" user="${user.departmentId}">경영</button>
										<button value="P" id="person" class="btn btn-danger btn-flat disabled" user="${user.departmentId}">인사회계</button>
										<button value="S" id="salary" class="btn btn-warning btn-flat disabled" user="${user.departmentId}">영업</button>
									</span>
								</span>
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
									<tbody id="list"><!--tbody는 ajax에서 쓸때 어디부분했는지를 알기위해  -->
									</tbody>
								</table>

								<div class="row">
									<div class="col-xs-6">
										<a href="write" class="btn btn-primary btn-sm">글쓰기</a>
									</div>
									<div class="col-xs-6">
										<div class="pagination no-margin">
											<span id = pageController style="float: right;"></span>
										</div>
									</div>
								</div>
								<!-- /.box-body -->
							</div>
							<!-- /.box -->
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
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"	type="text/javascript"></script>
	<!-- AdminLTE App -->
	<script src="/company/resources/js/AdminLTE/app.js"	type="text/javascript"></script>
	<!-- Bootstrap WYSIHTML5 -->
	<script	src="/company/resources/js/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"	type="text/javascript"></script>
	<!-- iCheck -->
	<script	src="/company/resources/js/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
</body>
</html>