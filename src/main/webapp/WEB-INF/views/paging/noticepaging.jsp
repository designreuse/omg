<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<ul class="pagination pagination-sm">
	
	<!-- 이전 페이지 처리  -->
	<c:choose>
		<c:when test="${page - 10 < 0}"> 
			<li class="disabled"><a href="#"><<</a></li> 
		</c:when>
		
		<c:otherwise> 
			<li><a href="../openlist/${page-10}"><<</a></li> 
		</c:otherwise>
	</c:choose>
	<!-- 페이지 계산의 정수화! -->
	<fmt:parseNumber value="${(page-1) / 10}" integerOnly="true" var="startPage" />
	<fmt:parseNumber value="${ (totalCount-1) / 10 + 1}" integerOnly="true" var="endPage"/>

	<!-- 마지막 페이지 계산(계산된 페이지수와 실제 데이터의 페이지수 비교) -->
	<c:if test ="${startPage + 10 <= endPage}">
		<c:set var="endPage" value="${startPage  + 10}" />
	</c:if> 
	
	<!-- 숫자 페이지! -->
	<c:forEach   var="pageNum" begin="${ startPage * 10 + 1}" end="${endPage}">
		<c:choose>
			<c:when test="${ page == pageNum }">
				<li class="active"><a href="#">${pageNum}</a></li>
			</c:when>
		
			<c:otherwise>
				<li><a href="../openlist/${pageNum}">${pageNum}</a></li>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	
	<!-- 다음 페이지 처리  -->
	<c:choose>
		<c:when test="${page - 10 < 0}"> 
			<li class="disabled"><a href="#">>></a></li> 
		</c:when>
		
		<c:otherwise> 
			<li><a href="../openlist/${page-10}">>></a></li> 
		</c:otherwise>
	</c:choose>
</ul>