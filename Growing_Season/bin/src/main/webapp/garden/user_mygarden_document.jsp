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


select dseq, apseq, mseq, dname, dregdate, docureturn, dreturncause,
		dreturndate, dfilename as dfileName, dfilesize, dfilepath
		from document where mseq = #{mseq}

		<table>
			<tr>
				<td>신청일</td>
				<td>반려여부</td>
				<td>반려사유</td>
				<td>반려일</td>
				<td>파일명</td>
			</tr>
			<c:forEach items="${LVL_DOCLIST}" var="dlist">
				<tr>
					<td>${dlist.regdate}</td>
					<c:if test="${dlist.docuReturn=='N'}">
						<td>정상</td>
						<td>정상</td>
						<td>정상</td>
					</c:if>
					<c:if test="${dlist.docuReturn=='Y'}">
						<td>반려됨</td>
						<td>${dlist.dreturnCause}</td>
						<td>${dlist.dreturnDate}</td>	
					</c:if>
					<td>파일명</td>
				</tr>
			</c:forEach>
			
		</table>
	</div>



</body>
</html>