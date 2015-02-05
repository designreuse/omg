<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
		function startview() {
			$("#btnposition").empty();
			$.ajax({          			// 프로잭트 기술 보여주기
				url : "techlist",
				dataType : "json",
				success : function(json){
					$("#selectTechList").empty();
					var option = "";
					if(json != ""){
						$.each(json, function(index, item) {
							option += "<option value="+item+">"+item+"</option>";
						});
						var btn = "<a id='inbtn' class='btn btn-success btn-sm'>입력</a>";
						$(option).appendTo($("#selectTechList"));
						$("#btnposition").append(btn);
					}else{
						 option = "<option value=''>없는 기술이 없습니다.</option>";
						 $(option).appendTo($("#selectTechList"));	
					}
				}
			});
		}		
		
		startview();
		$("#btnposition").on("click","#inbtn",function(){
			var userid = $(this).parent().parent().find("#selectTechList").attr("userId");
			var techName = $(this).parent().parent().find("#selectTechList").val();
			$.ajax({
				url: "myInTech",
				dataTypy: "text",
				data: "myid="+userid+"&techName="+techName,
				success: function(txt) {
				}
			});
			$(this).attr("href", "myTechDetail?employeeId="+userid);
		});
	});
</script>
</head>
<body style="size: 400px;">
	<div class="row invoice-info">
		<div class="col-md-10" >
			<h3>내 정보</h3>
		</div>
		<br>
		<div class="col-md-2" style="background-color: #f0f7fd; border-left: 10px solid #eee; border-color: #d0e3f0; font-family: 'Jeju Gothic', serif; font-size: 14pt">
			<div class="btn-group open" >
      			<b>내가 가지고 있는 기술</b>
      			<ul>
       				<c:forEach var="techlist" items="${techlist}">
						<li>
							<a>${techlist.techName}</a>
						</li>
					</c:forEach>
				</ul>
			</div>
		<br><br>
		<div>
			<select id="selectTechList" userId="${user.employeeId}">
			</select>
			<span id="btnposition"></span>
		</div>
		</div>
		<div class="col-xs-12" align="center">
			<a href="index" class="btn btn-default"  style="font-size:12pt">뒤로</a>
		</div>
	</div>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>