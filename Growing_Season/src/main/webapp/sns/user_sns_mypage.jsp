<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<section id="content">
	<!---728x90--->
	<div class="container">
		<div class="row" align="center">
			<table border='1' width="1000" height="200" >
				
				<tr align="center">
					<td rowspan="3" width="400"><img src='h.gif' width=""></td>
					<td>taecongs</td>
					<td colspan="2"><button>팔로우</button></td>
				</tr>
				<tr align="center">
					<td><label>게시물</label>1,383</td>
					<td><label>팔로워</label>63.9천</td>
					<td><label>팔로우</label>371</td>
				</tr>
				<tr>
					<td colspan="3">&nbsp;&nbsp; 윤태진의 일상</td>
				<tr>
			</table>
		</div>
		<br>


		<div id="returnFalse" class="row" align="center">
			<c:forEach var="vo" items="${SNS_MYPAGE_LIST}">
				<div class="span4">
					<a href="/snsdetail.do?feseq=${vo.feseq}"> <img
						src="/uploads/${vo.feimgname}"
						style="width: 300px; height: 300px;"></a> <br> <br> <br>
					<br>
				</div>
			</c:forEach>
		</div>

		<div id="returnTrue" class="row" align="center">
			<div class="span4" id="searchRes"></div>
		</div>
	</div>
</section>


