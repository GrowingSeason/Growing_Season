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
	<h1>텃밭신청현황확인</h1>
	<div id="all"
		style="width: 80%; margin-top: 100px; margin-bottom: 500px;">
	
	
		<table>
			<tr>
				<td>
				
					<c:if test="${LVL_AWINNER=='N'}">
	    				<h1>아직 추첨이 진행되지 않았습니다.</h1>
	    				<c:forEach items="${LVL_DOCLIST}" var="dlist">
	    					<c:if test="${dlist.dreturnDate!=null}">
	    						반려된 서류가 있습니다. 해당 서류를 다시 제출해주시기 바랍니다.<br>
	    						<a href="/applyGarden/user/applyGarden_document.do" class="my_button">다시 제출하기</a>
	    					</c:if>	    					    				
	    				</c:forEach>
  					</c:if>
  					 
    				<c:if test="${LVL_AWINNER=='W'}">
    					<c:if test="${LVL_PCODE==null||LVL_PCODE=='입금대기'}">
		    				<h1>서울시텃밭 대상자에 선정되셨습니다.<br>
		    				기간 내에 결제를 진행해주시기 바랍니다.</h1>
		    				<a href="/applyGarden/user/applyGarden_payment.do" class="my_button">결제하러 가기</a>
	    				</c:if>
	    				<c:if test="${LVL_PCODE=='입금확인'}">
		    				<h1>서울시텃밭 대상자에 선정되셨습니다.<br>
		    				입금을 완료했습니다.</h1>
	    				</c:if>
	    				나의 구획 :[ㅋㅋㅋ]
    				</c:if>
    				
    				<c:if test="${LVL_AWINNER=='L'}">
	    				<h1>추첨 결과, 서울시텃밭 대상자에 선정되지 않으셨습니다.<br>
	    				내년에 다시 신청해주시기 바랍니다. 감사합니다.</h1>
	    				<a href="" class="my_button">메인으로</a>
    				</c:if>
					
    				
				</td>
			<tr>
		</table>
	</div>



</body>
</html>