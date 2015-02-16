<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<aside class="left-side sidebar-offcanvas">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">
		<!-- Sidebar user panel -->
		<div class="user-panel">
			<div class="pull-left image">
				<img src="${image}" class="img-circle"
					alt="User Image" />
			</div>
			<div class="pull-left info">
				<p>환영합니다.</p>
				<h4><b>${user.name}님</b></h4>
				<!-- 폰트 수정 남음 -->
			</div>
		</div>
		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu">
			<li><a href="/company/notice/index"> <i
					class="fa fa-bullhorn"></i> <span>공지사항</span>
			</a></li>
			<li><a href="/company/freeboard/index"> <i
					class="fa  fa-twitch"></i> <span>자유게시판</span> <!-- <small
					class="badge pull-right bg-green">new</small> -->
			</a></li>
			<li><a href="/company/studys/index"> <i
					class="fa fa-laptop"></i> <span>스터디</span>
			</a></li>
			<li><a href="/company/message/index"> <i
					class="fa fa-envelope"></i> <span>메세지함</span>
			</a></li>
			<li><a href="/company/process/index"> <i
					class="fa fa-th-list"></i> <span>업무</span>
			</a></li><!-- 
			<li id="cal"><a href="/company/calendar/index"> <i
					class="fa fa-calendar"></i> <span>일정</span>
			</a></li> -->
			<li><a href="/company/empinfo/index"> <i
					class="fa  fa-users"></i> <span>연락처</span>
			</a></li>
		</ul>
	</section>
	<!-- /.sidebar -->
</aside>