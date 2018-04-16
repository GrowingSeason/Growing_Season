<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.my_button {
	display: inline-block;
	width: 200px;
	text-align: center;
	padding: 10px;
	background-color: #006BCC;
	color: #fff;
	text-decoration: none;
	border-radius: 5px;
}
</style>

</head>
<body>
	<h1>서류현황</h1>
	<div id="all"
		style="width: 80%; margin-top: 100px; margin-bottom: 500px;">

		<table width="100%" border="1">
			<thead>
				<th>신청일</th>
				<th>반려여부</th>
				<th>반려사유</th>
				<th>반려일</th>
				<th>파일명</th>
				<th>비고</th>
			</thead>
			<c:forEach items="${LVL_DOCLIST}" var="dlist">
				<tr>
					<td>${dlist.dregdate}</td>
					<c:if test="${dlist.docuReturn=='N'}">
						<td>정상</td>
						<td>정상</td>
						<td>정상</td>
						<td>${dlist.dfileName}</td>
						<td></td>
					</c:if>
					<c:if test="${dlist.docuReturn=='Y'}">
						<td>반려됨</td>
						<td>${dlist.dreturnCause}</td>
						<td>${dlist.dreturnDate}</td>
						<td>${dlist.dfileName}</td>
						<td><button id="re">재제출</button></td>
					</c:if>

				</tr>
			</c:forEach>
			
		</table>
	</div>



</body>
</html>