<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.kosmo.member.MemberServiceImpl" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String mid=request.getParameter("mid");
	System.out.print(mid);
	String str="";
	
	try{
		boolean isCheck=dao.memID(mid);
		if(isCheck){
			str="NO";
			out.print(str);
		}else{
			str="YES";
			out.print(str);
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
</body>
</html>