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
	<div id="all"
		style="width: 80%; margin-top: 100px; margin-bottom: 500px;">

			<h1>결제페이지에요.</h1>
			
			
			<form method="post" action="/applyGarden/user/applyGarden_payexecute.do">
			<input type="hidden" name="pay" value="true"/>
			<input type="submit" class="btn" id="pay_button" value="결제버튼"/>
			</form>
			
	</div>



</body>
</html>