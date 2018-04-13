<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/my.css">

<script>
	function goPage() {
		location.href = "/common.do";
	}
</script>
<script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>

</head>
<body>
	<h3>수정하기</h3>
	<hr>
	
	<form name="myForm" class="myForm" id="myForm" action="/memberUpdate.do" method="post">
	<input type="hidden" name="mseq" value="${LVL_VO.mseq}">
	<input type="hidden" name="currentPage" value="${LVL_VO.currentPage}">
		<table class="demo-table">
			<tr>
				<td id="title">아이디</td>
				<td>${LVL_VO.mid}</td>
			</tr>
			<tr>
				<td id="title">비밀번호</td>
				<td><input type="password" name="mpw" value="${LVL_VO.mpw}"></td>
			</tr>
			<tr>
				<td id="title">이름</td>
				<td><input type="text" name="mname" value="${LVL_VO.mname}"></td>
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
				<td><input type="text" name="mphone" value="${LVL_VO.mphone}"></td>
			</tr>
			<tr>
				<td id="title">주소</td>
				<td><input type="text" name="maddress"
					value="${LVL_VO.maddress}"></td>
			</tr>
			<tr>
				<td id="title">이메일</td>
				<td><input type="text" name="memail" value="${LVL_VO.memail}"></td>
			</tr>
			<tr>
				<td id="title">메일링 수신여부</td>
				<td>
					<input type="radio" name="mmailreceive" value="Y" checked>예
					<input type="radio" name="mmailreceive" value="N">아니오</td>
				</td>
			</tr>
		</table>
		<input type="submit" value="저장!"> 
		<input type="button"
			value="취소" onclick="goPage()">
	</form>
</body>
</html>