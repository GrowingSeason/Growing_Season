<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
#page-wrap {
	margin: 50px;
}
p {
	margin: 20px 0; 
}

	/* 
	Generic Styling, for Desktops/Laptops 
	*/
	table { 
		width: 100%; 
		border-collapse: collapse; 
	}
	/* Zebra striping */
	tr:nth-of-type(odd) { 
		background: #eee; 
	}
	th { 
		background: #333; 
		color: white; 
		font-weight: bold; 
	}
	td, th { 
		padding: 6px; 
		border: 1px solid #ccc; 
		text-align: left; 
	}
</style>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/css/my.css">
</head>
<body>
<h2>회원 리스트</h2><hr>
총 회원수 : ${LVL_COUNT} 명 <br>
<table class="page-wrap">
	<thead>
		<tr>
			<th bgcolor="#cccccc">회원번호</th>
			<th bgcolor="#cccccc">아이디</th>
			<th bgcolor="#cccccc">비밀번호</th>
			<th bgcolor="#cccccc">생년월일</th>
			<th bgcolor="#cccccc">이름</th>
			<th bgcolor="#cccccc">성별</th>
			<th bgcolor="#cccccc">전화번호</th>
			<th bgcolor="#cccccc">이메일</th>
			<th bgcolor="#cccccc">삭제 버튼</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${LVL_LIST}" var="vo">
		<tr>
			<td>${vo.mseq}</td>
			<td><a href="/member/user/memberDetail.do?mseq=${vo.mseq}&currentPage=${LVL_CURRENTPAGE}">${vo.mid}</a></td>
			<td>${vo.mpw}</td>
			<td>${vo.mbirth}</td>
			<td>${vo.mname}</td>
			<td>${vo.mgender}</td>
			<td>${vo.mphone}</td>
			<td>${vo.memail}</td>
			<td><a href="/member/user/memberDelete.do?mseq=${vo.mseq}">삭제</a></td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<br>
${LVL_PAGING}
<br>
<a href="/member/user/memberInput.do">가입페이지</a>
</body>
</html>
