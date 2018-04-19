<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="body" style="height: 1300px; margin: 20px; margin-right: 0px;" class="wthree_testimonials_grid_main">
		<h1 id="h1.-bootstrap-heading" style="color: green; margin-top: 50px;">
			서울시텃밭 신청<a class="anchorjs-link" href="#h1.-bootstrap-heading"><span
				class="anchorjs-icon"></span></a>
		</h1>
		
		<div style="align:center;"><img alt="applyLevel" src="/images/applygarden_step1.png">
		</div>
		<br>
		<form action="/applyGarden/user/applyGarden_step2.do" method="post">
		<table class="table table-striped"
			style="border-style: groove; width: 700px;">
			<tbody>
				<tr>
					<td align="center" style="width: 200px;"><h1>이름 APNAME</h1></td>
					<td align="center" style="width: 500px;"><h1>세션.이름</h1></td>					
				</tr>
				<tr>
					<td align="center" style="width: 200px;"><h1>APPHONE</h1></td>
					<td align="center" style="width: 500px;"><h1>세션.전화번호</h1></td>
				</tr>
				<tr>
					<td align="center" style="width: 200px;"><h1>APEMAIL</h1></td>
					<td align="center" style="width: 500px;"><h1>세션.이메일</h1></td>
				</tr>
				<tr>
					<td align="center" style="width: 200px;"><h1>MSEQ</h1></td>
					<td align="center" style="width: 500px;"><h1>세션.생년월일</h1></td>
				</tr>

			</tbody>
			<tr>
			  <td colspan="2" align="right"><input type="submit" class="btn btn-default" value="다음단계로"></td>
			</tr>
		</table>
		
		</form>
	</div>

</body>
</html>