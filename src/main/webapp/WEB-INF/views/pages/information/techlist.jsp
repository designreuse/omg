<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table class="table table-bordered" border="1">

		<thead>
			<tr>
				<th>기술 이름</th>
			</tr>
		</thead>
		<c:forEach var="techlist" items="${techlist}">
			<tr>
				<td>${techlist.techName}</td>
			</tr>
		</c:forEach>
		</tbody>


	</table>
	<br><br>
	<a href="index">
	<button class="btn btn-default"  style="font-size:12pt">뒤로</button>
	</a>
</body>
</html>