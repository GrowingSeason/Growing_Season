<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>상세보기</h3>
	<hr>
	<form name="myForm" class="myForm" action="/memberDetail.do"
		enctype="multipart/form-data">
		<table class="demo-table">
			<tr>
				<td id="title">아이디</td>
				<td>${LVL_VO.mid} ${LVL_VO.mseq}</td>
			</tr>
			<tr>
				<td id="title">비밀번호</td>
				<td>${LVL_VO.mpw}</td>
			</tr>
			<tr>
				<td id="title">이름</td>
				<td>${LVL_VO.mname}</td>
			</tr>
			<tr>
				<td id="title">생년월일</td>
				<td>${LVL_VO.mbirth}</td>
			</tr>
			<tr>
				<td id="title">성별</td>
				<td>${LVL_VO.mgender}</td>
			</tr>
			<tr>
				<td id="title">전화번호</td>
				<td>${LVL_VO.mphone}</td>
			</tr>
			<tr>
				<td id="title">주소</td>
				<td>${LVL_VO.maddress}</td>
			</tr>
			<tr>
				<td id="title">이메일</td>
				<td>${LVL_VO.memail}</td>
			</tr>
			<tr>
				<td id="title">메일링 수신여부</td>
				<td>${LVL_VO.mmailreceive}</td>
			</tr>
		</table>
		<br><a href="/memberUpdateForJSP.do?mseq=${LVL_VO.mseq}&currentPage=${LVL_VO.currentPage}">수정하러 가즈아</a>
</body>
</html>