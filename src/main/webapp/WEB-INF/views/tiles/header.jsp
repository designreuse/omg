<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/company/resources/js/jquery-1.11.2.js"></script>
<script>
	$(function() {
		var num = 0;
		page = 1;
		$.ajax({				// 처음 메시지 가져오기
			url: "/company/message/Msglist",	// 변경
			dataType: "json",
			data :  "page="+page,
			success : function(json) {
				if(json != ""){
					$("#msglist").empty();
					$.each(json, function(index, item) {
						num ++;
						var msg = "<a href='/company/message/index'>"+
						"<div class='pull-left'><img src='${image}' class='img-circle' alt='User Image' /></div>"+
								  "<h4><b>"+item.sendName+"</b><small><i class='fa fa-clock-o'></i>"+item.credate+"</small></h4>"+
								  "<p>"+item.title+"</p></a>";
						$(msg).appendTo($("#smailMsglist")); 
					});
				}
				$("#cnt").text(num);
			}
		});
	});
	function popupOpen(){
		if( window._childwin ){			  // 새창이 띄워져 있을때
	        window._childwin.focus();
		}else{					
			var popUrl = "/company/my/index";	//팝업창에 출력될 페이지 URL
			var popOption = "width=400, height=400, resizable=no, scrollbars=no, status=no, dependent=no, location=no;";    //팝업창 옵션(optoin)
				window.open(popUrl,"",popOption);
		}
	}
</script>
<header class="header">
	<a href="/company/notice/index" class="logo"> <!-- 화면 로그 --> <!-- Add the class icon to your logo image or logo icon to add the margining -->
		OMG Smart Pro
	</a>
	<!-- Header Navbar: style can be found in header.less -->
	<!-- 가장 위에 -->
	<nav class="navbar navbar-static-top" role="navigation">
		<!-- Sidebar toggle button-->
		<a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas"
			role="button"> <span class="sr-only">Toggle navigation</span> <span
			class="icon-bar"></span> <span class="icon-bar"></span> <span
			class="icon-bar"></span>
		</a>
		<div class="navbar-right">
			<ul class="	nav navbar-nav">
				<!-- Messages: style can be found in dropdown.less-->
				<li class="dropdown messages-menu"><a class="dropdown-toggle" data-toggle="dropdown"> <i
						class="fa fa-envelope"></i> <span class="label label-success"><span id='cnt'></span></span>
				</a>
					<ul class="dropdown-menu">
						<li class="header">[${user.name}]님이 받으신 최근 메시지 입니다.</li>
						<li>
							<!-- inner menu: contains the actual data -->
							<ul class="menu">
								<li id='smailMsglist'>
									<!-- start message -->
								</li>
								<!-- end message -->
							</ul>
						</li>
						<li class="footer"><a href="/company/message/index">모든
								매세지 보기</a></li>
					</ul></li>
				<!-- Notifications: style can be found in dropdown.less -->
				<!-- Tasks: style can be found in dropdown.less -->
				<!-- User Account: style can be found in dropdown.less -->
				<li class="dropdown user user-menu"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> <i
						class="glyphicon glyphicon-user"></i> <span>
							${user.name}[${permit}(${user.employeeId})] <i class="caret"></i>
					</span>
					</a>
					<ul class="dropdown-menu">
					<!-- User image -->
						<li class="user-header bg-light-blue"><img
							src="${image}" class="img-circle"
							alt="User Image" />
							<p>
								<small>(권한) ${permit}</small>
								${user.name} <small>사원번호. ${user.employeeId}  </small>
							</p>
						</li>
					<!-- Menu Footer-->
						<li class="user-footer">
							<div class="pull-left">
								<a href="javascript:popupOpen();" class="btn btn-default btn-flat">내정보
									보기</a>
							</div>
							<div class="pull-right">
								<a href="/company/logout" class="btn btn-default btn-flat">로그인
									아웃</a>
							</div>
						</li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
</header>